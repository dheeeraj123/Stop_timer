import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class DatePicker extends StatefulWidget {
  DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

 var hour='';
 var min='';
  DateTime? selectedDAte;
  TimeOfDay? selectTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DatePicker')),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 450,
              height: 400,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm81XoZa9dFFAFPY-LjxgJ-XAj-KeySicSvw&usqp=CAU'),
                child: ElevatedButton(
                    onPressed: () async {
                      selectedDAte = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(01,01,1950),
                          lastDate: DateTime(2024));
                      setState(() {});
                    },
                    child: selectedDAte == null
                        ? Text('Date')
                        : Text('${DateFormat('dd/MM/yyyy').format(selectedDAte!)}')),
              ),
            ),
            Expanded(
              child: Container(color: Colors.black38,
                height: 350,
                width: 300,

                child: ElevatedButton(
                    onPressed: () async {
                      selectTime = (await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(hour: 12, minute: 60)));
                      hour= '${selectTime!.hour}';
                      min='${selectTime!.minute}';



                      setState(() {});
                    },
                    child:
                    selectTime == null ? Text('time') : Text('${hour}:${min} ${selectTime!.period.name}',),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
