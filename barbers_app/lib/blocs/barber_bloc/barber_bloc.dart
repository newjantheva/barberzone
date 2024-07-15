import 'package:barbers_app/models/barber_model.dart';
import 'package:barbers_app/repo/barber_repository.dart';
import 'package:barbers_app/models/barber_model.dart';
import 'package:barbers_app/repositories/barber_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'barber_event.dart';
part 'barber_state.dart';

class BarberBloc extends Bloc<BarberEvent, BarberState> {
  final BarberRepository repository;
  BarberBloc({required this.repository}) : super(BarberInitial()) {
    on<CreateBarberEvent>((event, emit) async {
      if (event.description.isEmpty || event.name.isEmpty) {
        emit(BarberEmpty());
      }

      try {
        emit(BarberCreating());

        final barber =
            await repository.createBarber(event.name, event.description);

        emit(BarberCreated(barber: barber));
      } catch (e) {
        emit(BarberFailure(errorMessage: e.toString()));
      }
  final BarberRepository _repository;
  BarberBloc(this._repository) : super(BarberInitial()) {
    on<FetchBarbers>((event, emit) async {
      final barbers = await _repository.fetchBarbers();
      emit(BarberSuccess(barbers));
    });
  }
}
