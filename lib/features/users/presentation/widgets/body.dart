import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/features/users/presentation/widgets/search_button.dart';

import '../../../../core/widgets/text_input_controller.dart';
import '../bloc/bloc/search_users_bloc.dart';
import '../bloc/cubit/enable_button_cubbit.dart';
import 'user_list.dart';

class Body extends StatelessWidget {
  Body({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: TextInputController(
                  controller: controller,
                  hintText: 'Enter Github username',
                  onChanged: (value) =>
                      BlocProvider.of<EnableButtonCubbit>(context).check(value),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              BlocBuilder<EnableButtonCubbit, bool>(
                builder: (context, state) {
                  return SearchButton(
                    onPressed: state
                        ? () => BlocProvider.of<SearchUsersBloc>(context)
                            .add(Search(query: controller.text))
                        : null,
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<SearchUsersBloc, SearchUsersState>(
            builder: (context, state) {
              if (state is UsersReceived) {
                return Expanded(
                  child: UserList(
                    users: state.users,
                  ),
                );
              }

              if (state is UsersLoading) {
                return const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
