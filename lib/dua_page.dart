import 'package:dua_in_quran/consts.dart';
import 'package:dua_in_quran/duas.dart';
import 'package:dua_in_quran/settings.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:share_plus/share_plus.dart';
import 'fn/save_settings.dart';

class DuaPage extends StatefulWidget {
  const DuaPage({Key? key}) : super(key: key);

  @override
  State<DuaPage> createState() => _DuaPageState();
}

class _DuaPageState extends State<DuaPage> {
  final player = AudioPlayer();

  bool state = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getSettings();
      setState(() {
        arabicFontSize;
        malayalamFontSize;
        englishFontSize;
        transliterationFontSize;
        transliteration;
        english;
        malayalam;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.teal[300],
      appBar: AppBar(
        title: const Text(
          'ഖുർആനിലുള്ള പ്രാർത്ഥനകൾ',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
              setState(() {
                arabicFontSize;
                malayalamFontSize;
                englishFontSize;
                transliterationFontSize;
                transliteration;
                english;
                malayalam;
              });
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/dua_app_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(137, 77, 182, 172),
          ),
          child: ListView(
            children: [
              for (int i = 0; i < duas.length; i++)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(233, 234, 244, 243),
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 50, 176, 39),
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(
                      vertical: 2.5, horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Text(
                                      '${i + 1}',
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Image.asset(
                                      'assets/number_bg.png',
                                      // scale: 0.2,
                                      height: 30,
                                    ),
                                  ]),
                              Text(
                                ' ${duas[i]['sura_name_arabic'] + ' - ' + duas[i]['verse']}',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    play(i);
                                  },
                                  icon: const Icon(Icons.play_arrow_rounded)),
                              IconButton(
                                  onPressed: () => myShare(duas[i]),
                                  icon: const Icon(Icons.share))
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.teal,
                        thickness: 1,
                      ),
                      Text(
                        duas[i]['arabic'],
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: arabicFontSize,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 184, 153, 14)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (malayalam)
                            Text(duas[i]['malayalam'],
                                style:
                                    TextStyle(fontSize: malayalamFontSize)),
                          if (malayalam)
                            const SizedBox(
                              height: 10,
                            ),
                          if (english)
                            Text(
                              duas[i]['english'],
                              style: TextStyle(fontSize: englishFontSize),
                            ),
                          if (english)
                            const SizedBox(
                              height: 10,
                            ),
                          if (transliteration)
                            Text(duas[i]['transliteration'],
                                style: TextStyle(
                                    fontSize: transliterationFontSize)),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  play(i) async {
    setState(() {
      state = true;
    });
    await player.setAsset('assets/audios/${duas[i]['audiolink']}.mp3');
    await player.play();

    //await player.stop();
  }

  stop() async {
    setState(() {
      state = false;
    });
    await player.stop();
  }

  myShare(dua) {
    //String appLink = '''https:\\najad.dev\duaApp''';
    String shareText = dua['arabic'] +
        '\n\n' +
        (malayalam ? dua['malayalam'] + '\n\n' : '') +
        (english ? dua['english'] + '\n\n' : '') +
        (transliteration ? dua['transliteration'] + '\n\n' : '') +
        ('${dua['sura_name_arabic']}:${dua['verse']}');

    Share.share(shareText);
  }
}
