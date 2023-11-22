import 'package:flutter/material.dart';
import 'package:salt_test/core/services/app_network.dart';
import 'package:salt_test/module/homepage/models/user_model.dart';

class HomeNetwork {
  final _network = AppNetwork();

  Future<List<Users>> getUserNetwork() async {
    try {
      var res = await _network.get(path: "api/users?page=2");
      return List<Users>.from(res.map((x) => Users.fromJson(x)));
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
