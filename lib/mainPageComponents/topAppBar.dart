import 'dart:io';
import 'package:flutter/material.dart';
import 'package:quran_saving_table/GeneralMethods/storage_modules.dart';
import 'package:icons_plus/icons_plus.dart';
import '../GeneralMethods/dialogMethod.dart';


AppBar getAppBar(Function refreshMainPage, BuildContext context) {
  Size sz=MediaQuery.of(context).size;
  return AppBar(
    title:
    Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Center(child: Text('جدول المراجعة'))],
      ),
    ),

    actions: [
      IconButton(
        onPressed: () async {
          await DataStorage.saveBoolList();
          showMessage(context,"تم حفظ الجدول"  );
        },
        icon: Icon(Icons.save),
      ),

      IconButton(
        onPressed: () async {
          if (await callDialogMethod(context) == 'OK') {
            DataStorage.clearStatusList();
            showMessage(context, "تم مسح بيانات الختمة");
            refreshMainPage();
          }
          // exit(0);
        },
        icon: Icon(AntDesign.clear_outline),
      ),

      IconButton(
        onPressed: () {
          DataStorage.listType = !DataStorage.listType;
          refreshMainPage();

          showMessage(context,
          DataStorage.listType?
          'العرض فى أعمدة':'العرض فى صفوف ',



          );
        },
        icon: Icon(
          color: Colors.cyan,
          DataStorage.listType
              ? Clarity.view_cards_line
              : Clarity.view_list_line,
        ),
      ),
      IconButton(
        onPressed: () async {
          await DataStorage.saveBoolList();
          exit(0);
        },
        icon: Icon(Icons.exit_to_app),
      ),
    ],
  );
}

void showMessage(BuildContext context,String message){
  Size sz=MediaQuery.of(context).size;
ScaffoldMessenger.of(context).showSnackBar(

SnackBar(
shape:RoundedRectangleBorder
(borderRadius:BorderRadius.circular(10),
),

backgroundColor: Colors.greenAccent,
width: sz.width*0.8,
// margin: EdgeInsets.only(
//     bottom: sz.height/2
// ),
behavior: SnackBarBehavior.floating,
content: Text(

textAlign: TextAlign.center,
style: TextStyle(
color: Colors.black,
fontSize: 20),
    message),
)


);}