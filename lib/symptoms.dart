// ignore_for_file: deprecated_member_use, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';

import 'components/MultiSelectChip.dart';

class Symptoms extends StatefulWidget {
  Symptoms({this.title = "Symptoms Checker"});

  final String title;

  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  // ignore: non_constant_identifier_names

  List<String> Symptoms = [
    "Cold",
    "headache",
    "vomitting",
    "chills",
    "bodyache",

    'fever',

    'sweating',
    'breathing problem',
    'lose of taste',
    'runny nose',
    'sore throat'
  ];

  List<String> selectedSymptoms = ['none chosen'];
  String get checker {
    // for (var i = 0; i < selectedSymptoms.length; i++) {
    //   test(String val)=> val.contains(selectedSymptoms[i]);
    //  if( Symptoms.any(test)=='fever')
    //    {
    //
    //    }
    // }

    for (var i = 0; i < selectedSymptoms.length; i++) {
      if (selectedSymptoms[i] == 'fever') {
        for (var j = i; j < selectedSymptoms.length; j++) {
          if (selectedSymptoms[j] == 'headache') {
            for (var k = j; k < selectedSymptoms.length; k++) {
              if (selectedSymptoms[k] == 'sweating') {
                for (var l = k; l < selectedSymptoms.length; l++) {
                  if (selectedSymptoms[l] == 'breathing problem') {
                    for (var m = l; m < selectedSymptoms.length; m++) {
                      if (selectedSymptoms[m] == 'lose of taste') {
                        for (var n = m; n < selectedSymptoms.length; n++) {
                          if (selectedSymptoms[n] == 'runny nose') {
                            for (var o = n; o < selectedSymptoms.length; o++) {
                              if (selectedSymptoms[o] == 'sore throat') {
                                return 'you got CORONA, immidiately see a closest doctor';
                              } else {
                                return 'you got CORONA, immidiately see a closest doctor';
                              }
                            }
                          } else {
                            return 'you got CORONA, immidiately see a closest doctor';
                          }
                        }
                      } else {
                        return 'you got CORONA, immidiately see a closest doctor';
                      }
                    }
                  } else {
                    return 'you may have  CORONA,  see a closest doctor';
                  }
                }
              } else {
                return 'sweat error';
              }
            }
          } else {
            return 'nothing to worry, chill';
          }
          if (selectedSymptoms[j] == 'headache') {
            return 'You would be fine soon!';
          } else {
            return 'You just have cold, nothing to worry:)';
          }
        }
        return "You got viral fever";
      } else {
        return "you are all alright";
      }
    }
    // print(selectedSymptoms);
  }

  _showReportDialog() {
    // checker(selectedSymptoms, value);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          //Here we will build the content of the dialog
          return AlertDialog(
            title: const Text("Please choose your symptoms"),
            content: MultiSelectChip(
              Symptoms,
              onSelectionChanged: (selectedList) {
                setState(() {
                  selectedSymptoms = selectedList;
                });
              },
            ),
            actions: <Widget>[
              OutlineButton(
                child: Text("Diagnose"),
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.blueAccent,),
      body: (Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
              width: 300,
              child: Image.asset('assets/symptoms.png'),
            ),

            // Container(                               //

            //            //   height: 100,
            //   width: 200,
            //   child: OutlineButton(
            //       borderSide: BorderSide(
            //         color: Colors.blue,
            //       ),
            //       padding: const EdgeInsets.all(20),
            //       textColor: Colors.blue,
            //       // color: Colors.blue,
            //       child: (Text(
            //         "Click me!",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           fontSize: 30,
            //         ),
            //       )),
            //       onPressed: () {
            //         _showReportDialog();
            //       }),
            // ),
            Container(
              height: 10,
              width: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.white,
              elevation: 20,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  _showReportDialog();
                },
                child: SizedBox(
                    width: 300,
                    height: 100,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.arrow_drop_down_circle,
                              color: Colors.blue, size: 25),
                          title: Text(
                              'So following are the reasons troubling your ease:',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(
                            selectedSymptoms.join(" , "),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Container(
              height: 10,
              width: 20,
            ),
            // Container(
            //     // width: 300,
            //     // height: 100,
            //     padding: new EdgeInsets.all(10.0),
            //     child: (Card(
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(15.0),
            //       ),
            //       color: Colors.white,
            //       elevation: 30,
            //       child: Column(
            //         mainAxisSize: MainAxisSize.min,
            //         children: <Widget>[
            //           ListTile(
            //             leading: Icon(Icons.arrow_drop_down_circle,
            //                 color: Colors.blue, size: 25),
            //             title: Text(
            //                 'So following are the reasons troubling your ease:',
            //                 style: TextStyle(
            //                     color: Colors.blue,
            //                     fontWeight: FontWeight.bold)),
            //             subtitle: Text(
            //               selectedSymptoms.join(" , "),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ))),

            // Text(selectedSymptoms.join(" , ")),
            // Text(value),
            // Text(checker),
            Container(
                width: 300,
                height: 100,
                padding: new EdgeInsets.all(10.0),
                child: (Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.blue,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading:
                            Icon(Icons.favorite, color: Colors.white, size: 25),
                        title: Text(checker,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),

                      // subtitle: Text('Best of Sonu Nigam Song'),
                    ],
                  ),
                ))),
            // Container(
            //   height: 1000,
            //   width: 20,
            // ),
          ],
        )),
      )),
    );
  }
}
