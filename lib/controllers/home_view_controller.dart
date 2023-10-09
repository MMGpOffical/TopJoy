import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topjoy/constants.dart' as constants;

class HomeViewController extends GetxController{
  BuildContext context;
  HomeViewController(this.context);

  int bottlecapState = 0 ;
  int random = 0;
  String giveMeMessage(){
    int randoom = Random().nextInt(constants.messages.length);
    return (bottlecapState==10) ? constants.messages[randoom].toUpperCase():"";
  }

  void flipTheBottlecap() async{
    bool condition = (bottlecapState==0);
    random = Random().nextInt(constants.messages.length);
    for (int i = (condition)?0:10; (condition)? i < 11 : i>=0; (condition)? i++ : i--) {
      bottlecapState = i;
     await Future.delayed(Duration(milliseconds: 15));
     update();
    }
  }
  Future<void> preloadAllImages() async{
    for (int i = 0; i < 11; i++) {
      await(AssetImage('images/bottlecap_$i.png'), context);
    }
  }

    @override
    void onInit() async{
      // TODO: implement onInit
      super.onInit();
      await preloadAllImages();
    }
}