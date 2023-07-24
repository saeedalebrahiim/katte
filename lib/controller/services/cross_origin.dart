import 'dart:async';
import 'package:chopper/chopper.dart';

class AccessOriginHeader implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    return applyHeader(request, 'Access-Control-Allow-Origin', '*');
  }
}

class AccessOriginsHeader implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    return applyHeader(request, 'Access-Control-Allow-Origins', '*');
  }
}

class AccessMethodHeader implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    return applyHeader(request, 'Access-Control-Allow-Methods', '*');
  }
}

class AccessHeader implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    return applyHeader(request, 'Access-Control-Allow-Headers', '*');
  }
}
