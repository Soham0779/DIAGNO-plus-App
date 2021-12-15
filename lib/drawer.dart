import 'package:NewsApp/pages/about.dart';
import 'package:NewsApp/symptoms.dart';
import 'package:flutter/material.dart';

import 'Appointment.dart';
import 'home.dart';
import 'main.dart';
class Drawer extends StatefulWidget {
  Drawer(ListView listView);


  @override
  State<Drawer> createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        ListView(
          children: [
            new UserAccountsDrawerHeader(
              accountName: Text('Ritish'),
              accountEmail: Text('ricjjcd@gmail.com'),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage('https://images.squarespace-cdn.com/content/v1/5824673c2e69cfc8ac1e3cd3/1580377764933-1L0AVRF4MU86B18J3S4A/Picture+of+woodlands+taken+on+iphone+using+natural+light'),
              ) ,
            ),

            ListTile(
              title: Text("Home"),
              onTap: (){
                // Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context)=> MyHomePage(),
                ),

                );
              },
            ),
            new Divider(),
            ListTile(
              title: Text("Appointments"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context)=> Appointment(),
                ),

                );
              },
            ),
            new Divider(),
            ListTile(
              title: Text("Symptoms Checker"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context)=> Symptoms(),
                ),

                );
              },
            ),
            new Divider(),
            ListTile(
              title: Text("News"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=> HomePage()
                ),

                );
              },
            ),
            new Divider(),
            ListTile(
              title: Text("About Page"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context)=> new AboutPage()
                ),

                );
              },
            ),
            new Divider(),
          ],
        ),


      ),
    );
  }
}
