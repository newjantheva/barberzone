import 'package:barbers_app/models/barber_model.dart';
import 'package:barbers_app/repo/barber_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final BarberRepository repository;
  SearchBloc({required this.repository}) : super(SearchInitial()) {
    on<SearchBarbersEvent>((event, emit) {
      if (event.query.isEmpty) {
        emit(SearchEmpty());
      }

      try {
        //loading
        emit(SearchLoading());

        //success
        final barbers = repository.searchBarbers(event.query);

        emit(SearchSuccess(barbers: barbers));
      } catch (error) {
        //failure
        emit(SearchFailure(errorMessage: error.toString()));
      }
    });
  }
}
