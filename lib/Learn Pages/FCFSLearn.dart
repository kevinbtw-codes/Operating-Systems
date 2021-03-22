import 'package:os_project/Learn Pages//Animations/FadeAnimation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FCFSLearn(),
    ));

class FCFSLearn extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<FCFSLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff22456d),
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 400,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/FCFS.gif'),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Color(0XFFF36735).withOpacity(0.0),
                            //Color(0XFFF36735).withOpacity(0.75),
                            Colors.transparent
                            //Color(0xff22456d).withOpacity(0.7),
                            //Color(0xff22456d).withOpacity(0.9)
                          ])),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FadeAnimation(
                                5,
                                Text(
                                  "LEARN",
                                  style: TextStyle(
                                      color: Color(0xff22456d),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                )),
                            /*SizedBox(
                              height: ,
                            ),*/
                            /* Row(
                              children: <Widget>[
                                FadeAnimation(
                                    1.2,
                                    Text(
                                      "Description",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    )),
                                SizedBox(
                                  width: 50,
                                ),
                                FadeAnimation(
                                    1.3,
                                    Text(
                                      " ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ))
                              ],
                            )*/
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        /*FadeAnimation(
                            1.6,
                            Text(
                              " ",
                              style:
                                  TextStyle(color: Colors.white, height: 1.4),
                            )
                        ),*/
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "1.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "Input n processes with their respective arrival and burst time, upon which our app will provide average waiting time and average turn around time using FCFS scheduling algorithm.",
                              //textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "2.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "First in, first out (FIFO), also known as first come, first served (FCFS), is the simplest scheduling algorithm. FIFO simply queues processes in the order that they arrive in the ready queue.",
                              //textAlign: TextAlign.justify,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "3.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "In this algorithm , the process that comes first will be executed first and next process starts only after the previous gets fully executed.",
                              //textAlign: TextAlign.justify,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "HOW IT WORKS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "1.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "To input n number of processes there is a button in the top right corner , hitting which another dialogue box appears .",
                              //textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                            )),
                        /*SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "IMAGES",
                              style: TextStyle(
                                  color: Color(0xFFF36735),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),*/
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.8,
                            Container(
                              height: 200,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  makeVideo(
                                      image:
                                          'images/Learn page images/FCFS-1.jpg',
                                  ),
                                  makeVideo(
                                      image:
                                      'images/Learn page images/FCFS-2.jpg'),
                                ],
                              ),
                            )
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "2.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "For each process one can input respective value for \"AT\" and \"BT\" , failing to which the value will be considered as null.",
                              //textAlign: TextAlign.justify,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.8,
                            Container(
                              height: 200,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  makeVideo(
                                      image:
                                          'images/Learn page images/emma-1.jpg'),
                                  makeVideo(
                                      image:
                                          'images/Learn page images/emma-2.jpg'),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "3.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "Once you're done with entering the data hit the \"Submit\" button. Repeating the above step will let you add multiple processes .",
                              //textAlign: TextAlign.justify,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.8,
                            Container(
                              height: 200,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  makeVideo(
                                      image:
                                          'images/Learn page images/emma-1.jpg'),
                                  makeVideo(
                                      image:
                                          'images/Learn page images/emma-2.jpg'),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "4.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "To edit or delete a process swipe the respective dialog box to the left . On editing a process you may see the visible changes sorted according to arrival times .",
                              //textAlign: TextAlign.justify,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.8,
                            Container(
                              height: 200,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  makeVideo(
                                      image:
                                          'images/Learn page images/emma-1.jpg'),
                                  makeVideo(
                                      image:
                                          'images/Learn page images/emma-2.jpg'),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 120,
                        )
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
          Positioned.fill(
            bottom: 50,
            child: Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FadeAnimation(
                  2,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0XFFF36735)),
                    child: Align(
                        child: Text(
                      "START",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget makeVideo({image}) {
    return AspectRatio(
      aspectRatio: 1.5 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.3)
          ])),
          child: Align(
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 70,
            ),
          ),
        ),
      ),
    );
  }
}
