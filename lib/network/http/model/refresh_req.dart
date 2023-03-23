import '../model_util.dart';
class RefreshReq {
  /// Returns a new [RefreshReq] instance.
  RefreshReq({
    required this.sign,
    required this.timestamp,
    required this.uid,
    required this.token,
  });

  String sign;

  int timestamp;

  String uid;

  String token;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RefreshReq &&
     other.sign == sign &&
     other.timestamp == timestamp &&
     other.uid == uid &&
     other.token == token;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (sign == null ? 0 : sign!.hashCode) +
    (timestamp == null ? 0 : timestamp!.hashCode) +
    (uid == null ? 0 : uid!.hashCode) +
    (token == null ? 0 : token!.hashCode);

  @override
  String toString() => 'RefreshReq[sign=$sign, timestamp=$timestamp, uid=$uid, token=$token]';

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
    if (token != null) {
      _json[r'token'] = token;
    }
    return _json;
  }

  /// Returns a new [RefreshReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RefreshReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RefreshReq[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RefreshReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RefreshReq(
        sign: mapValueOfType<String>(json, r'sign'),
        timestamp: mapValueOfType<int>(json, r'timestamp'),
        uid: mapValueOfType<String>(json, r'uid'),
        token: mapValueOfType<String>(json, r'token'),
      );
    }
    return null;
  }

  static List<RefreshReq>? listFromJson(dynamic json, {bool growable = true}) {
    final result = <RefreshReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RefreshReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RefreshReq> mapFromJson(dynamic json) {
    final map = <String, RefreshReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RefreshReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RefreshReq-objects as value to a dart map
  static Map<String, List<RefreshReq>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RefreshReq>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RefreshReq.listFromJson(entry.value, growable: growable,);
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
    'token',
  };
}

