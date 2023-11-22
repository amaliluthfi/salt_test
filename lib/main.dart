import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salt_test/module/homepage/bloc/home_cubit.dart';
import 'package:salt_test/module/homepage/views/home_page.dart';
import 'package:salt_test/module/login_page/bloc/login_cubit.dart';
import 'package:salt_test/module/login_page/views/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (contex) => LoginCubit()),
        BlocProvider(create: (context) => HomeCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/login",
        routes: {
          "/": (context) => const HomePage(),
          "/login": (context) => const LoginPage(),
        },
        title: 'Salt Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
