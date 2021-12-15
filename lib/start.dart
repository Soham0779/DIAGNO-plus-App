import 'dart:js';

import 'package:NewsApp/utisl.dart';
import 'package:flutter/material.dart';

import 'moods.dart';
class Start extends StatelessWidget {
  // const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: mainBgColor,
    body: SingleChildScrollView(
child: Column(
mainAxisAlignment: MainAxisAlignment.start,
children: <Widget>[
Stack(
clipBehavior: Clip.none, alignment: AlignmentDirectional.topCenter,
children: <Widget>[
_backBgCover(),
_greetings(),
_moodsHolder(),
],
),
SizedBox(
height: 50.0,
),
SingleChildScrollView(
  scrollDirection: Axis.vertical,
  child: Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[

        buildQuoteCard(),


        //_specialistsCardInfo(),
      ],
    ),
  ),
),
],
),
),
// bottomNavigationBar: BottomNavigationBar(
//   showSelectedLabels: false,
//   showUnselectedLabels: false,
//   currentIndex: _selectedIndex,
//   items: [
//     BottomNavigationBarItem(
//         icon: Icon(
//           LineAwesomeIcons.home,
//           size: 30.0,
//         ),
//         title: Text('1')),
//     BottomNavigationBarItem(
//         icon: Icon(
//           LineAwesomeIcons.search,
//           size: 30.0,
//         ),
//         title: Text('2')),
//     BottomNavigationBarItem(
//         icon: Icon(
//           LineAwesomeIcons.gratipay,
//           size: 30.0,
//         ),
//         title: Text('3')),
//   ],
//   onTap: onTapped,
// ),
);
  }
}
Positioned _moodsHolder() {
  return Positioned(
    bottom: -45,
    child: Container(
      height: 100.0,
      width: 60,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(28)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 5.5,
              blurRadius: 5.5,
            )
          ]),
      child:MoodsSelector(),
    ),
  );
}

Container _backBgCover() {
  return Container(
    height: 260.0,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
    ),
  );
}

Positioned _greetings() {
  return Positioned(
    left: 20,
    bottom: 90,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'HELLO!',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'How are you feeling today ?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );

}
Widget buildQuoteCard() => Card(
  child: Padding(
    padding: EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'If life were predictable it would cease to be life, and be without flavor.',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 12),
        Text(
          'Eleanor Roosevelt',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  ),
);