import '../model_util.dart';
class CreateResData {
  /// Returns a new [CreateResData] instance.
  CreateResData({
    required this.createTime,
    required this.roomId,
    required this.title,
    required this.updateTime,
  });

  String createTime;

  String roomId;

  String title;

  String updateTime;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateResData &&
     other.createTime == createTime &&
     other.roomId == roomId &&
     other.title == title &&
     other.updateTime == updateTime;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createTime == null ? 0 : createTime!.hashCode) +
    (roomId == null ? 0 : roomId!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (updateTime == null ? 0 : updateTime!.hashCode);

  @override
  String toString() => 'CreateResData[createTime=$createTime, roomId=$roomId, title=$title, updateTime=$updateTime]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (createTime != null) {
      _json[r'create_time'] = createTime;
    }
    if (roomId != null) {
      _json[r'room_id'] = roomId;
    }
    if (title != null) {
      _json[r'title'] = title;
    }
    if (updateTime != null) {
      _json[r'update_time'] = updateTime;
    }
    return _json;
  }

  /// Returns a new [CreateResData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateResData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateResData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateResData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateResData(
        createTime: mapValueOfType<String>(json, r'create_time'),
        roomId: mapValueOfType<String>(json, r'room_id'),
        title: mapValueOfType<String>(json, r'title'),
        updateTime: mapValueOfType<String>(json, r'update_time'),
      );
    }
    return null;
  }

  static List<CreateResData>? listFromJson(dynamic json, {bool growable = true}) {
    final result = <CreateResData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateResData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateResData> mapFromJson(dynamic json) {
    final map = <String, CreateResData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateResData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateResData-objects as value to a dart map
  static Map<String, List<CreateResData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateResData>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateResData.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'create_time',
    'room_id',
    'title',
    'update_time',
  };
}

