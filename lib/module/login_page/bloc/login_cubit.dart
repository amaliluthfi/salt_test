import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:salt_test/module/login_page/network/login_network.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final LoginNetwork _network = LoginNetwork();
  final TextEditingController emailTxt = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? token;

  Future<void> login() async {
    try {
      emit(LoadingState());
      var res = await _network.loginNetwork(
          data: {"email": emailTxt.text, "password": password.text});
      token = res;
      debugPrint("login success! 2 $token");
      emit(SubmitDone());
    } catch (e) {
      debugPrint(e.toString());
      emit(SubmitFailed(errorMsg: e.toString()));
    }
  }
}
