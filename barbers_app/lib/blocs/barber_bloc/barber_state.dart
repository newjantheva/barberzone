part of 'barber_bloc.dart';

sealed class BarberState extends Equatable {
  const BarberState();
  
  @override
  List<Object> get props => [];
}

final class BarberInitial extends BarberState {}
