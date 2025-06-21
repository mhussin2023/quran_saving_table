import 'package:flutter/material.dart';

class dialogClass {
  //final BuildContext context2;
  //dialogClass();

    showAlertDialog(BuildContext context) {
    print('dialog called');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        print('started dialog');
        return AlertDialog(
          title: Text(
              textAlign: TextAlign.center,
              'رجاء التأكيد'),
          content: Text(
            textAlign: TextAlign.center,
              'هل تريد حذف بيانات الختمة'),
          actionsAlignment: MainAxisAlignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          actions: [

        TextButton(
          child: Text('إلغاء'),
          onPressed: () {
            Navigator.of(context).pop('Cancel');
           // return 'Cancel';
          },
        ),
            TextButton(
              child: Text('نعم'),
              onPressed: () {
                Navigator.of(context).pop('Ok');
               // return 'Ok';
              },),
          ]

        );
      },

    );
  }

}