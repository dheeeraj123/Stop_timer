import 'package:flutter/material.dart';

class DateDifference extends StatefulWidget {
  const DateDifference({Key? key}) : super(key: key);

  @override
  State<DateDifference> createState() => _DateDifferenceState();
}

class _DateDifferenceState extends State<DateDifference> {
  DateTime? selectDate;
  DateTime? ourDate;
  Duration? duration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Date Difference')),
      body: Column(
          children: [
            Center(
              child:Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  child: CircleAvatar(radius: 80,backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqrvzi9MnYKT8F_P2IYmVXqra80UG-mRuFcQ&usqp=CAU'),),
                ),
              ),),ElevatedButton(onPressed: ()async{
                selectDate=await showDatePicker(context: context, initialDate: DateTime(2000), firstDate: DateTime(2000,1,1), lastDate: DateTime(2100));
                setState(() {

                });
            }, child: selectDate==null?Text('Now'):Text('$selectDate')),
            Padding(
              padding: const EdgeInsets.all(12),
              child: CircleAvatar(radius: 80,backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQcpWvlpydGkwK2i1jv02zCExhBIePNAu9Og&usqp=CAU'),),
            ),
            ElevatedButton(onPressed: ()async{
              ourDate=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2023,4,1), lastDate: DateTime(2025));
              setState(() {
                
              });
            }, child:ourDate==null?Text('after'):Text('$ourDate')),
            Padding(
              padding: const EdgeInsets.all(12),
              child: CircleAvatar(radius: 80,backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSC0Q6e3XUAh9p7EqmPjCj_d5JoXC9TAJU-7g&usqp=CAU'),),
            ),
            ElevatedButton(onPressed: ()async{
              final dateone=selectDate!;
              final datetwo=ourDate!;
              duration=datetwo.difference(dateone);
setState(() {

});

            }, child: duration==null?Text('Difference'):Text('${duration!.inDays}')

            ),
          ]
      ),

    );
  }
}
