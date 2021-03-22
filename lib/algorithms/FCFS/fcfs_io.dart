//import 'dart:collection';
import 'dart:io';
import 'dart:core';

class ioprocess {
  String pid;
  int at;
  int bt1;
  int bt2;
  int iobt;
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

/*void main(List<String> arguments) {
  List<ioprocess> prs = [];
  prs.add(ioprocess(0, 6, 10, 4));
  prs.add(ioprocess(0, 9, 15, 6));
  prs.add(ioprocess(0, 3, 5, 2));
  assignPid(prs);
  List<ioprocess> fio = List.from(prs);

  print('\n1.FCFSio Algo\n');
  fio.sort((a, b) => a.at.compareTo(b.at));
  fio = fcfsioalgo(fio);

  printprocess(fio);
} */

List<ioprocess> fcfsioalgo(List<ioprocess> l) {
  List<ioprocess> lgantt = [];
  lgantt = List.from(l);
  printprocess(lgantt);
  List<ioprocess> readyq = [];
  List<ioprocess> finishedq = [];
  List<ioprocess> ioqueue = [];

  int time = 0;
  fillrq(readyq, time, lgantt);

  while (time >= 0) {
    if (readyq.isEmpty) {
      if (lgantt.isEmpty) {
        if (ioqueue.isEmpty) {
          break;
        } else {
          if (time < ioqueue[0].ioexit) {
            time = ioqueue[0].ioexit;
            //executelist(ioqueue, time, finishedq, ioqueue, readyq);
            time = processexec(ioqueue, time, 0);
            fillfq(ioqueue, finishedq, 0);
          } else {
            //time = executelist(ioqueue, time, finishedq, ioqueue, readyq);
            time = processexec(ioqueue, time, 0);
            fillfq(ioqueue, finishedq, 0);
          }
        }
      } else {
        if (ioqueue.isEmpty) {
          time = lgantt[0].at;
          time = executelist(lgantt, time, finishedq, ioqueue, readyq);
        } else {
          if (l[0].at >= ioqueue[0].ioexit) {
            time = ioqueue[0].ioexit;
            time = executelist(ioqueue, time, finishedq, ioqueue, readyq);
          } else {
            time = lgantt[0].at;
            time = executelist(lgantt, time, finishedq, ioqueue, readyq);
          }
        }
      }
    } else {
      if (ioqueue.isEmpty) {
        //executelist(readyq, time, finishedq, ioqueue, readyq);
        time = processexec(readyq, time, 0);
        if (readyq[0].io) {
          fillfq(readyq, finishedq, 0);
        } else {
          iofill(readyq, ioqueue, time);
        }
      } else {
        if (ioqueue[0].ioexit <= readyq[0].at) {
          time = executelist(ioqueue, time, finishedq, ioqueue, readyq);
        } else {
          //executelist(readyq, time, finishedq, ioqueue, readyq);
          time = processexec(readyq, time, 0);
          if (readyq[0].io) {
            fillfq(readyq, finishedq, 0);
          } else {
            iofill(readyq, ioqueue, time);
          }
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
    lgantt[i].wt = lgantt[i].tat - lgantt[i].bt2 - lgantt[i].bt1;
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
  print("ioqueue at time: " + time.toString());
  printpid(ioqueue);
}

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
    readyq.sort((a, b) => a.at.compareTo(b.at));
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
