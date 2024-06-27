

import 'dart:developer';

import 'package:flutter/foundation.dart';

appDebugPrint(value, {bool full = false}){
  if(kDebugMode){
    if(full){
      log(value.toString());
    }
    else{
      print(value);
    }

  }

}