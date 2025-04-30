import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:wellnest_doctor/Application/edit_profile/editprofile_cubit.dart';
import 'package:wellnest_doctor/Application/home/home_cubit.dart';
import 'package:wellnest_doctor/Application/loggedin/loggedin_cubit.dart';
import 'package:wellnest_doctor/Application/message/message_cubit.dart';
import 'package:wellnest_doctor/Application/profile/profile_cubit.dart';
import 'package:wellnest_doctor/Application/signin/signin_cubit.dart';
import 'package:wellnest_doctor/Application/signup/signup_cubit.dart';
import 'package:wellnest_doctor/Constant/injectable/injectable.dart';
import 'package:wellnest_doctor/Presentation/Splash/splash.dart';


void main(List<String> args) async {
  await configureInjection(Environment.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SigninCubit>(create: (context) => getIt<SigninCubit>()),
        BlocProvider<HomeCubit>(create: (context) => getIt<HomeCubit>()),
        BlocProvider<SignupCubit>(create: (context) => getIt<SignupCubit>()),
        BlocProvider<LoggedinCubit>(
            create: (context) => getIt<LoggedinCubit>()),
        BlocProvider<ProfileCubit>(create: (context) => getIt<ProfileCubit>()),
         BlocProvider<EditprofileCubit>(create: (context) => getIt<EditprofileCubit>()),
        BlocProvider<MessageCubit>(create: (context) => getIt<MessageCubit>()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
