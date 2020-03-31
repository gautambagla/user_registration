import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';
import 'package:user_registration/second.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'), // English
          const Locale('th', 'TH'), // Thai
        ],
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: MyHomePage(title: 'Registration Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _Gender = ['Male', 'Female', 'Others'];
  var _city = ['Ahmedabad', 'Kolkata', 'Mumbai', 'Bangalore'];
  var _currentItem;
  var _currentItem2;
  String dt = 'MM/DD/YYYY';

  gotoSecondActivity(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Second()),
    );
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
                  Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  Expanded(
                    flex: 0,
                    child: Center(
                      child: Text(
                        'Registration Form',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      gotoSecondActivity(context);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 48, 10, 8),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 10, 16, 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextField(
                        cursorColor: Colors.black,
                        cursorRadius: Radius.circular(50),
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                          isDense: true,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                        ),
                      ),
                      Container(
                        height: 10,
                      ),
                      TextField(
                        cursorColor: Colors.black,
                        cursorRadius: Radius.circular(50),
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                          isDense: true,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Gender',
                        style: TextStyle(fontSize: 16, color: Colors.black45),
                      ),
                      DropdownButton<String>(
                        focusColor: Colors.black,
                        underline: Container(
                          color: Colors.white,
                        ),
                        //hint: Text('Select'),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                        iconSize: 24,
                        items: _Gender.map((String dropDrownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDrownStringItem,
                            child: Text(
                              dropDrownStringItem,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black45),
                            ),
                          );
                        }).toList(),
                        onChanged: (String newValueSelected) {
                          setState(() {
                            this._currentItem = newValueSelected;
                          });
                        },
                        value: _currentItem,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Date of Birth',
                        style: TextStyle(fontSize: 16, color: Colors.black45),
                      ),
                      InkWell(
                        child: Text(
                          dt,
                          style: TextStyle(fontSize: 16, color: Colors.black45),
                        ),
                        onTap: () {
                          showRoundedDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1920),
                                  lastDate: DateTime(2021),
                                  theme: ThemeData.dark(),
                                  borderRadius: 16)
                              .then((date) {
                            setState(() {
                              if (date != null)
                                dt = new DateFormat("MM/dd/yyyy").format(date);
                            });
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'City',
                        style: TextStyle(fontSize: 16, color: Colors.black45),
                      ),
                      DropdownButton<String>(
                        focusColor: Colors.black,
                        underline: Container(
                          color: Colors.white,
                        ),
                        //hint: Text('Select'),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                        iconSize: 24,
                        items: _city.map((String dropDrownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDrownStringItem,
                            child: Text(
                              dropDrownStringItem,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black45),
                            ),
                          );
                        }).toList(),
                        onChanged: (String newValueSelected) {
                          setState(() {
                            this._currentItem2 = newValueSelected;
                          });
                        },
                        value: _currentItem2,
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
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Add Your Sports',
                        style: TextStyle(fontSize: 16, color: Colors.black45),
                      ),
                      Container(
                        height: 10,
                      ),
                      Wrap(
                        spacing: 10,
                        runSpacing: 1,
                        children: List<Widget>.generate(8, (int index) {
                          return CustomChip(index: index);
                        }).toList(),
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
                    gotoSecondActivity(context);
                  },
                  elevation: 7,
                  color: Colors.grey[600],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    'Done',
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

class CustomChip extends StatefulWidget {
  CustomChip({Key key, this.index}) : super(key: key);
  final int index;

  @override
  _CustomChipState createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  var sports = [
    'Football',
    'Cricket',
    'Badminton',
    'Tennis',
    'Volleyball',
    'Hockey',
    'Kabaddi',
    'Golf'
  ];
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        sports[widget.index],
        style: TextStyle(color: Colors.black54),
      ),
      backgroundColor: Colors.grey[200],
      selected: _isSelected,
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
    );
  }
}
