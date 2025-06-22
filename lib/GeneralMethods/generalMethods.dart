import 'dart:math';
import 'package:flutter/material.dart';



Future<String?> callDialogMethod(BuildContext context) async{
  return await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        Size size=MediaQuery.of(context).size;
        return AlertDialog(
          content: SizedBox(
            width: size.width*0.8,
            height:  size.height*0.15,
            child: Column(
              children: [
                Text(
                    style: TextStyle(fontSize: 20)
                    ,
                    'هل حقا تريد محو بيانات الختمة'),
                SizedBox(width: 10,height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [ ElevatedButton(onPressed: (){

                    print('Cancel');
                    Navigator.pop(context,'Cancel');
                  }, child: Text('رفض')),
                    ElevatedButton(onPressed: (){

                      print('OK');
                      Navigator.pop(context,'OK');

                    },
                        child: Text('موافق')),

                  ],)
              ],
            ),
          ),
        );
      }

  );
}