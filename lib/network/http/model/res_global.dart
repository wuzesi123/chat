import '../model_util.dart';
class ResGlobal {
  /// Returns a new [ResGlobal] instance.
  ResGlobal({
    required this.code,
    required this.msg,
  });

  int code;

  String msg;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ResGlobal &&
     other.code == code &&
     other.msg == msg;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (code == null ? 0 : code!.hashCode) +
    (msg == null ? 0 : msg!.hashCode);

  @override
  String toString() => 'ResGlobal[code=$code, msg=$msg]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (code != null) {
      _json[r'code'] = code;
    }
    if (msg != null) {
      _json[r'msg'] = msg;
    }
    return _json;
  }

  /// Returns a new [ResGlobal] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ResGlobal? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ResGlobal[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ResGlobal[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ResGlobal(
        code: mapValueOfType<int>(json, r'code'),
        msg: mapValueOfType<String>(json, r'msg'),
      );
    }
    return null;
  }

  static List<ResGlobal>? listFromJson(dynamic json, {bool growable = true}) {
    final result = <ResGlobal>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ResGlobal.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ResGlobal> mapFromJson(dynamic json) {
    final map = <String, ResGlobal>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ResGlobal.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ResGlobal-objects as value to a dart map
  static Map<String, List<ResGlobal>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ResGlobal>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ResGlobal.listFromJson(entry.value, growable: growable,);
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
  };
}

