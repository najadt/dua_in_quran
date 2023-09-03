import 'package:dua_in_quran/controller/dua_page_controller.dart';
import "package:flutter/material.dart";
import 'package:get/get_state_manager/get_state_manager.dart';

import 'fn/save_settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: GetX<DuaPageController>(builder: (controller) {
              return Column(
                children: [
                  const Text(
                    'Arabic Font Size:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Slider(
                      value: controller.arabicFontSize.value,
                      min: 20,
                      max: 40,
                      onChanged: (value) {
                        controller.arabicFontSize.value = value;
                      }),
                  Text(
                    "بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ",
                    style: TextStyle(
                      fontFamily: 'quran',
                      fontSize: controller.arabicFontSize.value,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(),
                  ),
                  const Text(
                    'Malayalam Font Size:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Slider(
                      value: controller.malayalamFontSize.value,
                      min: 10,
                      max: 25,
                      onChanged: (value) {
                        controller.malayalamFontSize.value = value;
                      }),
                  Text(
                    'പരമകാരുണികനും കരുണാനിധിയുമായ അല്ലാഹുവിന്റെ നാമത്തില്‍',
                    style: TextStyle(
                        fontFamily: 'malayalam',
                        fontSize: controller.malayalamFontSize.value),
                    //textDirection: TextDirection.rtl,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(),
                  ),
                  const Text(
                    'English Font Size:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Slider(
                      value: controller.englishFontSize.value,
                      min: 10,
                      max: 50,
                      onChanged: (value) {
                        controller.englishFontSize.value = value;
                      }),
                  Text(
                    "In the name of God, the Lord of Mercy, the Giver of Mercy!",
                    style:
                        TextStyle(fontSize: controller.englishFontSize.value),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(),
                  ),
                  const Text(
                    'Transliteration Font Size:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Slider(
                      value: controller.transliterationFontSize.value,
                      min: 10,
                      max: 50,
                      onChanged: (value) {
                        controller.transliterationFontSize.value = value;
                      }),
                  Text(
                    "Bismillah-ir-Rahmann-ir-Rahim",
                    style: TextStyle(
                        fontSize: controller.transliterationFontSize.value),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(),
                  ),
                  const Text(
                    'Show/Hide:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  ListTile(
                    leading: Radio<bool>(
                      value: true,
                      groupValue: controller.malayalam.value,
                      toggleable: true,
                      onChanged: (value) {
                        controller.malayalam.value =
                            !controller.malayalam.value;
                      },
                    ),
                    title: const Text('Malayalam'),
                  ),
                  ListTile(
                    leading: Radio<bool>(
                      value: true,
                      groupValue: controller.english.value,
                      toggleable: true,
                      onChanged: (value) {
                        controller.english.value = !controller.english.value;
                      },
                    ),
                    title: const Text('English'),
                  ),
                  ListTile(
                    leading: Radio<bool>(
                      value: true,
                      toggleable: true,
                      groupValue: controller.transliteration.value,
                      onChanged: (value) {
                        controller.transliteration.value =
                            !controller.transliteration.value;
                      },
                    ),
                    title: const Text('Transliteration'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                          icon: const Icon(Icons.restore),
                          onPressed: () {
                            controller.arabicFontSize.value = 25;
                            controller.englishFontSize.value = 15;
                            controller.malayalamFontSize.value = 15;
                            controller.transliterationFontSize.value = 10;
                            controller.malayalam.value = true;
                            controller.english.value = false;
                            controller.transliteration.value = false;

                            saveSettings();
                          },
                          label: const Text('Reset')),
                      ElevatedButton.icon(
                          icon: const Icon(Icons.save),
                          onPressed: () {
                            // arabicFontSize;
                            // malayalamFontSize;
                            // englishFontSize;
                            // transliterationFontSize;
                            // transliteration;
                            // english;
                            // malayalam;

                            saveSettings();
                            Navigator.pop(context);
                          },
                          label: const Text('Save')),
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
