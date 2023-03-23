import '../model_util.dart';
class ChatItem {
  /// Returns a new [ChatItem] instance.
  ChatItem({
    required this.id,
    required this.title,
    required this.lastDatetime,
  });

  int id;

  String title;

  String lastDatetime;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ChatItem &&
     other.id == id &&
     other.title == title &&
     other.lastDatetime == lastDatetime;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (lastDatetime == null ? 0 : lastDatetime!.hashCode);

  @override
  String toString() => 'ChatItem[id=$id, title=$title, lastDatetime=$lastDatetime]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (id != null) {
      _json[r'id'] = id;
    }
    if (title != null) {
      _json[r'title'] = title;
    }
    if (lastDatetime != null) {
      _json[r'lastDatetime'] = lastDatetime;
    }
    return _json;
  }

  /// Returns a new [ChatItem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChatItem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ChatItem[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ChatItem[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ChatItem(
        id: mapValueOfType<int>(json, r'id'),
        title: mapValueOfType<String>(json, r'title'),
        lastDatetime: mapValueOfType<String>(json, r'lastDatetime'),
      );
    }
    return null;
  }

  static List<ChatItem>? listFromJson(dynamic json, {bool growable = true}) {
    final result = <ChatItem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChatItem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ChatItem> mapFromJson(dynamic json) {
    final map = <String, ChatItem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChatItem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ChatItem-objects as value to a dart map
  static Map<String, List<ChatItem>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ChatItem>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChatItem.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'title',
    'lastDatetime',
  };
}

