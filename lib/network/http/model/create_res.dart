import '../model_util.dart';
import 'create_res_data.dart';
class CreateRes {
  /// Returns a new [CreateRes] instance.
  CreateRes({
    required this.code,
    required this.msg,
    required this.data,
  });

  int code;

  String msg;

  CreateResData data;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateRes &&
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
  String toString() => 'CreateRes[code=$code, msg=$msg, data=$data]';

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

  /// Returns a new [CreateRes] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateRes? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateRes[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateRes[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateRes(
        code: mapValueOfType<int>(json, r'code'),
        msg: mapValueOfType<String>(json, r'msg'),
        data: CreateResData.fromJson(json[r'data'])!,
      );
    }
    return null;
  }

  static List<CreateRes>? listFromJson(dynamic json, {bool growable = true}) {
    final result = <CreateRes>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateRes.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateRes> mapFromJson(dynamic json) {
    final map = <String, CreateRes>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateRes.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateRes-objects as value to a dart map
  static Map<String, List<CreateRes>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateRes>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateRes.listFromJson(entry.value, growable: growable,);
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

