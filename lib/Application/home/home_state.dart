part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    required bool isLoadingViewBookings,
    required Option<Either<MainFailure, HomeModel>> isFailureOrSuccess,
    required Option<Either<MainFailure,List<Bookings>>> isFailureOrSuccessViewBookings,
    required Option<Either<MainFailure,StartChatModel>> isFailureOrSuccessStartChat,
    required HomeModel? homeModel,
    required List<Bookings>? viewBookingsModel,
  }) = _Initial;

  factory HomeState.initial() =>
      HomeState(isLoading: false, isFailureOrSuccess: none(), homeModel: null, isFailureOrSuccessViewBookings: none(), viewBookingsModel: null, isFailureOrSuccessStartChat: none(), isLoadingViewBookings: false);
}
