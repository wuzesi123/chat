import '../model_util.dart';
import 'info_res_data_info.dart';
class InfoResData {
  /// Returns a new [InfoResData] instance.
  InfoResData({
    required this.info,
  });

  InfoResDataInfo info;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InfoResData &&
     other.info == info;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (info == null ? 0 : info!.hashCode);

  @override
  String toString() => 'InfoResData[info=$info]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (info != null) {
      _json[r'info'] = info;
    }
    return _json;
  }

  /// Returns a new [InfoResData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InfoResData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "InfoResData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "InfoResData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return InfoResData(
        info: InfoResDataInfo.fromJson(json[r'info'])!,
      );
    }
    return null;
  }

  static List<InfoResData>? listFromJson(dynamic json, {bool growable = true}) {
    final result = <InfoResData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InfoResData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, InfoResData> mapFromJson(dynamic json) {
    final map = <String, InfoResData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InfoResData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of InfoResData-objects as value to a dart map
  static Map<String, List<InfoResData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<InfoResData>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InfoResData.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'info',
  };
}

