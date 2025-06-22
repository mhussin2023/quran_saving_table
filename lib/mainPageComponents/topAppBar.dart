import 'dart:io';
import 'package:flutter/material.dart';
import 'package:quran_saving_table/GeneralMethods/storage_modules.dart';
import 'package:icons_plus/icons_plus.dart';

import '../GeneralMethods/generalMethods.dart';
import '../Rubbish/dashBoardPage.dart';

AppBar getAppBar(Function refreshMainPage,BuildContext context) {
  return AppBar(
    title: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Center(child: Text('جدول المراجعة'))],
      ),
    ),
     // leading: IconButton(onPressed: () {
     //   Navigator.push(
     //     context,
     //     MaterialPageRoute(builder: (context) =>  DashBoardPage(refreshMainPage: refreshMainPage,)),
     //   );
     // },
     //   icon: Icon(Icons.menu)),
    actions: [
      IconButton(
        onPressed: () async {
          await DataStorage.saveBoolList();
        },
        icon: Icon(Icons.save),
      ),


      IconButton(
        onPressed: () async {

           if(await callDialogMethod(context)=='OK'){
             DataStorage.clearStatusList();
           refreshMainPage();}
         // exit(0);
        },
        icon: Icon(AntDesign.clear_outline),
      ),

      IconButton(onPressed: (){
        DataStorage.listType=!DataStorage.listType;
        refreshMainPage();
      },
          icon: Icon(
            color: Colors.cyan,
              DataStorage.listType?
              Clarity.view_cards_line:Clarity.view_list_line)),
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
