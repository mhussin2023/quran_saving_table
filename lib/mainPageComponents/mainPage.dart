import 'package:flutter/material.dart';
import 'package:quran_saving_table/mainPageComponents/topAppBar.dart';
import 'package:quran_saving_table/GeneralMethods/storage_modules.dart';
import 'getBody.dart';

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
    DataStorage.getBoolList().then((onValue) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    DataStorage.builCounter++;
    print("build number ${DataStorage.builCounter}");
  print("length is ${DataStorage.checkStatus.length}");

    if (DataStorage.checkStatus.length != 114) {
      return Container();
    }

    return Scaffold(
      appBar: getAppBar(refreshMainPage,context),
      body: getBody(refreshMainPage)
    );
  }

  void refreshMainPage() => setState(() {});
  void goBack()=>Navigator.pop(context);

}