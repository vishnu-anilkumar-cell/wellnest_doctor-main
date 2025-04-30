import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellnest_doctor/Application/edit_profile/editprofile_cubit.dart';
import 'package:wellnest_doctor/Application/profile/profile_cubit.dart';
import 'package:wellnest_doctor/Domain/Failure/failure.dart';
import 'package:wellnest_doctor/Domain/Profile/profile_model.dart';
import 'package:wellnest_doctor/Presentation/common_widgets/snacbar.dart';
import 'package:wellnest_doctor/Presentation/constants/loading.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _specializationController =
      TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _patientsTreatedController =
      TextEditingController();
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileCubit>(context).getProfile();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return BlocConsumer<EditprofileCubit, EditprofileState>(
      listener: (context, state) {
        state.isFailureOrSuccessForUpdate.fold(
          () {},
          (either) => either.fold(
            (failure) {
              if (!state.isLoading) {
                if (failure == const MainFailure.serverFailure()) {
                  displaySnackBar(context: context, text: "Server is down");
                } else if (failure == const MainFailure.clientFailure()) {
                  displaySnackBar(
                      context: context,
                      text: "Something wrong with your network");
                } else {
                  displaySnackBar(
                      context: context, text: "Something Unexpected Happened");
                }
              }
            },
            (r) {
              BlocProvider.of<ProfileCubit>(context).getProfile();
              Navigator.of(context).pop();
            },
          ),
        );
      },
      builder: (context, state) {
        if (state.isLoading) {
          return const Scaffold(
            body: Center(
              child: spinkit,
            ),
          );
        }
        return BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            state.isFailureOrSuccessForGet.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  if (!state.isLoading) {
                    if (failure == const MainFailure.serverFailure()) {
                      displaySnackBar(context: context, text: "Server is down");
                    } else if (failure == const MainFailure.clientFailure()) {
                      displaySnackBar(
                          context: context,
                          text: "Something wrong with your network");
                    } else {
                      displaySnackBar(
                          context: context,
                          text: "Something Unexpected Happened");
                    }
                  }
                },
                (r) {
                  _nameController.text = r.name ?? "XXXX";
                  _specializationController.text = r.specialization ?? "XXXX";
                  _experienceController.text = r.experence ?? "00";
                  _patientsTreatedController.text =
                      r.patents?.toString() ?? "00";
                  _educationController.text = r.education ?? "XXXX";
                  _aboutController.text = r.about ?? "XXXX";
                },
              ),
            );
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const Scaffold(
                body: Center(
                  child: spinkit,
                ),
              );
            }

            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                title: Text('Edit Profile',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ))),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: size * 0.02, bottom: size * 0.01),
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<EditprofileCubit>(context)
                            .updateProfile(
                                profileModel: ProfileModel(
                                    name: _nameController.text,
                                    specialization:
                                        _specializationController.text,
                                    experience: _experienceController.text,
                                    patients: _patientsTreatedController.text,
                                    education: _educationController.text,
                                    about: _aboutController.text));
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(
                            color: Color.fromARGB(255, 66, 159, 69),
                            fontSize: 17),
                      ),
                    ),
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      _TextFieldWithTitle(
                        title: "Name",
                        controller: _nameController,
                      ),
                      _TextFieldWithTitle(
                        title: "Specialization",
                        controller: _specializationController,
                      ),
                      _TextFieldWithTitle(
                        title: "Experience",
                        controller: _experienceController,
                      ),
                      _TextFieldWithTitle(
                        title: "Patients Treated",
                        controller: _patientsTreatedController,
                      ),
                      _TextFieldWithTitle(
                        title: "Education",
                        controller: _educationController,
                      ),
                      _TextFieldWithTitle(
                        title: "About",
                        controller: _aboutController,
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _TextFieldWithTitle extends StatelessWidget {
  const _TextFieldWithTitle({required this.title, required this.controller});
  final String title;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, height: 0.1),
        ),
        TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
            ),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
