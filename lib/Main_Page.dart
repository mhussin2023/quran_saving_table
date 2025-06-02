import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_saving_table/storage_modules.dart';

class Main_Page extends StatefulWidget {
  const Main_Page({super.key});

  @override
  State<Main_Page> createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BoolStorage.getBoolList().then((onValue) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    BoolStorage.builCounter++;
    print("build number ${BoolStorage.builCounter}");
    const List<Color> colorList = [Colors.yellowAccent, Colors.cyan];
    const List<int> separators = [9, 20, 60];
    if (BoolStorage.checkStatus.length != 114) {
      return Container();
    }
    var r = {
      for (int i = 0; i < 114; i++)
        Card(
          color: colorList[i % 2],

          // width: 50,
          // decoration: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(
          //     40,
          //   ),
          // ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                quran.getSurahNameArabic(i + 1),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 30),
              ),

              CircleAvatar(
                child: Checkbox(
                  value: BoolStorage.checkStatus[i],
                  shape: CircleBorder(),
                  onChanged: (NewValue) {
                    setState(() {
                      BoolStorage.checkStatus[i] = NewValue!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
    }.toList();

    //var r=quran.getSurahName(1);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            children: [
              Text('جدول المراجعة'),
              ChoiceChip(
                label: Text('العرض فى عامود'),
                onSelected: (value) {
                  setState(() {
                    BoolStorage.listType = value;
                  });
                },
                selected: BoolStorage.listType,
              ),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () async {
            await BoolStorage.saveBoolList();
          },
          icon: Icon(Icons.save),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await BoolStorage.saveBoolList();
              exit(0);
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),

      body: SafeArea(
        child: Center(
          child:

          SingleChildScrollView(
            child:
            BoolStorage.listType?
            Wrap(
              alignment: WrapAlignment.end,
              //shrinkWrap: true,
              children: r,
            ):
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: r,
            )

          )

        ),
      ),
    );
  }
}
