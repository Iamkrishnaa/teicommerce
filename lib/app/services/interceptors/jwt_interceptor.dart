import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JwtInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? accessToken = preferences.getString("token");
    data.headers['content-type'] = 'application/json';
    data.headers['Authorization'] = 'Bearer $accessToken';
    data.headers['Accept'] = 'application/json';
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}

class RefreshTokenInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? refreshToken = preferences.getString("refreshToken");
    data.headers['Content-Type'] = 'application/json';
    data.headers['Authorization'] = 'Bearer $refreshToken';
    data.headers['Accept'] = 'application/json';
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}
