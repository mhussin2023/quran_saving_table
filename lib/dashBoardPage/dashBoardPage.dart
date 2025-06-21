import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../storage_modules.dart';
import '../mainPageComponents/AlertDialoge.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key, required this.refreshMainPage});
  final Function refreshMainPage;

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

  @override
  Widget build(BuildContext context) {
    print('draw dash board');
    var smallSpace = SizedBox(height: 30,);
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisSize: MainAxisSize.max,

        children: [
          SizedBox(height: 100,),
          Directionality(

            textDirection: TextDirection.rtl,
            child: ChoiceChip(

              label: Text('العرض فى عامود'),
              onSelected: (value) {
                setState(() {
                  DataStorage.listType = value;
                });

                widget.refreshMainPage();
                goBack();
              },
              selected: DataStorage.listType,
            ),
          ),
          smallSpace,
          // ElevatedButton(onPressed: ()async  {
          //   print('started dialog');
          //   //showAlertDialog();
          //   String? x=await callDialogMethod(context);
          //   print(x);
          //
          //   if(x=='OK'){DataStorage.clearStatusList();
          //   widget.refreshMainPage();
          //          }
          //   goBack();
          //  // ;
          //   //
          // },
             // child: Text("بدء ختمة جديدة"))

          smallSpace,
          ElevatedButton(onPressed: () async {
            // String? feedback=dialogClass.showAlertDialog(context);
            //print(feedback);
            String fileName=await getFileName();
            DataStorage.saveToDevice(fileName);
          }, child: Text(textAlign: TextAlign.center,
              "حفظ بيانات الختمة\n على الهاتف"))
        ],

      ),
    );
  }

  // Future<String?> callDialogMethod(BuildContext context) async{
  //   return await showDialog<String>(
  //       context: context,
  //       builder: (BuildContext context) {
  //         Size size=MediaQuery.of(context).size;
  //          return AlertDialog(
  //           content: SizedBox(
  //             width: size.width*0.8,
  //             height:  max(size.height*0.1,60),
  //             child: Column(
  //               children: [
  //                 Text('fff'),
  //                 SizedBox(width: 10,height: 10),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                   ElevatedButton(onPressed: (){
  //
  //                     print('OK');
  //                     Navigator.pop(context,'OK');
  //
  //                   },
  //                       child: Text('موافق')),
  //                   ElevatedButton(onPressed: (){
  //
  //                     print('Cancel');
  //                     Navigator.pop(context,'Cancel');
  //                   }, child: Text('زفض'))
  //                 ],)
  //               ],
  //             ),
  //           ),
  //         );
  //       }
  //
  //   );
  // }

  void goBack() {
    Navigator.pop(context);
  }

  Future<String> getFileName() async {
    String _fileName='';
    TextEditingController _controller=TextEditingController();
    _fileName=await showDialog(context: context,

        builder: (BuildContext context) {
      return AlertDialog(
        title: Title(color: Colors.cyan, child: Text('أدخل اسم الختمة')),
        content: TextField(
          controller: _controller,
        ),
        actions: [
          ElevatedButton(onPressed: (){
            _fileName=_controller.text;
            print('filename=$_fileName');
            Navigator.pop(context,_fileName);
          }, child: Text('ok'))
          ]
      );
        } );
    return _fileName;
  }






}

