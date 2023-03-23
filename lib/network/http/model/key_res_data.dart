import '../model_util.dart';
class KeyResData {
  /// Returns a new [KeyResData] instance.
  KeyResData({
    required this.publicKey,
  });

  String publicKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is KeyResData &&
     other.publicKey == publicKey;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (publicKey == null ? 0 : publicKey!.hashCode);

  @override
  String toString() => 'KeyResData[publicKey=$publicKey]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (publicKey != null) {
      _json[r'public_key'] = publicKey;
    }
    return _json;
  }

  /// Returns a new [KeyResData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static KeyResData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "KeyResData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "KeyResData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return KeyResData(
        publicKey: mapValueOfType<String>(json, r'public_key'),
      );
    }
    return null;
  }

  static List<KeyResData>? listFromJson(dynamic json, {bool growable = true}) {
    final result = <KeyResData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = KeyResData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, KeyResData> mapFromJson(dynamic json) {
    final map = <String, KeyResData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = KeyResData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of KeyResData-objects as value to a dart map
  static Map<String, List<KeyResData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<KeyResData>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = KeyResData.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'public_key',
  };
}

