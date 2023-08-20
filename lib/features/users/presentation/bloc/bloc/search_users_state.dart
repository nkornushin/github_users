part of 'search_users_bloc.dart';

sealed class SearchUsersState extends Equatable {
  const SearchUsersState();

  @override
  List<Object> get props => [];
}

final class SearchUsersInitial extends SearchUsersState {}

class UsersLoading extends SearchUsersState {
  @override
  List<Object> get props => [];
}

class UsersReceived extends SearchUsersState {
  final List<User> users;

  const UsersReceived(this.users);

  @override
  List<Object> get props => [users];
}

class UsersFailure extends SearchUsersState {
  @override
  List<Object> get props => [];
}
