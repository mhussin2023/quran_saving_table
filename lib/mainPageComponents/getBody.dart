import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_saving_table/storage_modules.dart';

Widget getBody(Function refreshMainPage) {
  const List<Color> colorList = [Colors.yellowAccent, Colors.cyan];
  const List<int> separators = [9, 20, 60];

  var r = {
    for (int i = 0; i < 114; i++)
      Card(
        color: colorList[i % 2],
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

            Transform.scale(
              scale: 1.5,
              child: Checkbox(
                value: DataStorage.checkStatus[i],
                shape: CircleBorder(),
                onChanged: (NewValue) {

                    DataStorage.checkStatus[i] = NewValue!;
                refreshMainPage();
                },
              ),
            ),
          ],
        ),
      ),
  }.toList();
  return SafeArea(
    child: Center(
      child: !DataStorage.listType
          ? SingleChildScrollView(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  //shrinkWrap: true,
                  children: r,
                ),
              ),
            )
          : ListView(
              //mainAxisAlignment: MainAxisAlignment.start,
              shrinkWrap: true,
              children: r,
            ),
    ),
  );
}
