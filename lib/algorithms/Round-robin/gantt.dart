import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'Main-rr.dart';
import 'round-robin.dart';

class GanttChart extends StatefulWidget {
  List<Process> prs;
  GanttChart(this.prs);
  @override
  _GanttChartState createState() => _GanttChartState(prs);
}


class _GanttChartState extends State<GanttChart> {
  List<Process> prs;
  _GanttChartState(this.prs);

  @override
  Widget build(BuildContext context) {
    List<Process> prsNew;
    List<Process> prsadd;
    List<Process> ready=[];
    prsNew = prs.toList();
    prsNew.sort((a, b) => (a.at).compareTo(b.at));
    ready.insert(0,Process(prsNew[0].at, prsNew[0].bt));// adding the first process in ready

    if (prsNew.length >= 1) {
      int i = 0;
      int current_time=prsNew[0].at; // the time currently
      while (ready.length>0 ) {
        //print(prsNew[i].ct < prsNew[i + 1].at);
        if (prsNew[i].bt > prsNew[i].tq) { // to check that if burst time of process is greater than tq than process executes for tq only
          prsadd.add(Process(current_time, prsNew[i].tq)); //adding process in list to be printed
          prsNew[i].bt = prsNew[i].bt - prsNew[i].tq; // changing burst time to time left
          current_time=current_time+prsNew[i].tq; //updating current time
          ready.add(Process(current_time, prsNew[i].bt));
        }
        else {
          prsadd.add(Process(current_time, prsNew[i].bt)); // if burst time of process is lesser than tq then whole process execute
          current_time=current_time+prsNew[i].bt; //updating current time
          ready.removeWhere((item) => item.pid == i);
        }
        if (prsNew[i+1].at < current_time) {
          ready.add(Process(prsNew[i+1].at, prsNew[i+1].bt));
        }
        i += 1;
      }
    }

    print(prsNew);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff22456d),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Gantt Chart',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              //fontSize: 14,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Timeline.tileBuilder(
                  theme: TimelineThemeData(
                    direction: Axis.vertical,
                    connectorTheme: ConnectorThemeData(
                      color: Color(0XFF22456D),
                      space: 30.0,
                      thickness: 5.0,
                    ),
                    indicatorTheme: IndicatorThemeData(
                      color: Color(0xFFEE97D0),
                      size: 20.0,
                    ),
                  ),
                  builder: TimelineTileBuilder.fromStyle(
                    contentsAlign: ContentsAlign.alternating,
                    contentsBuilder: (context, index) =>
                        Container(
                          margin: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Color(0XFFF36735),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              prsadd[index].pid.toString() +
                                  "\nTime: " +
                                  (prsadd[index].ct - prsadd[index].bt)
                                      .toString() +
                                  " to " +
                                  (prsadd[index].ct).toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    itemCount: prsadd.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//rr gannt