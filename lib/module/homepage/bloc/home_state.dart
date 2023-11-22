part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class IsLoading extends HomeState {}

class IsDone extends HomeState {}

class IsError extends HomeState {
  IsError({this.errorMsg});

  final String? errorMsg;
}
