import 'package:company_task/Material.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'EventDescription.dart';


class EventPage extends StatefulWidget {
  EventPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<String> _itemName = ["All", "Food", "Sport", "Music","Books","Candy","Toys"];
  List<String> icons =['images/star.png','images/burger.png','images/cricket.png',
    'images/playlist.png','images/bookshelf.png','images/sugar.png','images/souvenir.png'];





  List<String> AllImages=[
    'http://static.trip101.com/paragraph_media/pictures/001/646/036/large/Halal_Snack_Pack_served_on_ceramic_plate__topped_with_Tablouleh.jpg?1558948459',
    'https://images.unsplash.com/photo-1499856871958-5b9627545d1a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjcxMzN9&w=1000&q=80',
    'https://ravenoustravellers.com/wp-content/uploads/2019/02/Macaron-1080x675.jpg',
    'https://media-cdn.tripadvisor.com/media/photo-s/16/aa/d0/c8/cut-street-food.jpg'
  ];



  List<bool> liked = [false,false,false,false];



  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: getData().themeColor,
        appBar: AppBar(
          backgroundColor: getData().themeColor,
          title: Row(
            children: <Widget>[
              Text("Paris",
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

        body:Column(
          children: <Widget>[
            SizedBox(
              height: h/5,
              //width: 500,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:_itemName.length ,
                  itemBuilder: (context,c)
                  {
                    return  GestureDetector(
                      onTap: (){
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Ink(


                          child: Card(
                            elevation: 5,
                            color: Colors.white38,
                            // color: Colors.white38,
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
                        ),
                      ),
                    );
                  }

              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Popular Events",style: TextStyle(color: Colors.white,fontSize: h/35),),
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
