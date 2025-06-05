import 'dart:io';
import 'package:flutter/material.dart';
import 'package:quran_saving_table/storage_modules.dart';

AppBar getAppBar(Function refreshMainPage){
 return AppBar(
    title: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ChoiceChip(
          //   label: Text('العرض فى عامود'),
          //   onSelected: (value) {
          //
          //       DataStorage.listType = value;
          //     refreshMainPage();
          //   },
          //   selected: DataStorage.listType,
          // ),
          Center(child: Text('جدول المراجعة'))
        ],
      ),
    ),
   // leading:
    actions: [
     IconButton(
     onPressed: () async {
   await DataStorage.saveBoolList();
 },
  icon: Icon(Icons.save),
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