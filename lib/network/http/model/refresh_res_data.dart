import '../model_util.dart';
class RefreshResData {
  /// Returns a new [RefreshResData] instance.
  RefreshResData({
    required this.token,
  });

  String token;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RefreshResData &&
     other.token == token;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (token == null ? 0 : token!.hashCode);

  @override
  String toString() => 'RefreshResData[token=$token]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (token != null) {
      _json[r'token'] = token;
    }
    return _json;
  }

  /// Returns a new [RefreshResData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RefreshResData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RefreshResData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RefreshResData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RefreshResData(
        token: mapValueOfType<String>(json, r'token'),
      );
    }
    return null;
  }

  static List<RefreshResData>? listFromJson(dynamic json, {bool growable = true}) {
    final result = <RefreshResData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RefreshResData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RefreshResData> mapFromJson(dynamic json) {
    final map = <String, RefreshResData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RefreshResData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RefreshResData-objects as value to a dart map
  static Map<String, List<RefreshResData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RefreshResData>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RefreshResData.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'token',
  };
}

