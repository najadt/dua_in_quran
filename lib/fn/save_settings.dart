import 'package:dua_in_quran/controller/dua_page_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


DuaPageController controller = Get.put(DuaPageController());
Future saveSettings() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('arabicFontSize', controller.arabicFontSize.value.toInt());
  await prefs.setInt(
      'malayalamFontSize', controller.malayalamFontSize.value.toInt());
  await prefs.setInt(
      'englishFontSize', controller.englishFontSize.value.toInt());
  await prefs.setInt('transliterationFontSize',
      controller.transliterationFontSize.value.toInt());
  await prefs.setBool('english', controller.english.value);
  await prefs.setBool('malayalam', controller.malayalam.value);
  await prefs.setBool('transliteration', controller.transliteration.value);
}

Future getSettings() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    controller.arabicFontSize.value =
        prefs.getInt('arabicFontSize')!.toDouble();
    controller.malayalamFontSize.value =
        prefs.getInt('malayalamFontSize')!.toDouble();
    controller.englishFontSize.value =
        prefs.getInt('englishFontSize')!.toDouble();
    controller.transliterationFontSize.value =
        prefs.getInt('transliterationFontSize')!.toDouble();
    controller.english.value = (prefs.getBool('english'))!;
    controller.malayalam.value = (prefs.getBool('malayalam'))!;
    controller.transliteration.value = (prefs.getBool('transliteration'))!;
  } catch (e) {
    debugPrint('$e');
  }
}
