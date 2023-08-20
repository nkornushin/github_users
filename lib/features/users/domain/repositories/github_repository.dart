import '../entities/user_entity.dart';

abstract class GithubRepository {
  Future<List<User>> getUsers(String query);
}
