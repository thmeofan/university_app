import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/university_info.dart';

class UniversityPreferences {
  static const _keyUniversity = 'university';
  static const _keyUniversities = 'universities';

  Future<void> saveUniversity(UniversityInfo universityInfo) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String universityJson = jsonEncode(universityInfo.toJson());
    await prefs.setString(_keyUniversity, universityJson);
  }

  Future<UniversityInfo?> loadUniversity() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? universityJson = prefs.getString(_keyUniversity);
    if (universityJson == null) return null;
    return UniversityInfo.fromJson(jsonDecode(universityJson));
  }

  Future<void> saveUniversityList(List<UniversityInfo> universities) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Convert the list of UniversityInfo objects to a list of JSON strings
    List<String> universityJsonList =
        universities.map((uni) => jsonEncode(uni.toJson())).toList();
    // Save the list of JSON strings to shared preferences
    await prefs.setStringList(_keyUniversities, universityJsonList);
  }

  Future<List<UniversityInfo>> loadUniversityList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Get the list of JSON strings from shared preferences
    List<String>? universityJsonList = prefs.getStringList(_keyUniversities);
    // If the list is null (not found), return an empty list
    if (universityJsonList == null) return [];
    // Otherwise, convert each JSON string back to a UniversityInfo object
    return universityJsonList
        .map((uniJson) => UniversityInfo.fromJson(jsonDecode(uniJson)))
        .toList();
  }
}
