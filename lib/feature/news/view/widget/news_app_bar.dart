import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_231106/feature/auth/view/bloc/auth_bloc.dart';

class NewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NewsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthBloc>().state;
    return AppBar(
      title: Text(state.account?.name ?? ''),
      actions: [
        IconButton(
          onPressed: () => context.read<AuthBloc>().add(const AuthLogOut()),
          icon: const Icon(Icons.exit_to_app_rounded),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
