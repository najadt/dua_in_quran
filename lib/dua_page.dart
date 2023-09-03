import 'package:dua_in_quran/controller/dua_page_controller.dart';
import 'package:dua_in_quran/duas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'drawer.dart';
import 'fn/save_settings.dart';

class DuaPage extends StatelessWidget {
  const DuaPage({super.key});

  @override
  Widget build(BuildContext context) {
    getSettings();

    Get.put(DuaPageController());
    return Scaffold(
      endDrawer: const MyDrawer(),
      //backgroundColor: Colors.teal[300],
      appBar: AppBar(
        title: const Text(
          'ഖുർആനിലുള്ള പ്രാർത്ഥനകൾ',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
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
          child: ListView.builder(
              itemCount: duas.length,
              itemBuilder: (BuildContext context, int index) {
                final player = AudioPlayer();
                RxBool isPlaying = false.obs;
                var playerState = player.processingStateStream;
                playerState.listen((event) {
                  //print(event);
                  if (event == ProcessingState.completed) {
                    isPlaying.value = false;
                  } else if (event == ProcessingState.ready) {
                    isPlaying.value = true;
                  } else if (event == ProcessingState.idle) {
                    isPlaying.value = false;
                  }
                });
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 234, 244, 243),
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 50, 176, 39),
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 2.5, horizontal: 5),
                  child: GetX<DuaPageController>(builder: (controller) {
                    return Column(
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
                                        '${index + 1}',
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
                                  ' ${duas[index]['sura_name_arabic'] + ' - ' + duas[index]['verse']}',
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
                                      !isPlaying.value
                                          ? controller.play(index, player)
                                          : controller.stop(player);
                                    },
                                    icon: !isPlaying.value
                                        ? const Icon(
                                            Icons.play_arrow_rounded,
                                          )
                                        : const Icon(
                                            Icons.stop,
                                          )),
                                IconButton(
                                    onPressed: () =>
                                        controller.myShare(duas[index]),
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
                          duas[index]['arabic'],
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontSize: controller.arabicFontSize.value,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 184, 153, 14)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (controller.malayalam.value)
                              Text(duas[index]['malayalam'],
                                  style: TextStyle(
                                      fontSize:
                                          controller.malayalamFontSize.value)),
                            if (controller.malayalam.value)
                              const SizedBox(
                                height: 10,
                              ),
                            if (controller.english.value)
                              Text(
                                duas[index]['english'],
                                style: TextStyle(
                                    fontSize: controller.englishFontSize.value),
                              ),
                            if (controller.english.value)
                              const SizedBox(
                                height: 10,
                              ),
                            if (controller.transliteration.value)
                              Text(duas[index]['transliteration'],
                                  style: TextStyle(
                                      fontSize: controller
                                          .transliterationFontSize.value)),
                          ],
                        ),
                      ],
                    );
                  }),
                );
              }),
        ),
      ),
    );
  }
}
