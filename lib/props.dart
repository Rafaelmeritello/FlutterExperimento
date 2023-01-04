import 'dart:async';

import 'package:flutter/material.dart';

class Props{
  Props();
  StreamController<Widget> appbarcontroler = StreamController<Widget>.broadcast();

  updateappbar(Widget title){
    this.appbarcontroler.sink.add(
      title
    );
  }
}