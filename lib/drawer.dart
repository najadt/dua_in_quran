import 'package:dua_in_quran/consts.dart';
import 'package:dua_in_quran/support_dev.dart';
import 'package:flutter/material.dart';
import 'other_apps.dart';
import 'package:share_plus/share_plus.dart';
import 'settings.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'about.dart';
//import 'share_content.dart';
//mport 'constants_variables.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: const Color.fromARGB(255, 253, 251, 240) ,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/icon/icon.png',
                  height: 80,
                ),
                // const Text(
                //   'Dua From Quran',
                //   style: TextStyle(fontSize: 20),
                // ),
                const Text('ഖുർആനിലുള്ള പ്രാർത്ഥനകൾ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: const Text(
              'Settings',
            ),
            onTap: () async {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.book,
              //color: themeColor,
            ),
            title: const Text('Buy Books'),
            subtitle: const Text("ahlussunnabooks.org"),
            onTap: ahlussunnaBooks,
          ),
          ListTile(
            leading: const Icon(
              Icons.apps,
            ),
            title: const Text(
              'Other Apps',
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const OtherApps()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
            ),
            title: const Text(
              'Share',
            ),
            onTap: () {
              Share.share(
                  '''📲 *ഖുർആനിലെ പ്രാർത്ഥനകൾ ഇനി നിങ്ങളുടെ മൊബൈൽ ഫോണിലും* 📲
              
വിശുദ്ധ ഖുർആനിലെ ശ്രേഷ്ഠമായ പ്രാർത്ഥനകളുടെ മൊബൈൽ ആപ്ലിക്കേഷൻ ഇതാ നിങ്ങളുടെ വിരൽത്തുമ്പിൽ...

കടുത്ത ദുരന്തങ്ങളുടെയും പരീക്ഷണങ്ങളുടെയും കനൽപഥങ്ങളിൽനിന്ന് ആശ്വാസത്തിന്റെയും സന്തോഷത്തിന്റെയും തീരമണയാൻ പ്രചോദനമാകുന്ന, ഖുർആൻ ഉദ്ധരിച്ച വിവിധ പ്രാർത്ഥനകളുടെ ക്രോഡീകരണം.

🧭  മലയാളം ഇംഗ്ലീഷ് അർത്ഥ സഹിതം

🎙️ പഠന സൗകര്യത്തിന് പ്രാർത്ഥനകളുടെ ഓഡിയോ

💡 ഇൻസ്റ്റാൾ ചെയ്യാൻ താഴെ കൊടുത്ത ലിങ്കിൽ ക്ലിക്ക് ചെയ്യുക:

Download: https://play.google.com/store/apps/details?id=dev.najad.duasinquran''');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.rate_review,
            ),
            title: const Text(
              'Rate',
            ),
            onTap: () async {
              if (!await launchUrl(duaFromQuranurl,
                  mode: LaunchMode.externalApplication)) {
                throw 'Could not launch $duaFromQuranurl';
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.monetization_on),
            title: const Text('Support Developer'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DonationPage(),
                  ));
            },
          ),
          // ListTile(
          //   leading: const Icon(
          //     Icons.info,
          //   ),
          //   title: const Text(
          //     'About',
          //   ),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const AboutPage(),
          //         ));
          //   },
          // ),
        ],
      ),
    );
  }

  void ahlussunnaBooks() async {
    if (!await launchUrl(ahlussunnaBooksUrl,
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $ahlussunnaBooksUrl';
    }
  }
}
