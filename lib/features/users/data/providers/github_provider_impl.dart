import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:github_users/features/users/data/model/github_user_dto.dart';
import 'github_provider.dart';

class GithubProviderImpl implements GithubProvider {
  final Dio dio;

  GithubProviderImpl(this.dio);

  @override
  Future<List<GithubUserDto>> getUsers(String query) async {
    final response = await dio.get('/search/users?q=$query');

    if (kDebugMode) {
      print(response);
    }

    final List<GithubUserDto> list = (response.data['items'] as List<dynamic>)
        .map((item) => GithubUserDto.fromJson(item))
        .toList();

    return list;
  }
}
