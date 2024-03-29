// ignore_for_file: non_constant_identifier_names

import 'package:dua_in_quran/consts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OtherApps extends StatelessWidget {
  const OtherApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Other Apps",
          ),
          backgroundColor: const Color.fromARGB(255, 56, 115, 59),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                appTile(
                    launchUrl: AvoiceURL,
                    icon: 'assets/ahlussunna_voice_logo.jpeg',
                    discription:
                        '''ഡൗൺലോഡ് ചെയ്യാതെ തന്നെ അഹ്‌ലുസ്സുന്ന ദാഇമാരുടെ, വ്യത്യസ്ത വിഷയങ്ങളിലുള്ള പഠനാർഹമായ ക്ലാസുകളും ദർസുകളും കേൾക്കാൻ ഈ ആപ്പ് നിങ്ങളെ സഹായിക്കുന്നു.''',
                    appName: 'Ahlussunna Voice'),
                const SizedBox(
                  height: 15,
                ),
                appTile(
                  launchUrl: AwraadURL,
                  icon: 'assets/awraad.png',
                  appName: 'Awraad (Adkaar App)',
                  discription:
                      '''പ്രാർത്ഥന പുസ്തകങ്ങളിൽ ഏറ്റവും മുന്നിൽ നിൽക്കുന്ന (സഹീഹുൽ അധ്കാർ) എന്ന കൃതിയുടെ മൊബൈൽ പതിപ്പാണ് ഈ അപ്ലിക്കേഷൻ.''',
                ),
                const SizedBox(
                  height: 15,
                ),
                appTile(
                  launchUrl: Quran,
                  icon: 'assets/quran.png',
                  appName: 'Quran With Meaning',
                  discription:
                      '''മലയാള പരിഭാഷ: ചെറിയമുണ്ടം അബ്ദുൽ ഹമീദ് & കുഞ്ഞി മുഹമ്മദ് പറപ്പൂർ''',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton appTile({launchUrl, appName, icon, discription}) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return const Color.fromARGB(255, 255, 255, 255);
          },
        ),
      ),
      onPressed: launchUrl,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                appName,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            Row(
              children: [
                Image.asset(
                  icon,
                  height: 80,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    discription,
                    style: const TextStyle(color: Colors.black54),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  void AvoiceURL() async {
    if (!await launchUrl(aVoiceUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $aVoiceUrl';
    }
  }

  void AwraadURL() async {
    if (!await launchUrl(awraadUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $awraadUrl';
    }
  }

  void Quran() async {
    if (!await launchUrl(quranAppUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $quranAppUrl';
    }
  }
}
