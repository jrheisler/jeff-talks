import 'dart:core';


import 'load_url.dart';

class MyPhone {
  final String number;

  MyPhone(this.number);

  void send() {
      String call = 'tel:$number';
      LaunchFile.launchUrl(call);
    }


}
