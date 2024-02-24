import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/university_info.dart';

class SharedPreferencesService {
  static const String _universityInfoKey = 'university_info';

  static Future<void> saveUniversityInfo(UniversityInfo universityInfo) async {
    final prefs = await SharedPreferences.getInstance();
    final String universityInfoJson = json.encode(universityInfo.toJson());
    await prefs.setString(_universityInfoKey, universityInfoJson);
  }

  static Future<UniversityInfo?> loadUniversityInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final String? universityInfoJson = prefs.getString(_universityInfoKey);
    if (universityInfoJson != null) {
      return UniversityInfo.fromJson(json.decode(universityInfoJson));
    }
    return null;
  }
}
