import '../model_util.dart';
class LoginReq {
  /// Returns a new [LoginReq] instance.
  LoginReq({
    required this.sign,
    required this.timestamp,
    required this.email,
    required this.password,
  });

  String sign;

  int timestamp;

  String email;

  String password;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LoginReq &&
     other.sign == sign &&
     other.timestamp == timestamp &&
     other.email == email &&
     other.password == password;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (sign == null ? 0 : sign!.hashCode) +
    (timestamp == null ? 0 : timestamp!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (password == null ? 0 : password!.hashCode);

  @override
  String toString() => 'LoginReq[sign=$sign, timestamp=$timestamp, email=$email, password=$password]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (sign != null) {
      _json[r'sign'] = sign;
    }
    if (timestamp != null) {
      _json[r'timestamp'] = timestamp;
    }
    if (email != null) {
      _json[r'email'] = email;
    }
    if (password != null) {
      _json[r'password'] = password;
    }
    return _json;
  }

  /// Returns a new [LoginReq] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LoginReq? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "LoginReq[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "LoginReq[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return LoginReq(
        sign: mapValueOfType<String>(json, r'sign'),
        timestamp: mapValueOfType<int>(json, r'timestamp'),
        email: mapValueOfType<String>(json, r'email'),
        password: mapValueOfType<String>(json, r'password'),
      );
    }
    return null;
  }

  static List<LoginReq>? listFromJson(dynamic json, {bool growable = true}) {
    final result = <LoginReq>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LoginReq.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LoginReq> mapFromJson(dynamic json) {
    final map = <String, LoginReq>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LoginReq.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LoginReq-objects as value to a dart map
  static Map<String, List<LoginReq>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LoginReq>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LoginReq.listFromJson(entry.value, growable: growable,);
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
    'email',
    'password',
  };
}

