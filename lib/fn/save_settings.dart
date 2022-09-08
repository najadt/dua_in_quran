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
    arabicFontSize = await prefs.getInt('arabicFontSize')!.toDouble();
    malayalamFontSize = await prefs.getInt('malayalamFontSize')!.toDouble();
    englishFontSize = await prefs.getInt('englishFontSize')!.toDouble();
    transliterationFontSize =
        await prefs.getInt('transliterationFontSize')!.toDouble();
    english = (await prefs.getBool('english'))!;
    malayalam = (await prefs.getBool('malayalam'))!;
    transliteration = (await prefs.getBool('transliteration'))!;
  } catch (e) {}
}
