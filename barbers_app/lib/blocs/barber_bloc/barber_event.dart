part of 'barber_bloc.dart';

sealed class BarberEvent extends Equatable {
  const BarberEvent();

  @override
  List<Object> get props => [];
}

final class CreateBarberEvent extends BarberEvent {
  final String name;
  final String description;

  const CreateBarberEvent({required this.name, required this.description});

  @override
  List<Object> get props => [name, description];
}

class FetchBarbers extends BarberEvent {}
