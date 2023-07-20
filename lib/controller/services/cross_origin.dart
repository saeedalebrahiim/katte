import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccessOriginHeader implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    return applyHeader(request, 'Access-Control-Allow-Origin', '*');
  }
}
