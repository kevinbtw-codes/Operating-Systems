//import 'dart:collection';
import 'dart:io';
import 'dart:core';

class ioprocess {
  String pid;
  int at;
  int bt1;
  int bt2;
  int iobt;
  int total_burst;
  int ioexit;
  bool io = false; //if io is completed then value is true, else false
  int ct;
  int start_time;
  int start_time2;
  int tat;
  int wt;

  ioprocess(this.at, this.bt1, this.iobt, this.bt2);

  @override
  String toString() {
    // ignore: unnecessary_this
    return '${this.pid}\t${this.at}\t${this.bt1}\t${this.iobt}\t${this.bt2}\t${this.ct}\t${this.start_time}\t\t${this.start_time2}\t\t${this.tat}\t${this.wt}';
  }

  void printatbt() {
    stdout.write('$pid\t$at\t$bt1\t$iobt\t$bt2\t\n');
  }
}

void main(List<String> arguments) {
  List<ioprocess> prs = [];
  prs.add(ioprocess(0, 6, 10, 4));
  prs.add(ioprocess(0, 9, 15, 6));
  prs.add(ioprocess(0, 3, 5, 2));
  assignPid(prs);
  totalburst(prs);
  List<ioprocess> fio = List.from(prs);

  print('\n1.FCFSio Algo\n');
  fio.sort((a, b) => a.at.compareTo(b.at));
  fio = sjfioalgo(fio);

  printprocess(fio);
}

void startsjf(List<ioprocess> l) {
  l.sort((a, b) => a.at.compareTo(b.at));
  for (int j = 1; j < l.length; j++) {
    for (var i = 0; i < l.length - 1; i++) {
      if (l[i].at == l[i + 1].at) {
        if (l[i].total_burst > l[i + 1].total_burst) {
          ioprocess temp;
          temp = l[i + 1];
          l[i + 1] = l[i];
          l[i] = temp;
        }
      }
    }
  }
}

