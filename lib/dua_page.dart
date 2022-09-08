import 'package:dua_in_quran/duas.dart';
import 'package:flutter/material.dart';

class DuaPage extends StatefulWidget {
  const DuaPage({Key? key}) : super(key: key);

  @override
  State<DuaPage> createState() => _DuaPageState();
}

class _DuaPageState extends State<DuaPage> {
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
            onPressed: null,
            icon: Icon(Icons.settings),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/dua_app_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(187, 77, 182, 172),
            ),
            child: ListView(
              children: [
                for (int i = 0; i < duas.length; i++)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(211, 224, 242, 241),
                      border: Border.all(
                        width: 1,
                        color: Color.fromARGB(255, 50, 176, 39),
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 2.5, horizontal: 5),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: [
                                        Text(
                                          '${i + 1}',
                                          style: TextStyle(
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
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.play_arrow_rounded)),
                                IconButton(
                                    onPressed: null, icon: Icon(Icons.share))
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
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 184, 153, 14)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(duas[i]['malayalam']),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          duas[i]['english'],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(duas[i]['transliteration'],
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
