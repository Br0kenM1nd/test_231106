import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test_231106/core/dependencies/injector.dart';

import 'observer.dart';

Future<void> initDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  Bloc.observer = Observer();
  await initDI();
}
