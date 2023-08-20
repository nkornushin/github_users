import 'package:github_users/features/users/domain/entities/user_entity.dart';

import '../../domain/repositories/github_repository.dart';
import '../model/github_user_dto.dart';
import '../providers/github_provider.dart';

class GithubRepositoryImpl implements GithubRepository {
  final GithubProvider provider;

  GithubRepositoryImpl(this.provider);

  @override
  Future<List<User>> getUsers(String query) async {
    final List<GithubUserDto> users = await provider.getUsers(query);

    return users.map((item) => userMapper(item)).toList();
  }

  User userMapper(GithubUserDto userDto) {
    return User(
      username: userDto.login,
      avatar: userDto.avatarUrl,
      url: userDto.htmlUrl,
    );
  }
}
