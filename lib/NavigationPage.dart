import 'package:flutter/material.dart';

import 'AccountPage.dart';
import 'DashboardPage.dart';
import 'EventPage.dart';


class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  PageController _myPage = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    TextStyle style=TextStyle(color: Colors.white,);


    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.hardEdge,
        elevation: 5,
        color: Colors.black87 ,
        child: Container(
          height: h/10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(

            children: <Widget>[
              IconButton(
                highlightColor: Colors.green,
                color: Colors.white,
                icon: Icon(Icons.account_balance),

                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(0);
                  });
                },
              ),
              Text('Account',style:style ,)
            ],
          ),
              Column(

                children: <Widget>[
                  IconButton(
                    highlightColor: Colors.green,
                    color: Colors.white,
                    icon: Icon(Icons.filter_frames),
                    onPressed: () {
                      setState(() {
                        _myPage.jumpToPage(1);
                      });
                    },
                  ),
                  Text('Events',style:style ,)
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    highlightColor: Colors.green,
                    color: Colors.white,
                    icon: Icon(Icons.home),
                    onPressed: () {
                      setState(() {
                        _myPage.jumpToPage(2);
                      });
                    },
                  ),
                  Text('Dashboard',style:style ,)
                ],
              ),


            ],
          ),
        ),
      ),
      body: PageView(
        controller: _myPage,
        onPageChanged: (int) {
          print('Page Changes to index $int');
        },
        children: <Widget>[
          AccountPage(),
          EventPage(),
          DashboardPage(),

        ],
        physics: NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
      ),

    );
  }
}
