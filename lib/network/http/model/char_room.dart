import '../model_util.dart';
class CharRoom {
  /// Returns a new [CharRoom] instance.
  CharRoom({
    required this.createTime,
    required this.roomId,
    required this.title,
    required this.uid,
    required this.updateTime,
  });

  String createTime;

  String roomId;

  String title;

  String uid;

  String updateTime;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CharRoom &&
     other.createTime == createTime &&
     other.roomId == roomId &&
     other.title == title &&
     other.uid == uid &&
     other.updateTime == updateTime;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createTime == null ? 0 : createTime!.hashCode) +
    (roomId == null ? 0 : roomId!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (uid == null ? 0 : uid!.hashCode) +
    (updateTime == null ? 0 : updateTime!.hashCode);

  @override
  String toString() => 'CharRoom[createTime=$createTime, roomId=$roomId, title=$title, uid=$uid, updateTime=$updateTime]';

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
    if (uid != null) {
      _json[r'uid'] = uid;
    }
    if (updateTime != null) {
      _json[r'update_time'] = updateTime;
    }
    return _json;
  }

  /// Returns a new [CharRoom] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CharRoom? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CharRoom[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CharRoom[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CharRoom(
        createTime: mapValueOfType<String>(json, r'create_time'),
        roomId: mapValueOfType<String>(json, r'room_id'),
        title: mapValueOfType<String>(json, r'title'),
        uid: mapValueOfType<String>(json, r'uid'),
        updateTime: mapValueOfType<String>(json, r'update_time'),
      );
    }
    return null;
  }

  static List<CharRoom>? listFromJson(dynamic json, {bool growable = true}) {
    final result = <CharRoom>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CharRoom.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CharRoom> mapFromJson(dynamic json) {
    final map = <String, CharRoom>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CharRoom.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CharRoom-objects as value to a dart map
  static Map<String, List<CharRoom>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CharRoom>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CharRoom.listFromJson(entry.value, growable: growable,);
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
    'uid',
    'update_time',
  };
}

