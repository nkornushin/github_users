import 'package:flutter/material.dart';

import 'widgets/body.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Users'),
      ),
      body: Body(),
    );
  }
}
