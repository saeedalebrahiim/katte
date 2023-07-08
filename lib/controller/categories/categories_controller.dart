import 'package:delivery/controller/services/token.dart';
import 'package:delivery/model/api/generated/katte.swagger.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

Future<CategoryDtoListApiResult> getCategories(
    {required BuildContext context}) async {
  final api = Katte.create(interceptors: [MyRequestInterceptor()]);

  final postResult = await api.apiV1CategoryListCategoryGet();
  print(postResult.body);
  print(postResult.error);

  if (postResult.isSuccessful == true) {
    print(postResult.error);
    if (postResult.body!.isSuccess == true) {
    } else {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: postResult.error.toString(),
      );
    }
  } else {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: postResult.error.toString(),
    );
  }
  final response = CategoryDtoListApiResult.fromJson(postResult.body!.toJson());

  return response;
}
