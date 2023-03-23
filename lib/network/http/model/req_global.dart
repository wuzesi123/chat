import '../model_util.dart';
class ReqGlobal {
  /// Returns a new [ReqGlobal] instance.
  ReqGlobal({
    required this.sign,
    required this.timestamp,
  });

  String sign;

  int timestamp;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ReqGlobal &&
     other.sign == sign &&
     other.timestamp == timestamp;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (sign == null ? 0 : sign!.hashCode) +
    (timestamp == null ? 0 : timestamp!.hashCode);

  @override
  String toString() => 'ReqGlobal[sign=$sign, timestamp=$timestamp]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (sign != null) {
      _json[r'sign'] = sign;
    }
    if (timestamp != null) {
      _json[r'timestamp'] = timestamp;
    }
    return _json;
  }

  /// Returns a new [ReqGlobal] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ReqGlobal? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ReqGlobal[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ReqGlobal[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ReqGlobal(
        sign: mapValueOfType<String>(json, r'sign'),
        timestamp: mapValueOfType<int>(json, r'timestamp'),
      );
    }
    return null;
  }

  static List<ReqGlobal>? listFromJson(dynamic json, {bool growable = true}) {
    final result = <ReqGlobal>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ReqGlobal.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ReqGlobal> mapFromJson(dynamic json) {
    final map = <String, ReqGlobal>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ReqGlobal.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ReqGlobal-objects as value to a dart map
  static Map<String, List<ReqGlobal>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ReqGlobal>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ReqGlobal.listFromJson(entry.value, growable: growable,);
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
  };
}

