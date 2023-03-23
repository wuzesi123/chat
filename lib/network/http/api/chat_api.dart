import 'dart:async';
import 'package:dio/dio.dart';
import '../../../utils/sp_utils.dart';
import '../model/create_chat_req.dart';
import '../model/create_res.dart';
import '../model/room_list_req.dart';
import '../model/room_list_res.dart';
class ChatApi {
    late final Dio _dio;
    ChatApi(this._dio);

    /// create
    ///
    /// 
    Future<Response<CreateRes>?>apiChatCreatePost({ CreateChatReq? createChatReq,CancelToken? cancelToken, Map<String, dynamic>? headers,}) async {
    String _path = "/api/chat/create";
    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;
    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);
    List<String> contentTypes = ["application/json"];

   bodyData = createChatReq!.toJson();
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
          var data = CreateRes.fromJson(response.data);
          return Response<CreateRes>(
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
    /// room_list
    ///
    /// 
    Future<Response<RoomListRes>?>apiChatRoomListPost({ RoomListReq? roomListReq,CancelToken? cancelToken, Map<String, dynamic>? headers,}) async {
    String _path = "/api/chat/room_list";
    Map<String, dynamic> queryParams = {};
    Map<String, String> headerParams = Map.from(headers ?? {});
    dynamic bodyData;
    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);
    List<String> contentTypes = ["application/json"];

   bodyData = roomListReq!.toJson();
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
          var data = RoomListRes.fromJson(response.data);
          return Response<RoomListRes>(
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
