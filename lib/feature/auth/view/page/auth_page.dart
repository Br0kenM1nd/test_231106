import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_231106/feature/auth/view/bloc/auth_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  static const route = '/auth';

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final TextEditingController login;
  late final TextEditingController password;

  @override
  void initState() {
    login = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthBloc>().state;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Добро пожаловать в новостное приложение',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'логин'),
              controller: login,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'пароль'),
              obscureText: true,
              controller: password,
            ),
            SizedBox(height: 32),
            if (state.error != null) Text(state.error!.exception.toString()),
            ElevatedButton(
              onPressed: () => context.read<AuthBloc>().add(AuthLogIn(
                    login: login.text,
                    password: password.text,
                  )),
              child: const Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}
