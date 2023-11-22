import 'package:flutter/material.dart';
import 'package:salt_test/core/services/app_network.dart';

class LoginNetwork {
  final _network = AppNetwork();

  Future<String> loginNetwork({required Map<String, dynamic> data}) async {
    try {
      var res = await _network.post(path: "api/login", data: data);
      return res["token"];
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