List<ioprocess> sjfioalgo(List<ioprocess> l) {
  List<ioprocess> lgantt = [];
  lgantt = List.from(l);
  for (var item in lgantt) {
    item.ct = item.start_time =
        item.start_time2 = item.tat = item.wt = item.ioexit = null;
    item.io = false;
  }
  List<ioprocess> readyq = [];
  List<ioprocess> finishedq = [];
  List<ioprocess> ioqueue = [];

  int time = 0;
  fillrq(readyq, time, lgantt);
  startsjf(readyq);

  while (time >= 0) {
    if (readyq.isNotEmpty == false) {
      //1
      if (lgantt.isEmpty) {
        //2
        if (ioqueue.isEmpty) {
          //3
          break;
        } else {
          //3
          if (ioqueue[0].ioexit > time) {
            //4 ioqueue[0] has returned when readyq and lgantt both are emtpy
            time = ioqueue[0].ioexit;
            //executelist(ioqueue, time, finishedq, ioqueue, readyq);
            print("executing ioqueue Pid - " +
                ioqueue[0].pid +
                " with ioexit time " +
                ioqueue[0].ioexit.toString() +
                " at time $time from if statement from line 86\n");
            time = processexec(ioqueue, time, 0);
            fillfq(ioqueue, finishedq, 0);
            fillrq(readyq, time, lgantt);
          } else {
            //4 ioqueue [0] has not returned but lgantt and readyq both are empty
            //time = executelist(ioqueue, time, finishedq, ioqueue, readyq);
            print("executing ioqueue Pid - " +
                ioqueue[0].pid +
                " with ioexit time " +
                ioqueue[0].ioexit.toString() +
                " at time $time from if statement from line 98 \n");
            time = processexec(ioqueue, time, 0);
            fillfq(ioqueue, finishedq, 0);
            fillrq(readyq, time, lgantt);
          }
        }
      } else {
        //2 when readyq is empty but lgantt is not empty
        if (ioqueue.isEmpty) {
          //3 iqueue is empty
          time = lgantt[0].at;
          time = executelist(lgantt, time, finishedq, ioqueue, readyq);
        } else {
          //3 false
          if (ioqueue[0].ioexit <= time) {
            //4 ioqueue has returned
            print("executing ioqueue Pid - " +
                ioqueue[0].pid +
                " with ioexit time " +
                ioqueue[0].ioexit.toString() +
                " at time $time from if statement from line 119\n");
            time = processexec(ioqueue, time, 0);
            fillfq(ioqueue, finishedq, 0);
            fillrq(readyq, time, lgantt);
          } else {
            //4 false
            if (ioqueue[0].ioexit <= lgantt[0].at) {
              //5 ioq[0] reutrns before lgantt[0]
              if (ioqueue[0].ioexit == lgantt[0].at) {
                //6 ioq[0] and lgantt[0] arrive at same time
                if (ioqueue[0].bt2 <= lgantt[0].total_burst) {
                  //7 ioq[0] has less bt than that of lgantt[0]
                  print("executing ioqueue Pid - " +
                      ioqueue[0].pid +
                      " with ioexit time " +
                      ioqueue[0].ioexit.toString() +
                      " at time $time from if statement from line 135\n");
                  time = ioqueue[0].ioexit;
                  time = processexec(ioqueue, time, 0);
                  fillfq(ioqueue, finishedq, 0);
                  fillrq(readyq, time, lgantt);
                } else {
                  //7 false
                  time = lgantt[0].at;
                  executelist(lgantt, time, finishedq, ioqueue, readyq);
                }
              } else {
                //6 false
                print("executing ioqueue Pid - " +
                    ioqueue[0].pid +
                    " with ioexit time " +
                    ioqueue[0].ioexit.toString() +
                    " at time $time from if statement from line 151\n");
                time = ioqueue[0].ioexit;
                time = processexec(ioqueue, time, 0);
                fillfq(ioqueue, finishedq, 0);
                fillrq(readyq, time, lgantt);
              }
            } else {
              //5 false
              time = lgantt[0].at;
              executelist(lgantt, time, finishedq, ioqueue, readyq);
            }
          }
        }
      }
    } else {
      //1 readyq is not empty = true
      if (ioqueue.isEmpty) {
        //2
        //executelist(readyq, time, finishedq, ioqueue, readyq);
        time = processexec(readyq, time, 0);
        if (readyq[0].io) {
          fillfq(readyq, finishedq, 0);
        } else {
          iofill(readyq, ioqueue, time);
        }
        fillrq(readyq, time, lgantt);
      } else {
        //2
        if (ioqueue[0].ioexit <= time) {
          print("\n here exit time of " +
              ioqueue[0].pid +
              " is " +
              ioqueue[0].ioexit.toString() +
              " which is less than current time $time");
          //3
          if (ioqueue[0].bt2 <= readyq[0].total_burst) {
            //4
            print(
                "true of 4th if statement (in readyq not empty) is executed at time $time \n");
            //time = executelist(ioqueue, time, finishedq, ioqueue, readyq);
            time = processexec(ioqueue, time, 0);
            fillfq(ioqueue, finishedq, 0);
            fillrq(readyq, time, lgantt);
          } else {
            //4 false
            time = processexec(readyq, time, 0);
            if (readyq[0].io) {
              fillfq(readyq, finishedq, 0);
            } else {
              iofill(readyq, ioqueue, time);
            }
            fillrq(readyq, time, lgantt);
          }
        } else {
          //3 false
          //executelist(readyq, time, finishedq, ioqueue, readyq);
          time = processexec(readyq, time, 0);
          if (readyq[0].io) {
            fillfq(readyq, finishedq, 0);
          } else {
            iofill(readyq, ioqueue, time);
          }
          fillrq(readyq, time, lgantt);
        }
      }
    }
  }

  return finishedq;
}

