import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salt_test/commons/widgets/spacer.dart';
import 'package:salt_test/module/login_page/bloc/login_cubit.dart';
import 'package:salt_test/module/login_page/widgets/custom_form_field.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LoginCubit cubit = LoginCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Log in",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SpaceH16(),
                      CustomFormField(
                        label: "email",
                        controller: cubit.emailTxt,
                      ),
                      const SpaceH8(),
                      CustomFormField(
                        label: "password",
                        controller: cubit.password,
                      ),
                      const SpaceH16(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            fixedSize:
                                Size(MediaQuery.sizeOf(context).width / 1, 30)),
                        child: const Text(
                          "Log in",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
