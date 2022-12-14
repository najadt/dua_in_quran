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
                // Image.asset(
                //   'assets/quran.png',
                //   height: 80,
                // ),
                const Text(
                  'Dua From Quran',
                  style: TextStyle(fontSize: 20),
                ),
                const Text('ഖുർആനിലുള്ള പ്രാർത്ഥനകൾ')
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
          // ListTile(
          //   leading: const Icon(
          //     Icons.bookmark,
          //   ),
          //   title: const Text(
          //     'Bookmarks',
          //   ),
          //   onTap: () {},
          // ),
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
              Share.share('''*Quran with malayalam meaning*\n
Download from https://play.google.com/store/apps/details?id=org.ahlussunnabooks.quran''');
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
              if (!await launchUrl(quranAppurl,
                  mode: LaunchMode.externalApplication)) {
                throw 'Could not launch $quranAppurl';
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
}
