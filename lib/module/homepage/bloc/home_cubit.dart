import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:salt_test/module/homepage/models/user_model.dart';
import 'package:salt_test/module/homepage/network/home_network.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final HomeNetwork _network = HomeNetwork();
  List<Users> users = [];

  Future<void> getUsers() async {
    try {
      emit(IsLoading());
      var res = await _network.getUserNetwork();
      users.addAll(res);
      emit(IsDone());
    } catch (e) {
      debugPrint(e.toString());
      emit(IsError(errorMsg: e.toString()));
    }
  }
}
