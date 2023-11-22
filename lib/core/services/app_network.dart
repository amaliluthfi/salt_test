import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AppNetwork {
  final Dio _dio = Dio();
  String url = "https://reqres.in/";

  Future get({required String path, var data}) async {
    try {
      final res = await _dio.get(url + path);

      if (res.statusCode == 200) {
        debugPrint("success get users ${res.data["data"]}");
        return res.data["data"];
      }
    } on DioException catch (e) {
      debugPrint(e.response?.data["error"].toString());
      throw e.response?.data["error"].toString() ?? "something went wrong";
    }
  }

  Future post(
      {required String path, required Map<String, dynamic> data}) async {
    try {
      final res = await _dio.post(url + path, data: jsonEncode(data));
      if (res.statusCode == 200) {
        debugPrint("login success ${res.data}");
        return res.data;
      } else {
        throw res.statusMessage.toString();
      }
    } on DioException catch (e) {
      debugPrint(e.response?.data["error"].toString());
      throw e.response?.data["error"].toString() ?? "something went wrong";
    }
  }
}
