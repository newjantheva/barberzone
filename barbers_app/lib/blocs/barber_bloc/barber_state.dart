part of 'barber_bloc.dart';

sealed class BarberState extends Equatable {
  const BarberState();

  @override
  List<Object> get props => [];
}

final class BarberInitial extends BarberState {}

final class BarberSuccess extends BarberState {
  final List<Barber> barbers;

  const BarberSuccess(this.barbers);

  @override
  List<Object> get props => [barbers];
}
