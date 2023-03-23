import '../model_util.dart';
class InfoResDataInfo {
  /// Returns a new [InfoResDataInfo] instance.
  InfoResDataInfo({
    required this.createTime,
    required this.email,
    required this.money,
    required this.phone,
    required this.uid,
  });

  String createTime;

  String email;

  String money;

  String phone;

  String uid;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InfoResDataInfo &&
     other.createTime == createTime &&
     other.email == email &&
     other.money == money &&
     other.phone == phone &&
     other.uid == uid;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createTime == null ? 0 : createTime!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (money == null ? 0 : money!.hashCode) +
    (phone == null ? 0 : phone!.hashCode) +
    (uid == null ? 0 : uid!.hashCode);

  @override
  String toString() => 'InfoResDataInfo[createTime=$createTime, email=$email, money=$money, phone=$phone, uid=$uid]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (createTime != null) {
      _json[r'create_time'] = createTime;
    }
    if (email != null) {
      _json[r'email'] = email;
    }
    if (money != null) {
      _json[r'money'] = money;
    }
    if (phone != null) {
      _json[r'phone'] = phone;
    }
    if (uid != null) {
      _json[r'uid'] = uid;
    }
    return _json;
  }

  /// Returns a new [InfoResDataInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InfoResDataInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "InfoResDataInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "InfoResDataInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return InfoResDataInfo(
        createTime: mapValueOfType<String>(json, r'create_time'),
        email: mapValueOfType<String>(json, r'email'),
        money: mapValueOfType<String>(json, r'money'),
        phone: mapValueOfType<String>(json, r'phone'),
        uid: mapValueOfType<String>(json, r'uid'),
      );
    }
    return null;
  }

  static List<InfoResDataInfo>? listFromJson(dynamic json, {bool growable = true}) {
    final result = <InfoResDataInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InfoResDataInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, InfoResDataInfo> mapFromJson(dynamic json) {
    final map = <String, InfoResDataInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InfoResDataInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of InfoResDataInfo-objects as value to a dart map
  static Map<String, List<InfoResDataInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<InfoResDataInfo>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InfoResDataInfo.listFromJson(entry.value, growable: growable,);
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
    'email',
    'money',
    'phone',
    'uid',
  };
}

