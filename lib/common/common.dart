import 'package:flutter/material.dart';



const String appTitle = 'Jeff Talks';
const String appEmail = 'jrheisler@yahoo.com';
const String version = '.010';


const kPrimaryColor = Colors.deepPurple;

Container inLineComment(String text) {
  return Container(
    color: Colors.deepOrange,
    //decoration: newBoxDec(boxColor: Colors.deepOrange),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(28, 48, 28, 48),
      child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: kShadow(38),
          )),
    ),
  );
}

Widget underLineComment(String text) {
  return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: kShadow(40),
      ));
}


TextStyle kShadow(double size) { return  TextStyle(
    inherit: true,
    fontSize: size,
    color: Colors.white,
    shadows: const [
//outline text
      Shadow(
// bottomLeft
          offset: Offset(-1, -1),
          color: Colors.black),
      Shadow(
// bottomRight
          offset: Offset(1, -1),
          color: Colors.black),
      Shadow(
// topRight
          offset: Offset(1, 1),
          color: Colors.black),
      Shadow(
// topLeft
          offset: Offset(-1, 1),
          color: Colors.black),
    ]);}


    bool

isNight() {
  final now = DateTime.now();
  final sunset = DateTime(
      now.year, now.month, now.day, 18, 0); // Assume sunset at 6:00 PM
  final sunrise = DateTime(
      now.year, now.month, now.day, 6, 0); // Assume sunrise at 6:00 AM

  return now.isAfter(sunset) || now.isBefore(sunrise);
}

String loadImageUrl({required String image}) {
  return 'https://drive.google.com/thumbnail?id='
      '$image'
      '&sz=w1000';
}

Widget kDivider({thick, color}) {
  double thick = 1.0;
  Color color = kPrimaryColor;

  return Divider(
    color: color,
    height: 1.0,
    thickness: thick,
  );
}

BoxDecoration newBoxDec({
  Color boxColor = Colors.transparent,
  Color shadowColor = Colors.black,
  Color borderColor = Colors.blue,
}) {
  if (boxColor == Colors.transparent) {
    boxColor = Colors.black87;
    shadowColor = Colors.deepPurpleAccent;
    borderColor = kPrimaryColor;
  }

  return BoxDecoration(
    borderRadius: BorderRadius.circular(5.0),
    color: boxColor,
    border: Border(
      top: BorderSide(color: borderColor, width: 1.0),
      left: BorderSide(color: borderColor, width: 1.0),
      bottom: BorderSide(color: borderColor, width: 1.0),
      right: BorderSide(color: borderColor, width: 1.0),
    ),
    //borderRadius: BorderRadius.circular(20.0),
    boxShadow: [
      BoxShadow(
        color: shadowColor,
        offset: const Offset(0, 2),
        blurRadius: 2.0,
      ),
    ],
  );
}
