import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/features/users/domain/entities/user_entity.dart';

import '../../../domain/usecases/get_users_usecase.dart';

part 'search_users_event.dart';
part 'search_users_state.dart';

class SearchUsersBloc extends Bloc<SearchUsersEvent, SearchUsersState> {
  final GetUsersUseCase useCase;

  SearchUsersBloc({required this.useCase}) : super(SearchUsersInitial()) {
    on<Search>(_search);
  }

  Future<void> _search(Search event, Emitter<SearchUsersState> emit) async {
    emit(UsersLoading());

    try {
      final List<User> uesrsList = await useCase.call(event.query);

      emit(UsersReceived(uesrsList));
    } catch (e) {
      emit(UsersFailure());
    }
  }
}
