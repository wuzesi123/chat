import 'dart:convert';
import 'package:fast_rsa/fast_rsa.dart';
import 'package:crypto/crypto.dart';

import '../network/http/api.dart';
class SignUtil{

  static String publicKey = "";

  static init()async{
    var res = await OpenApi().getUserApi().apiUserKeyGet();
    print(res?.data);
    String key = res!.data!.data.publicKey;
    publicKey = utf8.decode(base64Decode(key));
  }

  static getSign(Map data){
    data.remove("sign");
    List dataList = [];
    data.forEach((key, value) {
      if(value is List){
        dataList.add("$key=${jsonEncode(value)}");
      }else{
        dataList.add("$key=${value.toString()}");
      }
    });
    dataList.sort();
    String dataString = "";
    for(int i = 0;i<dataList.length;i++){
      if(i == 0){
        dataString = dataList[0];
      }else{
        dataString = "$dataString&${dataList[i]}";
      }
    }
    var content = const Utf8Encoder().convert("$dataString&secret=pkwinners.com");
    var digest = md5.convert(content);
    return digest.toString().toUpperCase();
  }

  static rsa(String password)async{
    var data = await RSA.encryptPKCS1v15(password,publicKey);
    return data;
  }
}