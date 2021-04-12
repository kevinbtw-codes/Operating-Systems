import 'dart:io';
import 'dart:core';

class Process {
  var pid;
  int at = 0;
  int bt = 0;
  int ct;
  // ignore: non_constant_identifier_names
  int start_time;
  int tat;
  int wt;

  Process(this.at, this.bt);

  @override
  String toString() {
    // ignore: unnecessary_this
    return '${this.pid}\t${this.at}\t${this.bt}\t${this.ct}\t${this.start_time}\t\t${this.tat}\t${this.wt}';
  }

  void printatbt() {
    stdout.write('$pid\t$at\t$bt\n');
  }

  int tablevalue(int j) {
    switch (j) {
      case 1:
        return this.at;
      case 2:
        return this.bt;
      case 3:
        return this.ct;
      case 4:
        return this.tat;
      case 5:
        return this.wt;
      default:
        return 0;
    }
  }
}

/*void main(List<String> arguments) {
  List<Process> prsf = [];
  List<Process> prss = [];
  List<Process> prsl = [];
  prsf.add(Process(2, 6));
  prsf.add(Process(5, 2));
  prsf.add(Process(1, 8));
  prsf.add(Process(0, 3));
  prsf.add(Process(4, 4));
  assignPid(prsf);
  List<Process> fcfs = List.from(prsf);
  List<Process> sjf = List.from(prsf);

  prsl.add(Process(0, 2));
  prsl.add(Process(1, 3));
  prsl.add(Process(2, 5));
  prsl.add(Process(3, 7));
  assignPid(prsl);
  List<Process> ljf = List.from(prsl);

  print('\n0.FCFS Algo\n');
  fcfs = fcfsalgo(fcfs);
  printprocess(fcfs);
  print("\n");

  print('\n1.SJF Algo\n');
  sjf = sjfalgo(sjf);
  printprocess(sjf);
  print("\n");

  print('\n2.LJF Algo\n');
  ljf = ljfalgo(ljf);
  printprocess(ljf);
  print("\n");
} */

void startsjf(List<Process> l) {
  l.sort((a, b) => a.at.compareTo(b.at));
  for (int j = 1; j < l.length; j++) {
    for (var i = 0; i < l.length - 1; i++) {
      if (l[i].at == l[i + 1].at) {
        if (l[i].bt > l[i + 1].bt) {
          Process temp;
          temp = l[i + 1];
          l[i + 1] = l[i];
          l[i] = temp;
        }
      }
    }
  }
}

void sjfsort(List<Process> l) {
  l.sort((a, b) => a.bt.compareTo(b.bt));
  for (var i = 0; i < l.length - 1; i++) {
    if (l[i].bt == l[i + 1].bt) {
      if (l[i].at > l[i + 1].at) {
        Process temp;
        temp = l[i + 1];
        l[i + 1] = l[i];
        l[i] = temp;
      }
    }
  }
}

void startljf(List<Process> l) {
  l.sort((a, b) => a.at.compareTo(b.at));
  for (int j = 1; j < l.length; j++) {
    for (var i = 0; i < l.length - 1; i++) {
      if (l[i].at == l[i + 1].at) {
        if (l[i].bt < l[i + 1].bt) {
          Process temp;
          temp = l[i + 1];
          l[i + 1] = l[i];
          l[i] = temp;
        }
      }
    }
  }
}

void ljfsort(List<Process> l) {
  l.sort((a, b) => b.bt.compareTo(a.bt));
  //print(l);
  for (var i = 0; i < l.length - 1; i++) {
    if (l[i].bt == l[i + 1].bt) {
      if (l[i].at > l[i + 1].at) {
        Process temp;
        temp = l[i + 1];
        l[i + 1] = l[i];
        l[i] = temp;
      }
    }
  }
}

List<Process> fcfsalgo(List<Process> l) {
  int algo = 0;
  l.sort((a, b) => a.at.compareTo(b.at));
  List<Process> fq = [];
  fq = npalgo(l, algo);
  return fq;
}

List<Process> sjfalgo(List<Process> l) {
  int algo = 1;
  startsjf(l);
  List<Process> fq = [];
  fq = npalgo(l, algo);
  return fq;
}

List<Process> ljfalgo(List<Process> l) {
  int algo = 2;
  startljf(l);
  List<Process> fq = [];
  fq = npalgo(l, algo);
  return fq;
}

//will fill the ready queue(rq) and sort it according to their burst time
void fillrq(List<Process> rq, int time, List<Process> l, int algo) {
  int i = 0;
  int count = 0;
  l.sort((a, b) => a.at.compareTo(b.at));
  while (l.isNotEmpty && count < l.length) {
    if (l[i].at <= time) {
      rq.add(l[i]);
      l.removeAt(i);
      count--;
    } else {
      i++;
    }
    count++;
  }

  if (rq.isNotEmpty) {
    if (algo == 0) {
      rq.sort((a, b) => a.at.compareTo(b.at));
    } else if (algo == 1) {
      sjfsort(rq);
    } else {
      ljfsort(rq);
    }
  }
}

//will delete the process from the parent list and add
//it to the finished list fq
void fillfq(List<Process> l, List<Process> fq, int i) {
  fq.add(l[i]);
  l.removeAt(i);
}

int processexec(List<Process> lgantt, int stime, List<Process> fq) {
  int time;
  lgantt[0].start_time = stime;
  lgantt[0].ct = lgantt[0].bt + lgantt[0].start_time;
  time = lgantt[0].ct;
  lgantt[0].tat = lgantt[0].ct - lgantt[0].at;
  lgantt[0].wt = lgantt[0].tat - lgantt[0].bt;
  fillfq(lgantt, fq, 0);
  return time;
}

//algo 0 means fcfs, 1 means sjf, 2 means ljf
// ignore: non_constant_identifier_names
List<Process> npalgo(List<Process> l, int algo) {
  List<Process> lgantt = [];
  lgantt = List.from(l);
  for (var item in lgantt) {
    item.ct = item.start_time = item.tat = item.wt = item.ct = null;
  }
  List<Process> fq = [];
  List<Process> rq = [];
  int time = 0;
  fillrq(rq, time, lgantt, algo);

  while (time >= 0) {
    if (rq.isEmpty) {
      if (lgantt.isEmpty) {
        break;
      } else {
        //rq is empty but lgantt is not empty
        if (time < lgantt[0].at) {
          time = lgantt[0].at;
        }
        fillrq(rq, time, lgantt, algo);
        time = processexec(rq, time, fq);
      }
    } else {
      fillrq(rq, time, lgantt, algo);
      time = processexec(rq, time, fq);
      fillrq(rq, time, lgantt, algo);
    }
  }
  fq.sort((a, b) => a.pid.compareTo(b.pid));
  return fq;
}

void assignPid(List l) {
  for (int i = 0; i < l.length; i++) {
    l[i].pid = 'P$i';
  }
}

void printprocess(List l) {
  print('Pid\tat\tbt\tct\tstart_time\ttat\t wt');
  for (var item in l) {
    print(item);
  }
}

void printpid(List<Process> l) {
  for (var i = 0; i < l.length; i++) {
    stdout.write(l[i].pid + " , ");
  }
  print("\n");
}
