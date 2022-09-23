import 'package:dua_in_quran/consts.dart';
import "package:flutter/material.dart";

import 'fn/save_settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Arabic Font Size:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Slider(
                    value: arabicFontSize,
                    min: 20,
                    max: 40,
                    onChanged: (value) {
                      setState(() {
                        arabicFontSize = value;
                      });
                    }),
                Text(
                  "بِسْمِ ٱللَّهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ",
                  style: TextStyle(
                    fontFamily: 'quran',
                    fontSize: arabicFontSize,
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
                    value: malayalamFontSize,
                    min: 10,
                    max: 25,
                    onChanged: (value) {
                      setState(() {
                        malayalamFontSize = value;
                      });
                    }),
                Text(
                  'പരമകാരുണികനും കരുണാനിധിയുമായ അല്ലാഹുവിന്റെ നാമത്തില്‍',
                  style: TextStyle(
                      fontFamily: 'malayalam', fontSize: malayalamFontSize),
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
                    value: englishFontSize,
                    min: 10,
                    max: 50,
                    onChanged: (value) {
                      setState(() {
                        englishFontSize = value;
                      });
                    }),
                Text(
                  "In the name of God, the Lord of Mercy, the Giver of Mercy!",
                  style: TextStyle(fontSize: englishFontSize),
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
                    value: transliterationFontSize,
                    min: 10,
                    max: 50,
                    onChanged: (value) {
                      setState(() {
                        transliterationFontSize = value;
                      });
                    }),
                Text(
                  "Bismillah-ir-Rahmann-ir-Rahim",
                  style: TextStyle(fontSize: transliterationFontSize),
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
                    groupValue: malayalam,
                    toggleable: true,
                    onChanged: (value) {
                      setState(() {
                        malayalam = !malayalam;
                      });
                    },
                  ),
                  title: const Text('Malayalam'),
                ),
                ListTile(
                  leading: Radio<bool>(
                    value: true,
                    groupValue: english,
                    toggleable: true,
                    onChanged: (value) {
                      setState(() {
                        english = !english;
                      });
                    },
                  ),
                  title: const Text('English'),
                ),
                ListTile(
                  leading: Radio<bool>(
                    value: true,
                    toggleable: true,
                    groupValue: transliteration,
                    onChanged: (value) {
                      setState(() {
                        transliteration = !transliteration;
                      });
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
                          setState(() {
                            arabicFontSize = 25;
                            englishFontSize = 15;
                            malayalamFontSize = 15;
                            transliterationFontSize = 10;
                            malayalam = true;
                            english = false;
                            transliteration = false;
                          });
                          saveSettings();
                        },
                        label: const Text('Reset')),
                    ElevatedButton.icon(
                        icon: const Icon(Icons.save),
                        onPressed: () {
                          saveSettings();
                          Navigator.pop(context);
                        },
                        label: const Text('Save')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
