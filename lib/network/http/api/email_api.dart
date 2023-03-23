import 'dart:async';
import 'package:dio/dio.dart';
import '../../../utils/sp_utils.dart';
import '../model/change_email_req.dart';
import '../model/change_email_res.dart';
import '../model/get_email_code_req.dart';
import '../model/get_email_code_res.dart';
class EmailApi {
    late final Dio _dio;
    EmailApi(this._dio);

    /// change_email
    ///
    /// 
    Future<Response<ChangeEmailRes>?>apiEmailChangePost({ ChangeEmailReq? changeEmailReq,CancelToken? cancelToken, Map<String, dynamic>? headers,}) async {
    String _path = "/api/email/change";
    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;
    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);
    List<String> contentTypes = ["application/json"];

   bodyData = changeEmailReq!.toJson();
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
          var data = ChangeEmailRes.fromJson(response.data);
          return Response<ChangeEmailRes>(
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
    /// get_email_code
    ///
    /// 
    Future<Response<GetEmailCodeRes>?>apiEmailRegisterPost({ GetEmailCodeReq? getEmailCodeReq,CancelToken? cancelToken, Map<String, dynamic>? headers,}) async {
    String _path = "/api/email/register";
    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;
    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);
    List<String> contentTypes = ["application/json"];

   bodyData = getEmailCodeReq!.toJson();
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
          var data = GetEmailCodeRes.fromJson(response.data);
          return Response<GetEmailCodeRes>(
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
