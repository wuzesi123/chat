import '../model_util.dart';
class ChangePasswordReq {
  /// Returns a new [ChangePasswordReq] instance.
  ChangePasswordReq({
    required this.sign,
    required this.timestamp,
    required this.uid,
    required this.email,
    required this.originPassword,
    required this.newPassword,
    required this.code,
  });

  String sign;

  int timestamp;

  String uid;

  String email;

  String originPassword;

  String newPassword;

  String code;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ChangePasswordReq &&
     other.sign == sign &&
     other.timestamp == timestamp &&
     other.uid == uid &&
     other.email == email &&
     other.originPassword == originPassword &&
     other.newPassword == newPassword &&
     other.code == code;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (sign == null ? 0 : sign!.hashCode) +
    (timestamp == null ? 0 : timestamp!.hashCode) +
    (uid == null ? 0 : uid!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (originPassword == null ? 0 : originPassword!.hashCode) +
    (newPassword == null ? 0 : newPassword!.hashCode) +
    (code == null ? 0 : code!.hashCode);

  @override
  String toString() => 'ChangePasswordReq[sign=$sign, timestamp=$timestamp, uid=$uid, email=$email, originPassword=$originPassword, newPassword=$newPassword, code=$code]';

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
    if (originPassword != null) {
      _json[r'origin_password'] = originPassword;
    }
    if (newPassword != null) {
      _json[r'new_password'] = newPassword;
    }
    if (code != null) {
      _json[r'code'] = code;
    }
    return _json;
  }

  /// Returns a new [ChangePasswordReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChangePasswordReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ChangePasswordReq[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ChangePasswordReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ChangePasswordReq(
        sign: mapValueOfType<String>(json, r'sign'),
        timestamp: mapValueOfType<int>(json, r'timestamp'),
        uid: mapValueOfType<String>(json, r'uid'),
        email: mapValueOfType<String>(json, r'email'),
        originPassword: mapValueOfType<String>(json, r'origin_password'),
        newPassword: mapValueOfType<String>(json, r'new_password'),
        code: mapValueOfType<String>(json, r'code'),
      );
    }
    return null;
  }

  static List<ChangePasswordReq>? listFromJson(dynamic json, {bool growable = true}) {
    final result = <ChangePasswordReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChangePasswordReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ChangePasswordReq> mapFromJson(dynamic json) {
    final map = <String, ChangePasswordReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChangePasswordReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ChangePasswordReq-objects as value to a dart map
  static Map<String, List<ChangePasswordReq>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ChangePasswordReq>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChangePasswordReq.listFromJson(entry.value, growable: growable,);
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
    'origin_password',
    'new_password',
    'code',
  };
}

