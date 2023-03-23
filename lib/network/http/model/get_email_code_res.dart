import '../model_util.dart';
class GetEmailCodeRes {
  /// Returns a new [GetEmailCodeRes] instance.
  GetEmailCodeRes({
    required this.code,
    required this.msg,
    required this.data,
  });

  int code;

  String msg;

  Object data;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetEmailCodeRes &&
     other.code == code &&
     other.msg == msg &&
     other.data == data;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (code == null ? 0 : code!.hashCode) +
    (msg == null ? 0 : msg!.hashCode) +
    (data == null ? 0 : data!.hashCode);

  @override
  String toString() => 'GetEmailCodeRes[code=$code, msg=$msg, data=$data]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (code != null) {
      _json[r'code'] = code;
    }
    if (msg != null) {
      _json[r'msg'] = msg;
    }
    if (data != null) {
      _json[r'data'] = data;
    }
    return _json;
  }

  /// Returns a new [GetEmailCodeRes] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetEmailCodeRes? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GetEmailCodeRes[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GetEmailCodeRes[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetEmailCodeRes(
        code: mapValueOfType<int>(json, r'code'),
        msg: mapValueOfType<String>(json, r'msg'),
        data: mapValueOfType<Object>(json, r'data'),
      );
    }
    return null;
  }

  static List<GetEmailCodeRes>? listFromJson(dynamic json, {bool growable = true}) {
    final result = <GetEmailCodeRes>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetEmailCodeRes.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetEmailCodeRes> mapFromJson(dynamic json) {
    final map = <String, GetEmailCodeRes>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetEmailCodeRes.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetEmailCodeRes-objects as value to a dart map
  static Map<String, List<GetEmailCodeRes>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetEmailCodeRes>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetEmailCodeRes.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'code',
    'msg',
    'data',
  };
}

