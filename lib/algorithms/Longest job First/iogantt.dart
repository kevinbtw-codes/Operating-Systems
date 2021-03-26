import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'Main-LJF.dart';
import 'LJF-algo.dart';
import 'dart:math';

class GanttChart extends StatefulWidget {
  List<Process> prs;
  GanttChart(this.prs);
  @override
  _GanttChartState createState() => _GanttChartState(prs);
}

void adder(int time1, int time2, List<Process> prsNew) {
  prsNew.add(Process((time1), time2));
  assignPid(prsNew);
}

class _GanttChartState extends State<GanttChart> {
  List<Process> prs;

  _GanttChartState(this.prs);

  @override
  Widget build(BuildContext context) {
    print(prs);
    List<Process> prsNew;
    prsNew = prs.toList();
    //  prsNew.sort((a, b) => (a.ct - a.bt).compareTo(b.ct - b.bt));
    prsNew.sort((a, b) => (a.ct - a.bt).compareTo(b.ct - b.bt));
    print(prsNew);

    if (prsNew.length >= 1) {
      int i = 0;

      while (i < prsNew.length - 1) {
        if (prsNew[i].ct < prsNew[i + 1].at) {
          prsNew.insert(
              i + 1, Process(prsNew[i].ct, prsNew[i + 1].at - prsNew[i].ct));
          prsNew[i + 1].pid = "Idle";
          prsNew[i + 1].ct = prsNew[i + 2].at;
        }
        i += 1;
      }

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
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
                fontSize: 14,
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
                        color: Colors.redAccent,
                        space: 30.0,
                        thickness: 5.0,
                      ),
                      indicatorTheme: IndicatorThemeData(
                        size: 20.0,
                      ),
                    ),
                    builder: TimelineTileBuilder.fromStyle(
                      contentsAlign: ContentsAlign.alternating,
                      contentsBuilder: (context, index) => Container(
                        margin: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            prsNew[index].pid.toString() +
                                "\nTime: " +
                                (prsNew[index].ct - prsNew[index].bt)
                                    .toString() +
                                " to " +
                                (prsNew[index].ct).toString(),
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      itemCount: prsNew.length,
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
}
