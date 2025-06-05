import 'package:flutter/material.dart';

import '../storage_modules.dart';

Drawer getDrawer(Function refreshMainPage){
  return Drawer(
child: ChoiceChip(
      label: Text('العرض فى عامود'),
      onSelected: (value) {

          DataStorage.listType = value;
        refreshMainPage();
      },
      selected: DataStorage.listType,
    ),
  );
}