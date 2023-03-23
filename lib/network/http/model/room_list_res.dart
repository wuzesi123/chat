import '../model_util.dart';
import 'char_room.dart';
class RoomListRes {
  /// Returns a new [RoomListRes] instance.
  RoomListRes({
    required this.code,
    required this.msg,
    required this.data,
  });

  int code;

  String msg;

  List<CharRoom> data;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RoomListRes &&
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
  String toString() => 'RoomListRes[code=$code, msg=$msg, data=$data]';

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

  /// Returns a new [RoomListRes] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RoomListRes? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RoomListRes[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RoomListRes[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RoomListRes(
        code: mapValueOfType<int>(json, r'code'),
        msg: mapValueOfType<String>(json, r'msg'),
        data: CharRoom.listFromJson(json[r'data'])!,
      );
    }
    return null;
  }

  static List<RoomListRes>? listFromJson(dynamic json, {bool growable = true}) {
    final result = <RoomListRes>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RoomListRes.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RoomListRes> mapFromJson(dynamic json) {
    final map = <String, RoomListRes>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RoomListRes.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RoomListRes-objects as value to a dart map
  static Map<String, List<RoomListRes>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RoomListRes>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RoomListRes.listFromJson(entry.value, growable: growable,);
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

