import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  TextEditingController newcontroller = TextEditingController();
  TextEditingController oldcontroller = TextEditingController();
  int min =0;
  int sec =0;
  bool Timer = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("STOP WATCH"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: newcontroller,
              decoration: InputDecoration(label: Text('Minutes')),
            ),
            TextField(
              controller: oldcontroller,
              decoration: InputDecoration(label: Text('Seconds')),
            ),
            StreamBuilder(
                stream: Stream.periodic(Duration(seconds: 1)),
                builder: (context, snap) {
                  if(Timer==true){
                     if(sec==0){
                       if(min==0){
                         Timer=false;
                       }
                       else{
                         min--;
                         sec =59;
                       }
                     }
                     else{
                       sec--;
                     }
                  }
                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text('$min:',style: TextStyle(fontSize: 120)),
                        Text('$sec', style: TextStyle(fontSize: 120),
                        ),
                      ],
                    ),
                  );
                }),
            FloatingActionButton(onPressed: () {
              min=int.parse(newcontroller.text);
              sec=int.parse(oldcontroller.text);
              setState(() {
                Timer = true;
              });
            }),
          ],
        ),
      ),
    );
  }
}
