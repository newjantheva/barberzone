import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'barber_event.dart';
part 'barber_state.dart';

class BarberBloc extends Bloc<BarberEvent, BarberState> {
  BarberBloc() : super(BarberInitial()) {
    on<BarberEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
