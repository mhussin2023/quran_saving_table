import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_saving_table/storage_modules.dart';

Widget getBody(Function refreshMainPage) {
  const List<Color> colorList = [Colors.yellowAccent, Colors.cyan];
  const List<int> separators = [9, 20, 60];

  List<Widget> r=[];

  r.clear();
    for (int i = 0; i < 114; i++) {


      Widget txt = Text(
        quran.getSurahNameArabic(i + 1),
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(fontSize: 30),
      );

      Widget trans = Transform.scale(
        scale: 1.5,
        child: Checkbox(
          value: DataStorage.checkStatus[i],
          shape: CircleBorder(),
          onChanged: (NewValue) {
            DataStorage.checkStatus[i] = NewValue!;
            refreshMainPage();
          },
        ),
      );

if(DataStorage.listType==true){
      r.add(Card(
        color: colorList[i % 2],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            txt, trans
          ],
        ),
      ),
      );

    }
    else {
  r.add(Card(
    color: colorList[i % 2],
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        trans, txt
      ],
    ),
  ));

}
    }
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
