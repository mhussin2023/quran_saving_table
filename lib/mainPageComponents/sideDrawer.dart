import 'package:flutter/material.dart';

import '../GeneralMethods/storage_modules.dart';
//import '../dashBoardPage/AlertDialoge.dart';
//
//
// Drawer getDrawer(Function refreshMainPage,Function goBack,BuildContext context){
//   const smallSpace=SizedBox(height: 10,);
//   return Drawer(
// child: Column(
//   children: [
//     SizedBox(height: 100,),
//     Directionality(
//
//       textDirection: TextDirection.rtl,
//       child: ChoiceChip(
//
//             label: Text('العرض فى عامود'),
//             onSelected: (value) {
//
//                 DataStorage.listType = value;
//               refreshMainPage();
//               goBack();
//             },
//             selected: DataStorage.listType,
//           ),
//     ),
//     smallSpace,
//   ElevatedButton(onPressed: () async {
//     print('command called');
//     var ret=await dialogClass(context).showAlertDialog(context);
//     print(ret);
//
//    // DataStorage.clearStatusList();
//     refreshMainPage();
//     goBack();
//   },
//       child: Text("بدء ختمة جديدة"))
//     ,
//     smallSpace,
//     // ElevatedButton(onPressed: (){
//     //   String? feedback=dialogClass.showAlertDialog(context);
//     //   print(feedback);
//     // DataStorage.saveToDevice('');
//     // },child:Text(textAlign: TextAlign.center,
//     //     "حفظ بيانات الختمة\n على الهاتف") )
//   ],
//
// ),
//   );
// }
//
