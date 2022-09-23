import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../consts.dart';

Future saveSettings() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('arabicFontSize', arabicFontSize.toInt());
  await prefs.setInt('malayalamFontSize', malayalamFontSize.toInt());
  await prefs.setInt('englishFontSize', englishFontSize.toInt());
  await prefs.setInt(
      'transliterationFontSize', transliterationFontSize.toInt());
  await prefs.setBool('english', english);
  await prefs.setBool('malayalam', malayalam);
  await prefs.setBool('transliteration', transliteration);
}

Future getSettings() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    arabicFontSize = prefs.getInt('arabicFontSize')!.toDouble();
    malayalamFontSize = prefs.getInt('malayalamFontSize')!.toDouble();
    englishFontSize = prefs.getInt('englishFontSize')!.toDouble();
    transliterationFontSize =
        prefs.getInt('transliterationFontSize')!.toDouble();
    english = (prefs.getBool('english'))!;
    malayalam = (prefs.getBool('malayalam'))!;
    transliteration = (prefs.getBool('transliteration'))!;
  } catch (e) {
    debugPrint('$e');
  }
}
