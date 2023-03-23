import '../model_util.dart';
class ChangeEmailReq {
  /// Returns a new [ChangeEmailReq] instance.
  ChangeEmailReq({
    required this.sign,
    required this.timestamp,
    required this.uid,
    required this.email,
  });

  String sign;

  int timestamp;

  String uid;

  String email;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ChangeEmailReq &&
     other.sign == sign &&
     other.timestamp == timestamp &&
     other.uid == uid &&
     other.email == email;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (sign == null ? 0 : sign!.hashCode) +
    (timestamp == null ? 0 : timestamp!.hashCode) +
    (uid == null ? 0 : uid!.hashCode) +
    (email == null ? 0 : email!.hashCode);

  @override
  String toString() => 'ChangeEmailReq[sign=$sign, timestamp=$timestamp, uid=$uid, email=$email]';

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
    if (email != null) {
      _json[r'email'] = email;
    }
    return _json;
  }

  /// Returns a new [ChangeEmailReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChangeEmailReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ChangeEmailReq[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ChangeEmailReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ChangeEmailReq(
        sign: mapValueOfType<String>(json, r'sign'),
        timestamp: mapValueOfType<int>(json, r'timestamp'),
        uid: mapValueOfType<String>(json, r'uid'),
        email: mapValueOfType<String>(json, r'email'),
      );
    }
    return null;
  }

  static List<ChangeEmailReq>? listFromJson(dynamic json, {bool growable = true}) {
    final result = <ChangeEmailReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChangeEmailReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ChangeEmailReq> mapFromJson(dynamic json) {
    final map = <String, ChangeEmailReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChangeEmailReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ChangeEmailReq-objects as value to a dart map
  static Map<String, List<ChangeEmailReq>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ChangeEmailReq>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChangeEmailReq.listFromJson(entry.value, growable: growable,);
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
    'email',
  };
}

