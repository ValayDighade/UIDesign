/*
Author : Valay Dighade
Date : 22/01/2020
Description : Company  task

This file has detailed of Pages. i have focus on UI part

*/


import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'EventDescription.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Paris'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _itemName = ["All", "Food", "Sport", "Music","Books","Candy","Toys"];
  List<String> icons =['images/star.png','images/burger.png','images/cricket.png',
    'images/playlist.png','images/bookshelf.png','images/sugar.png','images/souvenir.png'];



  int currentTabIndex = 0;
  List<String> AllImages=[
  'http://static.trip101.com/paragraph_media/pictures/001/646/036/large/Halal_Snack_Pack_served_on_ceramic_plate__topped_with_Tablouleh.jpg?1558948459',
  'https://images.unsplash.com/photo-1499856871958-5b9627545d1a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjcxMzN9&w=1000&q=80',
  'https://ravenoustravellers.com/wp-content/uploads/2019/02/Macaron-1080x675.jpg',
  'https://media-cdn.tripadvisor.com/media/photo-s/16/aa/d0/c8/cut-street-food.jpg'
  ];
 // String imgUrl = 'https://image.businessinsider.com/5550d6c1eab8ea8177915edd?width=1100&format=jpeg&auto=webp';


  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }


  List<bool> liked = [true,false,false,false];



  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

      return Scaffold(
        backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Row(
              children: <Widget>[
                Text(widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      letterSpacing: 2,
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white54,
                ),
                onPressed: () {

                  Toast.show("You tap on Search "
                      , context,
                      duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.format_indent_increase,
                  color: Colors.white54,
                ),
                onPressed: () {

                  Toast.show("You tap on Menu "
                      , context,
                      duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
                },
              ),
            ],
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.white10,
                splashColor: Colors.yellowAccent,
                unselectedWidgetColor: Colors.green,
                primaryColor: Colors.red,
                textTheme: Theme.of(context)
                    .textTheme
                    .copyWith(caption: new TextStyle(color: Colors.grey))),
            child: BottomNavigationBar(
              onTap: onTapped,
              currentIndex: currentTabIndex,
              fixedColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_balance,
                  ),
                  // backgroundColor: Colors.green,

                  title: Text("Account"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.mail),
                  title: Text("Events"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Dashboard"),
                )
              ],
            ),
          ),
          body:Column(
           children: <Widget>[
            SizedBox(
            height: 130,
            //width: 500,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:_itemName.length ,
              itemBuilder: (context,c)
              {
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    color: Colors.white38,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: SizedBox(
                      width: w/6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.asset(icons[c],height: h/16,),
                          Text(_itemName[c],style: TextStyle(color: Colors.white),),
                        ],
                      ),
                    ),
                  ),
                );
              }

            ),
          ),
          Column(
            children: <Widget>[
              Text("Popular Events"),
        Container(
          height: h / 2,
          width: w / 0.2,
          // color: Colors.black,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      EventDescription(imageUrl:AllImages[index],name:'Nocturnal and unusual visit',isStatus: liked[index],)));

                },
                child: Card(
                  elevation: 5,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: new BorderRadius.circular(8.0),
                              child: Container(
                                width: w / 1.4,
                                height: h / 3,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(AllImages[index]))),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: h / 3.4, left: w / 2),
                              child: //Image.asset('images/dislike.png',height: h/15,width: h/15,),

                              InkWell(
                                onTap: () {
                                  if(liked[index]==false)
                                    {
                                      setState(() {
                                        liked[index]=true;
                                      });
                                    }
                                  else
                                    {
                                      setState(() {
                                        liked[index]=false;
                                      });
                                    }
                                  //_pressed();
                                },
                                child: Container(
                                  child: Image.asset(
                                    'images/heart.png',

                                    height: h / 15,
                                    width: h / 15,
                                    color:liked[index]==false ? Colors.white : Colors.red ,
                                  ),
                                ),
                              ),


                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            'FRI,DEC 19th - MON, DEC 27th',
                            style: TextStyle(
                              fontSize: h/65,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                        Text(
                          'Paris',
                          style: TextStyle(
                              fontSize: h/40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Nunito'),
                        ),
                        Text(
                          'Nocturnal and unusual visit',
                          style: TextStyle(
                            fontSize: h/55,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )

            ],
          )
        ],
      )
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