int executelist(List<ioprocess> l, int time, List<ioprocess> fq,
    List<ioprocess> ioqueue, List<ioprocess> readyq) {
  time = processexec(l, time, 0);
  if (l[0].io) {
    fillfq(l, fq, 0);
  } else {
    iofill(l, ioqueue, time);
  }

  fillrq(readyq, time, l);
  return time;
}

int processexec(List<ioprocess> lgantt, int stime, int i) {
  int time;
  if (lgantt[i].io) {
    // this is when the process has completed its io
    lgantt[i].start_time2 = stime;
    lgantt[i].ct = lgantt[i].bt2 + stime;
    time = lgantt[i].ct;
    lgantt[i].tat = lgantt[i].ct - lgantt[i].at;
    lgantt[i].wt =
        lgantt[i].tat - lgantt[i].bt2 - lgantt[i].bt1 - lgantt[i].iobt;
  } else {
    //this is when the process has not completed its io
    lgantt[i].start_time = stime;
    lgantt[i].ct = lgantt[i].bt1 + lgantt[i].start_time;
    time = lgantt[i].ct;
    //lgantt[i].tat = lgantt[i].ct - lgantt[i].at;
  }
  return time;
}

void iofill(List<ioprocess> l, List<ioprocess> ioqueue, int time) {
  l[0].ioexit = l[0].ct + l[0].iobt;
  l[0].io = true;
  ioqueue.add(l[0]);
  l.removeAt(0);
  ioqueue.sort((a, b) => a.ioexit.compareTo(b.ioexit));
  for (int j = 1; j <= ioqueue.length; j++) {
    for (int i = 0; i < ioqueue.length - 1; i++) {
      if (ioqueue[i].ioexit == ioqueue[i + 1].ioexit) {
        if (ioqueue[i].bt2 > ioqueue[i + 1].bt2) {
          ioprocess temp;
          temp = ioqueue[i + 1];
          ioqueue[i + 1] = ioqueue[i];
          ioqueue[i] = temp;
        }
      }
    }
  }
  print("ioqueue at time: " + time.toString());
  printpid(ioqueue);
}

//readyq is the reference of readyq list identifier
// l is the reference of the main list
void fillrq(List<ioprocess> readyq, int time, List<ioprocess> l) {
  int i = 0;
  int count = 0;
  l.sort((a, b) => a.at.compareTo(b.at));
  while (l.isNotEmpty && count < l.length) {
    if (l[i].at <= time) {
      readyq.add(l[i]);
      l.removeAt(i);
      count--;
    } else {
      i++;
    }
    count++;
  }

  if (readyq.isNotEmpty) {
    sjfsort(readyq);
  }
}

void sjfsort(List<ioprocess> l) {
  l.sort((a, b) => a.bt1.compareTo(b.bt1));
  for (int j = 1; j <= l.length; j++) {
    for (var i = 0; i < l.length - 1; i++) {
      if (l[i].bt1 == l[i + 1].bt1) {
        if (l[i].bt2 > l[i + 1].bt2) {
          ioprocess temp;
          temp = l[i + 1];
          l[i + 1] = l[i];
          l[i] = temp;
        }
      }
    }
  }
}

void fillfq(List<ioprocess> l, List<ioprocess> fq, int i) {
  fq.add(l[i]);
  l.removeAt(i);
}

void printprocess(List l) {
  print('Pid\tat\tbt1\tiobt\tbt2\tct\tstart_time\tstart_time2\ttat\t wt');
  for (var item in l) {
    print(item);
  }
}

void printpid(List<ioprocess> l) {
  for (var i = 0; i < l.length; i++) {
    // ignore: prefer_single_quotes
    stdout.write(l[i].pid + " , ");
  }
  print("\n");
}

void assignPid(List l) {
  for (int i = 0; i < l.length; i++) {
    l[i].pid = 'P$i';
  }
}

void totalburst(List<ioprocess> l) {
  int i;
  for (i = 0; i < l.length; i++) {
    l[i].total_burst = l[i].bt1 + l[i].bt2 + l[i].iobt;
  }
}
