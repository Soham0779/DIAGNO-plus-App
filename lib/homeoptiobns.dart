import 'package:NewsApp/home.dart';
import 'package:flutter/material.dart';
class MenuOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListItem(
          title: "Book an appointment!",
          subtitle: "Check the list of various doctors \nand fix an appointment with Them!",
          // icon: Icons.settings,

          onTap: () {
            // Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context)=> HomePage()),
            );

          },

        ),
        ListItem(
          title: "Messages",
          subtitle: "Check the list of various doctors\n and fix an appointment with Them!",
          // icon: Icons.message,
          onTap: () {
            print("Messages Tapped");
          },
        ),
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  final String title;
  final String subtitle;
  const ListItem(
      {@required this.onTap, @required this.icon, @required this.title, @required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.0,
      child: Card(
        color: Colors.redAccent,
        child: InkWell(
          onTap: onTap,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                Expanded(flex: 4, child: Text(title,textAlign: TextAlign.left,)),
                Expanded(flex: 4, child: Text(subtitle,textAlign: TextAlign.left,)),
              ],),
              Expanded(flex: 1, child: Icon(Icons.keyboard_arrow_right)),

            ],
          ),
        ),
      ),
    );
  }
}
