import 'package:delivery/controller/services/token.dart';
import 'package:delivery/model/api/generated/katte.swagger.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

Future<void> getProfile({
  required BuildContext context,
}) async {
  final api = Katte.create(interceptors: [MyRequestInterceptor()]);

  final postResult = await api.apiV1AuthenticationProfileGet();
  // print(postResult.error);
}
