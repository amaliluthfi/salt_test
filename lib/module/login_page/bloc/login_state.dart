part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoadingState extends LoginState {}

class SubmitDone extends LoginState {
  SubmitDone({this.successMsg});
  final String? successMsg;
}

class SubmitFailed extends LoginState {
  SubmitFailed({this.errorMsg});
  final String? errorMsg;
}
