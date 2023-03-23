import '../model_util.dart';
class RoomListReq {
  /// Returns a new [RoomListReq] instance.
  RoomListReq({
    required this.sign,
    required this.timestamp,
    required this.uid,
  });

  String sign;

  int timestamp;

  String uid;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RoomListReq &&
     other.sign == sign &&
     other.timestamp == timestamp &&
     other.uid == uid;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (sign == null ? 0 : sign!.hashCode) +
    (timestamp == null ? 0 : timestamp!.hashCode) +
    (uid == null ? 0 : uid!.hashCode);

  @override
  String toString() => 'RoomListReq[sign=$sign, timestamp=$timestamp, uid=$uid]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (sign != null) {
      _json[r'sign'] = sign;
    }
    if (timestamp != null) {
      _json[r'timestamp'] = timestamp;
    }
    if (uid != null) {
      _json[r'uid'] = uid;
    }
    return _json;
  }

  /// Returns a new [RoomListReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RoomListReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RoomListReq[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RoomListReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RoomListReq(
        sign: mapValueOfType<String>(json, r'sign'),
        timestamp: mapValueOfType<int>(json, r'timestamp'),
        uid: mapValueOfType<String>(json, r'uid'),
      );
    }
    return null;
  }

  static List<RoomListReq>? listFromJson(dynamic json, {bool growable = true}) {
    final result = <RoomListReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RoomListReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RoomListReq> mapFromJson(dynamic json) {
    final map = <String, RoomListReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RoomListReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RoomListReq-objects as value to a dart map
  static Map<String, List<RoomListReq>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RoomListReq>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RoomListReq.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'sign',
    'timestamp',
    'uid',
  };
}

