import '../entities/user_entity.dart';
import '../repositories/github_repository.dart';

class GetUsersUseCase {
  final GithubRepository repository;

  GetUsersUseCase({
    required this.repository,
  });

  Future<List<User>> call(String query) async {
    return await repository.getUsers(query);
  }
}
