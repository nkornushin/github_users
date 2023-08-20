part of 'search_users_bloc.dart';

sealed class SearchUsersEvent extends Equatable {
  const SearchUsersEvent();

  @override
  List<Object> get props => [];
}

class Search extends SearchUsersEvent {
  final String query;

  const Search({
    required this.query,
  });
}
