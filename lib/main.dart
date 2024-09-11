import 'package:api_happy_tec/cache/cache_helper.dart';
import 'package:api_happy_tec/core/api/api_service.dart';
import 'package:api_happy_tec/cubit/user_cubit.dart';
import 'package:api_happy_tec/screens/sign_in_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    BlocProvider(
      create: (context) => UserCubit(ApiService(dio: Dio())),
      child: DevicePreview(
        builder: (context) => const MyApp(),
        enabled: !kReleaseMode,
      ),
      // const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
