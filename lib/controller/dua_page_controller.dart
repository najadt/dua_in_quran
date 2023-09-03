import 'package:dua_in_quran/duas.dart';
import 'package:get/state_manager.dart';
import 'package:just_audio/just_audio.dart';
import 'package:share_plus/share_plus.dart';

class DuaPageController extends GetxController {
  RxDouble malayalamFontSize = 15.0.obs,
      arabicFontSize = 25.0.obs,
      transliterationFontSize = 12.0.obs,
      englishFontSize = 15.0.obs;

  RxBool malayalam = true.obs, english = false.obs, transliteration = false.obs;

  play(index,AudioPlayer player) async {
    await player.stop();
    await player.setAsset('assets/audios/${duas[index]['audiolink']}.mp3');
    await player.play();
  }

  stop(AudioPlayer player) async {
    await player.stop();
    
  }

  myShare(dua) {
    //String appLink = '''https:\\najad.dev\duaApp''';
    String shareText = dua['arabic'] +
        '\n\n' +
        (malayalam.value ? dua['malayalam'] + '\n\n' : '') +
        (english.value ? dua['english'] + '\n\n' : '') +
        (transliteration.value ? dua['transliteration'] + '\n\n' : '') +
        ('${dua['sura_name_arabic']}:${dua['verse']}');

    Share.share(shareText);
  }
}
