import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:poll_app/services/dio/dio_helper.dart';
import 'package:poll_app/services/shared_preference/cache_helper.dart';
import 'package:poll_app/src/app_root.dart';

import 'blocs/observer/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const AppRoot());
}