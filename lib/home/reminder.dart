
import 'package:NewsApp/model/calendar_day_model.dart';
import 'package:NewsApp/model/pill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../notifications/notifications.dart';
import '../../database/repository.dart';

import 'calendar.dart';
import 'medicines_list.dart';

class Reminder extends StatefulWidget {
  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  //-------------------| Flutter notifications |-------------------
  final Notifications _notifications = Notifications();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  //===============================================================

  //--------------------| List of Pills from database |----------------------
  List<Pill> allListOfPills = <Pill>[];
  final Repository _repository = Repository();
  List<Pill> dailyPills = <Pill>[];
  //=========================================================================

  //-----------------| Calendar days |------------------
  final CalendarDayModel _days = CalendarDayModel();
  List<CalendarDayModel> _daysList;
  //====================================================

  //handle last choose day index in calendar
  int _lastChooseDay = 0;

  @override
  void initState() {
    super.initState();
    initNotifies();
    setData();
    _daysList = _days.getCurrentDays();
  }

  //init notifications
  Future initNotifies() async => flutterLocalNotificationsPlugin =
      await _notifications.initNotifies(context);

  //--------------------GET ALL DATA FROM DATABASE---------------------
  Future setData() async {
    allListOfPills.clear();
    (await _repository.getAllData("Pills")).forEach((pillMap) {
      allListOfPills.add(Pill().pillMapToObject(pillMap));
    });
    chooseDay(_daysList[_lastChooseDay]);
  }
  //===================================================================

  @override
  Widget build(BuildContext context) {
    final double deviceHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    final Widget addButton = FloatingActionButton(
      elevation: 2.0,
      onPressed: () async {
        //refresh the pills from database
        await Navigator.pushNamed(context, "/add_new_medicine")
            .then((_) => setData());
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: 24.0,
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );

    return Scaffold(
      floatingActionButton: addButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: Text('Diagno+'),
        backgroundColor: Color.fromRGBO(190, 230, 255, 100),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                top: 0.0, left: 25.0, right: 25.0, bottom: 10.0),
            child: Column(
              children: [
                Image.asset('assets/medicine1.jpeg',
                    width: double.infinity, height: deviceHeight * 0.3),
                SizedBox(
                  height: deviceHeight * 0.04,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    alignment: Alignment.topCenter,
                    // height: deviceHeight * 0.1,
                    // child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     // Text(
                    //     //   "Journal",
                    //     //   style: Theme.of(context)
                    //     //       .textTheme
                    //     //       .headline1
                    //     //       .copyWith(color: Colors.black),
                    //     // ),
                    //     // ShakeAnimatedWidget(
                    //     //   enabled: true,
                    //     //   duration: Duration(milliseconds: 2000),
                    //     //   curve: Curves.linear,
                    //     //   shakeAngle: Rotation.deg(z: 30),
                    //     //   child: Icon(
                    //     //     Icons.notifications_none,
                    //     //     size: 42.0,
                    //     //   ),
                    //     // )
                    //   ],
                    // ),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.00,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Calendar(chooseDay, _daysList),
                ),
                SizedBox(height: deviceHeight * 0.01),
                dailyPills.isEmpty
                    ? Container(
                        child: Column(children: [
                        Image.asset('assets/doctor.png',
                            width: double.infinity, height: deviceHeight * 0.3),
                        Text('oops! nothing here',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              fontFamily: "Popins",
                            ))
                      ]))

                    // SizedBox(
                    //     width: double.infinity,
                    //     height: 100,
                    //     child: WavyAnimatedTextKit(d
                    //       textStyle: TextStyle(
                    //           fontSize: 32.0,
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.black),
                    //       text: ["Loading..."],
                    //       isRepeatingAnimation: true,
                    //       speed: Duration(milliseconds: 150),
                    //     ),
                    //   )
                    : MedicinesList(
                        dailyPills, setData, flutterLocalNotificationsPlugin)
              ],
            ),
          ),
        ),
      ),
    );
  }

  //-------------------------| Click on the calendar day |-------------------------

  void chooseDay(CalendarDayModel clickedDay) {
    setState(() {
      _lastChooseDay = _daysList.indexOf(clickedDay);
      _daysList.forEach((day) => day.isChecked = false);
      CalendarDayModel chooseDay = _daysList[_daysList.indexOf(clickedDay)];
      chooseDay.isChecked = true;
      dailyPills.clear();
      allListOfPills.forEach((pill) {
        DateTime pillDate =
            DateTime.fromMicrosecondsSinceEpoch(pill.time * 1000);
        if (chooseDay.dayNumber == pillDate.day &&
            chooseDay.month == pillDate.month &&
            chooseDay.year == pillDate.year) {
          dailyPills.add(pill);
        }
      });
      dailyPills.sort((pill1, pill2) => pill1.time.compareTo(pill2.time));
    });
  }

  //===============================================================================

}
