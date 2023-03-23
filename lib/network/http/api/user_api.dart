import 'dart:async';
import 'package:dio/dio.dart';
import '../../../utils/sp_utils.dart';
import '../model/change_password_req.dart';
import '../model/info_req.dart';
import '../model/info_res.dart';
import '../model/key_res.dart';
import '../model/login_req.dart';
import '../model/login_res.dart';
import '../model/refresh_req.dart';
import '../model/refresh_res.dart';
import '../model/register_req.dart';
import '../model/register_res.dart';
import '../model/res_global.dart';
class UserApi {
    late final Dio _dio;
    UserApi(this._dio);

    /// change_password
    ///
    /// 
    Future<Response<ResGlobal>?>apiUserChangePasswordPost({ ChangePasswordReq? changePasswordReq,CancelToken? cancelToken, Map<String, dynamic>? headers,}) async {
    String _path = "/api/user/change_password";
    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;
    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);
    List<String> contentTypes = ["application/json"];

   bodyData = changePasswordReq!.toJson();
   var t = await SPUtil().get("token");
    if(t == null){
      
    }else{
      headerParams["token"] = t;
    }
   return _dio.request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
      method: 'post'.toUpperCase(),
      headers: headerParams,
      extra: {
         'secure': [],
      },
      contentType: contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
      ).then((response) {
          var data = ResGlobal.fromJson(response.data);
          return Response<ResGlobal>(
              data: data,
              headers: response.headers,
              isRedirect: response.isRedirect,
              requestOptions: response.requestOptions,
              redirects: response.redirects,
              statusCode: response.statusCode,
              statusMessage: response.statusMessage,
              extra: response.extra,
           );
      });
    }
    /// info
    ///
    /// 
    Future<Response<InfoRes>?>apiUserInfoPost({ InfoReq? infoReq,CancelToken? cancelToken, Map<String, dynamic>? headers,}) async {
    String _path = "/api/user/info";
    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;
    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);
    List<String> contentTypes = ["application/json"];

   bodyData = infoReq!.toJson();
   var t = await SPUtil().get("token");
    if(t == null){
      
    }else{
      headerParams["token"] = t;
    }
   return _dio.request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
      method: 'post'.toUpperCase(),
      headers: headerParams,
      extra: {
         'secure': [],
      },
      contentType: contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
      ).then((response) {
          var data = InfoRes.fromJson(response.data);
          return Response<InfoRes>(
              data: data,
              headers: response.headers,
              isRedirect: response.isRedirect,
              requestOptions: response.requestOptions,
              redirects: response.redirects,
              statusCode: response.statusCode,
              statusMessage: response.statusMessage,
              extra: response.extra,
           );
      });
    }
    /// key
    ///
    /// 
    Future<Response<KeyRes>?>apiUserKeyGet({ CancelToken? cancelToken, Map<String, dynamic>? headers,}) async {
    String _path = "/api/user/key";
    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;
    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);
    List<String> contentTypes = [];

   var t = await SPUtil().get("token");
    if(t == null){
      
    }else{
      headerParams["token"] = t;
    }
   return _dio.request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
      method: 'get'.toUpperCase(),
      headers: headerParams,
      extra: {
         'secure': [],
      },
      contentType: contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
      ).then((response) {
          var data = KeyRes.fromJson(response.data);
          return Response<KeyRes>(
              data: data,
              headers: response.headers,
              isRedirect: response.isRedirect,
              requestOptions: response.requestOptions,
              redirects: response.redirects,
              statusCode: response.statusCode,
              statusMessage: response.statusMessage,
              extra: response.extra,
           );
      });
    }
    /// login
    ///
    /// 
    Future<Response<LoginRes>?>apiUserLoginPost({ LoginReq? loginReq,CancelToken? cancelToken, Map<String, dynamic>? headers,}) async {
    String _path = "/api/user/login";
    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;
    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);
    List<String> contentTypes = ["application/json"];

   bodyData = loginReq!.toJson();
   var t = await SPUtil().get("token");
    if(t == null){
      
    }else{
      headerParams["token"] = t;
    }
   return _dio.request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
      method: 'post'.toUpperCase(),
      headers: headerParams,
      extra: {
         'secure': [],
      },
      contentType: contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
      ).then((response) {
          var data = LoginRes.fromJson(response.data);
          return Response<LoginRes>(
              data: data,
              headers: response.headers,
              isRedirect: response.isRedirect,
              requestOptions: response.requestOptions,
              redirects: response.redirects,
              statusCode: response.statusCode,
              statusMessage: response.statusMessage,
              extra: response.extra,
           );
      });
    }
    /// refresh
    ///
    /// 
    Future<Response<RefreshRes>?>apiUserRefreshPost({ RefreshReq? refreshReq,CancelToken? cancelToken, Map<String, dynamic>? headers,}) async {
    String _path = "/api/user/refresh";
    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;
    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);
    List<String> contentTypes = ["application/json"];

   bodyData = refreshReq!.toJson();
   var t = await SPUtil().get("token");
    if(t == null){
      
    }else{
      headerParams["token"] = t;
    }
   return _dio.request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
      method: 'post'.toUpperCase(),
      headers: headerParams,
      extra: {
         'secure': [],
      },
      contentType: contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
      ).then((response) {
          var data = RefreshRes.fromJson(response.data);
          return Response<RefreshRes>(
              data: data,
              headers: response.headers,
              isRedirect: response.isRedirect,
              requestOptions: response.requestOptions,
              redirects: response.redirects,
              statusCode: response.statusCode,
              statusMessage: response.statusMessage,
              extra: response.extra,
           );
      });
    }
    /// register
    ///
    /// 
    Future<Response<RegisterRes>?>apiUserRegisterPost({ RegisterReq? registerReq,CancelToken? cancelToken, Map<String, dynamic>? headers,}) async {
    String _path = "/api/user/register";
    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;
    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);
    List<String> contentTypes = ["application/json"];

   bodyData = registerReq!.toJson();
   var t = await SPUtil().get("token");
    if(t == null){
      
    }else{
      headerParams["token"] = t;
    }
   return _dio.request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
      method: 'post'.toUpperCase(),
      headers: headerParams,
      extra: {
         'secure': [],
      },
      contentType: contentTypes.isNotEmpty ? contentTypes[0] : "application/json",
      ),
      cancelToken: cancelToken,
      ).then((response) {
          var data = RegisterRes.fromJson(response.data);
          return Response<RegisterRes>(
              data: data,
              headers: response.headers,
              isRedirect: response.isRedirect,
              requestOptions: response.requestOptions,
              redirects: response.redirects,
              statusCode: response.statusCode,
              statusMessage: response.statusMessage,
              extra: response.extra,
           );
      });
    }
}
