import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/entities/user_entity.dart';

class UserList extends StatelessWidget {
  const UserList({
    super.key,
    required this.users,
  });

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 10,
      ),
      padding: const EdgeInsets.all(8),
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        final User user = users[index];
        return GestureDetector(
          onTap: () async {
            var url = Uri.parse(user.url);
            var urllaunchable = await canLaunchUrl(
              url,
            );
            if (urllaunchable) {
              await launchUrl(
                url,
              ); //launch is from url_launcher package to launch URL
            }
          },
          child: ListTile(
            leading: Image.network(user.avatar),
            title: Text(user.username),
            trailing: const Icon(Icons.arrow_forward_ios),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Color(0xffeaeaea),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
      },
    );
  }
}
