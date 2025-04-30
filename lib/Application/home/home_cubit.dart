import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:wellnest_doctor/Domain/Failure/failure.dart';
import 'package:wellnest_doctor/Domain/Home/StartChat/start_chat_model.dart';
import 'package:wellnest_doctor/Domain/Home/StartChat/start_chat_service.dart';
import 'package:wellnest_doctor/Domain/Home/ViewAppointments/view_bookings_model.dart';
import 'package:wellnest_doctor/Domain/Home/ViewAppointments/view_bookings_service.dart';
import 'package:wellnest_doctor/Domain/Home/home_model.dart';
import 'package:wellnest_doctor/Domain/Home/home_service.dart';
part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeService _homeService;
  final ViewBookingsService viewBookingsService;
  final StartChatServicce startChatServicce;
  HomeCubit(this._homeService, this.viewBookingsService, this.startChatServicce)
      : super(HomeState.initial());

  getDetails() async {
    emit(state.copyWith(
      isLoading: true,
      isFailureOrSuccess: none(),
    ));
    final response = await _homeService.getDetails();
    response.fold(
        (l) => emit(state.copyWith(
            isLoading: false, isFailureOrSuccess: some(left(l)))),
        (r) => emit(state.copyWith(
            isLoading: false,
            homeModel: r,
            isFailureOrSuccess: some(
              right(r),
            ))));
  }

  viewBookings(String date) async {
    emit(state.copyWith(
      isLoadingViewBookings: true,
      isFailureOrSuccessViewBookings: none(),
    ));
    final response = await viewBookingsService.viewBookings();
    response.fold(
        (l) => emit(state.copyWith(
            isLoadingViewBookings: false,
            isFailureOrSuccessViewBookings: some(left(l)))), (r) {
     List<Bookings> filteredBookings = r
          .where((element) => element.bookdate == date)
          .toList();
      emit(state.copyWith(
          isLoadingViewBookings: false,
          viewBookingsModel: filteredBookings,
          isFailureOrSuccessViewBookings: some(
            right(filteredBookings),
          )));
    });
  }

  startChat(String bookid) async {
    emit(state.copyWith(
      isFailureOrSuccessStartChat: none(),
    ));
    final response = await startChatServicce.startChat(bookid);
    response.fold(
        (l) => emit(state.copyWith(isFailureOrSuccessStartChat: some(left(l)))),
        (r) => emit(state.copyWith(
                isFailureOrSuccessStartChat: some(
              right(r),
            ))));
  }
}
