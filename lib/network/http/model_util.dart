
mapValueOfType<T>(Map<String, dynamic> json, String s) {
  if(json[s] == null){
    if(T == String){
      return "";
    }
    if(T == int){
      return 0;
    }
    if(T == bool){
      return false;
    }
    if(T == List){
      return [];
    }
  }else {
    return json[s] as T;
  }
}