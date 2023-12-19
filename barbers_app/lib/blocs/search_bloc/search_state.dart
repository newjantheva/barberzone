part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchEmpty extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<Barber> barbers;

  const SearchSuccess({required this.barbers});

  @override
  List<Object> get props => [barbers];
}

final class SearchFailure extends SearchState {
  final String? errorMessage;

  const SearchFailure({this.errorMessage});

  @override
  List<Object> get props => [errorMessage ?? ""];
}
