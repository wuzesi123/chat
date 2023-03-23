import '../model_util.dart';
class LoginResData {
  /// Returns a new [LoginResData] instance.
  LoginResData({
    required this.uid,
    required this.token,
  });

  String uid;

  String token;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LoginResData &&
     other.uid == uid &&
     other.token == token;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (uid == null ? 0 : uid!.hashCode) +
    (token == null ? 0 : token!.hashCode);

  @override
  String toString() => 'LoginResData[uid=$uid, token=$token]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (uid != null) {
      _json[r'uid'] = uid;
    }
    if (token != null) {
      _json[r'token'] = token;
    }
    return _json;
  }

  /// Returns a new [LoginResData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LoginResData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "LoginResData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "LoginResData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return LoginResData(
        uid: mapValueOfType<String>(json, r'uid'),
        token: mapValueOfType<String>(json, r'token'),
      );
    }
    return null;
  }

  static List<LoginResData>? listFromJson(dynamic json, {bool growable = true}) {
    final result = <LoginResData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LoginResData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LoginResData> mapFromJson(dynamic json) {
    final map = <String, LoginResData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LoginResData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LoginResData-objects as value to a dart map
  static Map<String, List<LoginResData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LoginResData>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LoginResData.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'uid',
    'token',
  };
}

