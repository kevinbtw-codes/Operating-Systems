import 'package:os_project/Algorithm%20page.dart';
import 'package:os_project/Learn Pages//Animations/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:os_project/algorithms/Priority-new/Main-priority.dart';
import 'package:os_project/algorithms/FCFS/Main-fcfs.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: priorityLearn(),
    ));

class priorityLearn extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<priorityLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff22456d),
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 40,
                  color: Colors.black,
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => WaveDemoApp(),
                      ),
                    );
                  },
                ),
                expandedHeight: 400,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/PRIORITY.gif'),
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
                              "Priority scheduling is a non-preemptive algorithm and one of the most common scheduling algorithms in batch systems.",
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
                              "Each process is assigned a priority. Here process with least priority ( i.e. highest:1 and lowest:10 ) is to be executed first and so on.",
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
                              "In this algorithm , if both processes have similar priorities than it works like FCFS , the process that comes first will be executed first .",
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
                                  fontSize: 40,
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
                                      'images/Learn page images/PRIORITY-1.jpg'),
                                ],
                              ),
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
                              "For each process one can input respective value for \"AT\" , \"BT\" and \"Priority\" , failing to which the value will be considered as null.",
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
                                          'images/Learn page images/PRIORITY-5.jpg'),
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
                                      'images/Learn page images/PRIORITY-4.jpg'),
                                  /* makeVideo(
                                      image:
                                          'images/Learn page images/emma-2.jpg'),*/
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
                              "To edit or delete a process swipe the respective dialog box to the left . On editing a process you may see the visible changes "
                                  "sorted according to arrival times.\nTo delete all the processes at once, just drag the page down to reset it.",
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
                                      'images/Learn page images/PRIORITY-8.jpg'),
                                  makeVideo(
                                      image:
                                      'images/Learn page images/FCFS-6.jpg'),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "5.",
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
                              "To proceed to:\n(1) Gannt chart\n(2) Process table\n"
                                  "(3) I/O\n Press the following buttons to navigate there.",

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
                                      'images/Learn page images/FCFS-7.jpg'),
                                  /*makeVideo(
                                      image:
                                          'images/Learn page images/emma-2.jpg'),*/
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "HOW I/O WORKS",
                              style: TextStyle(
                                  color: Color(0XFFFFFFFFF),
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "6.",
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
                              "After reaching the I/O page again click on the plus icon to add I/O processes along with burst times.",
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
                                      'images/Learn page images/PRIORITY-2.jpg'),
                                  makeVideo(
                                      image:
                                      'images/Learn page images/PRIORITY-3.jpg')
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "7.",
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
                              "For each process one can input respective value for \"AT\" , \"Priority\" , \"IOBT\" , \"BT1\" and \"BT2\" , failing to which the value will be considered as null.",
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
                                      'images/Learn page images/PRIORITY-5.jpg'),
                                  makeVideo(
                                      image:
                                          'images/Learn page images/PRIORITY-7.jpg'),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "8.",
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
                                      'images/Learn page images/PRIORITY-6.jpg'),
                                  /* makeVideo(
                                      image:
                                          'images/Learn page images/emma-2.jpg'),*/
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "9.",
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
                              "To edit or delete a process swipe the respective dialog box to the left . On editing a process you may see the visible changes "
                                  "sorted according to arrival times.\nTo delete all the processes at once, just drag the page down to reset it."
                                  "\nRepeat all the processes as mentioned above in step 4",
                              //textAlign: TextAlign.justify,
                              style:
                              TextStyle(color: Colors.white, fontSize: 16),
                            )),
                        /*SizedBox(
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
                                      'images/Learn page images/FCFS-5.jpg'),
                                  makeVideo(
                                      image:
                                      'images/Learn page images/FCFS-6.jpg'),
                                ],
                              ),
                            )),*/
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "10.",
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
                              "To proceed to:\n(1) Gannt chart\n(2) Process table\n"
                                  "(3) Back to main algorithm\n Press the following buttons to navigate there.",

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
                                      'images/Learn page images/FCFS-7.jpg'),
                                  /* makeVideo(
                                      image:
                                          'images/Learn page images/emma-2.jpg'),*/
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new MyPriorityApp(),
                          ),
                        );
                      },
                      child: new Container(
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
                    )),
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
              // gradient: LinearGradient(
              //   begin: Alignment.bottomRight,
              //   colors: [
              //     Colors.black.withOpacity(.9),
              //     Colors.black.withOpacity(.3)
              //   ],
              // ),
              ),
        ),
      ),
    );
  }
}
