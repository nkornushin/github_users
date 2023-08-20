import '../model/github_user_dto.dart';

abstract class GithubProvider {
  Future<List<GithubUserDto>> getUsers(String query);
}
