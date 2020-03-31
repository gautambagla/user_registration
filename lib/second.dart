import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:toast/toast.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  goBackToPreviousScreen(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      goBackToPreviousScreen(context);
                    },
                  ),
                  Expanded(
                    flex: 0,
                    child: Center(
                      child: Text(
                        'Date & Time',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 24, 10, 8),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 12, 16, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(16, 0, 10, 0),
                        child: Icon(
                          Icons.sort,
                          color: Colors.black54,
                        ),
                      ),
                      new Container(
                        color: Colors.grey[200],
                        width: 2,
                        height: 20,
                      ),
                      Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'When?',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                          )),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 10, 16, 32),
                  child: Calendar(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Start Time',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Container(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: CustomChip(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'End Time',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Container(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: CustomChip(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 32, 10, 16),
              child: ButtonTheme(
                height: 50,
                minWidth: 150,
                child: RaisedButton(
                  onPressed: () {
                    Toast.show('Details Saved!', context,
                        gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
                  },
                  elevation: 7,
                  color: Colors.grey[600],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _calendarController = CalendarController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        selectedStyle: TextStyle(
          color: Colors.black54,
        ),
        weekendStyle: TextStyle(
          color: Colors.black54,
        ),
        weekdayStyle: TextStyle(
          color: Colors.black54,
        ),
        selectedColor: Colors.grey[300],
        highlightToday: false,
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
        weekendStyle: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        titleTextStyle: TextStyle(fontSize: 16, color: Colors.black),
        formatButtonVisible: false,
      ),
      calendarController: _calendarController,
    );
  }
}

class CustomChip extends StatefulWidget {
  @override
  _CustomChipState createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  var hr = [
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ];
  var min = ['00', '15', '30', '45'];
  int _value = 1;
  int _invalue = 1;

  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(
        15,
        (int index) {
          return Row(
            children: <Widget>[
              ChoiceChip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text(hr[index] + ':' + min[0]),
                labelStyle: TextStyle(color: Colors.black54, fontSize: 15),
                backgroundColor: Colors.white,
                selected: _value == index && _invalue == 1,
                onSelected: (bool selected) {
                  setState(() {
                    _value = selected ? index : null;
                    _invalue = selected ? 1 : null;
                  });
                },
              ),
              ChoiceChip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text(hr[index] + ':' + min[1]),
                labelStyle: TextStyle(color: Colors.black54, fontSize: 15),
                backgroundColor: Colors.white,
                selected: _value == index && _invalue == 2,
                onSelected: (bool selected) {
                  setState(() {
                    _value = selected ? index : null;
                    _invalue = selected ? 2 : null;
                  });
                },
              ),
              ChoiceChip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text(hr[index] + ':' + min[2]),
                labelStyle: TextStyle(color: Colors.black54, fontSize: 15),
                backgroundColor: Colors.white,
                selected: _value == index && _invalue == 3,
                onSelected: (bool selected) {
                  setState(() {
                    _value = selected ? index : null;
                    _invalue = selected ? 3 : null;
                  });
                },
              ),
              ChoiceChip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text(hr[index] + ':' + min[3]),
                labelStyle: TextStyle(color: Colors.black54, fontSize: 15),
                backgroundColor: Colors.white,
                selected: _value == index && _invalue == 4,
                onSelected: (bool selected) {
                  setState(() {
                    _value = selected ? index : null;
                    _invalue = selected ? 4 : null;
                  });
                },
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}
