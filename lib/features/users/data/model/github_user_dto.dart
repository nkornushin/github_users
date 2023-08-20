class GithubUserDto {
  final int id;
  final String login;
  final String avatarUrl;
  final String url;
  final String htmlUrl;

  GithubUserDto({
    required this.id,
    required this.login,
    required this.avatarUrl,
    required this.url,
    required this.htmlUrl,
  });

  factory GithubUserDto.fromJson(dynamic json) {
    return GithubUserDto(
      id: json['id'],
      login: json['login'],
      avatarUrl: json['avatar_url'],
      url: json['url'],
      htmlUrl: json['html_url'],
    );
  }
}
