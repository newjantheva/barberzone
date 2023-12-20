part of 'barber_bloc.dart';

sealed class BarberState extends Equatable {
  const BarberState();
  
  @override
  List<Object> get props => [];
}

final class BarberInitial extends BarberState {}

final class BarberEmpty extends BarberState {}

final class BarberCreating extends BarberState {}

final class BarberCreated extends BarberState {
  final Barber barber;

  const BarberCreated({required this.barber});

  @override
  List<Object> get props => [barber];
}

final class BarberFailure extends BarberState {
  final String? errorMessage;

  const BarberFailure({this.errorMessage});

  @override
  List<Object> get props => [errorMessage ?? ""];
}
