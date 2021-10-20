import 'package:flutter/material.dart';
import 'package:map/models/sensor.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';




import '../constants.dart';
import '../main.dart';
import 'line_chart_page.dart';

class ChartPage extends StatefulWidget  {
  final Sensor sensor;

  const ChartPage({Key? key, required this.sensor}) : super(key: key);

  // Declare a field that holds the Todo.

  @override
  State<StatefulWidget> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
//  List<String> _locations = ['Please choose a location', 'A', 'B', 'C', 'D']; // Option 1
//  String _selectedLocation = 'Please choose a location'; // Option 1
  List<String> _freq = ['5min', '15min','30min', '1h', '5h', ]; // Option 2
  String _selectedFreq='5min'; // Option 2
  TextEditingController _dateController1 = TextEditingController();
  TextEditingController _dateController2 = TextEditingController();

  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  final f = new DateFormat('dd/MM/yyyy');
  late String  _setDate;

  Future<Null> _selectDate(BuildContext context, TextEditingController _dateController, DateTime selectedDate) async {
    final DateTime? picked = await showDatePicker(

        context: context,
        builder: (BuildContext context, Widget ?child) {
          return Theme(
            data: ThemeData(
              primarySwatch: Colors.grey,
              splashColor: Colors.black,
              textTheme: TextTheme(
                subtitle1: TextStyle(color: Colors.black),
                button: TextStyle(color: Colors.black),
              ),
              accentColor: Colors.black,
              colorScheme: ColorScheme.light(
                  primary: kPrimaryColor,
                  primaryVariant: Colors.black,
                  secondaryVariant: Colors.black,
                  onSecondary: Colors.black,
                  onPrimary: Colors.white,
                  surface: Colors.black,
                  onSurface: Colors.black,
                  secondary: Colors.black),
              dialogBackgroundColor: Colors.white,
            ),
            child: child ??Text(""),
          );
        },
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));

    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = f.format(selectedDate);
      });
  }

  @override
  void initState() {
    _dateController1.text = f.format(DateTime.now());
    _dateController2.text = f.format(DateTime.now());


    super.initState();
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Sensor Measures"), centerTitle: true),
    body: Container(
      height: MediaQuery.of(context).size.height ,

      width: MediaQuery.of(context).size.width ,
      color: Colors.black,
          child: Column(
             children: <Widget>[
                   Container(
                     height: MediaQuery.of(context).size.height*0.2 ,
                     width: MediaQuery.of(context).size.width *0.9 ,
                     margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                     padding: const EdgeInsets.only(top: 22.0, bottom: 5.0),

                       decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0),
                                topLeft:Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0)
          )
                     ),
                       child: Column(
                       children: [
                         Text(
                           widget.sensor.SensorName+": 35.50 °",
                                 style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor, fontSize: 25),
                          ), Text(
                           "",
                           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
                         ), Text(
                               "10/01/2021",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
                          )
                                        ],
                                  )
                   ),

                 Container(
                       height: MediaQuery.of(context).size.height*0.12 ,
                       width: MediaQuery.of(context).size.width *0.9 ,
                       alignment: Alignment.topLeft,
                       margin: const EdgeInsets.only( bottom: 10.0, top: 30.0),
                       padding: EdgeInsets.only( top: 10),
                       decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.only(
                               topRight: Radius.circular(30.0),
                               bottomLeft: Radius.circular(30.0),
                               topLeft:Radius.circular(30.0),
                               bottomRight: Radius.circular(30.0)
                           )
                       ),
                       child:  Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: <Widget>[
                           Text(
                             'Select Start Date',
                             style: TextStyle(
                                 fontStyle: FontStyle.italic,
                                 fontSize: 20,
                                 fontWeight: FontWeight.w600,
                                 color: kPrimaryColor
                                 ),
                           ),
                           InkWell(
                             onTap: () {
                               _selectDate(context,_dateController1, selectedDate1 );
                             },
                             child: Container(
                               width: 200,
                               height: 30,
                               margin: EdgeInsets.only(top: 0),
                               alignment: Alignment.center,
                               decoration: BoxDecoration( color: Colors.white),
                               child: TextFormField(
                                 style: TextStyle(fontSize: 20),
                                 textAlign: TextAlign.center,
                                 enabled: false,
                                 keyboardType: TextInputType.text,
                                 controller: _dateController1,
                                 /* onSaved: (String val) {
                                _setDate=val;
                              },*/
                                 // onSaved:(String val) {},
                                 decoration: InputDecoration(
                                     disabledBorder:
                                     UnderlineInputBorder(borderSide: BorderSide.none),
                                     // labelText: 'Time',
                                     contentPadding: EdgeInsets.only(top: 0.0)),
                               ),
                             ),
                           ),
                         ],

                       ),
                     ),

                     Container(
                         height: MediaQuery.of(context).size.height*0.12 ,
                         width: MediaQuery.of(context).size.width *0.9 ,
                         alignment: Alignment.topLeft,
                         margin: const EdgeInsets.only( bottom: 10.0),
                         padding: EdgeInsets.only( top: 10),
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.only(
                                 topRight: Radius.circular(30.0),
                                 bottomLeft: Radius.circular(30.0),
                                 topLeft:Radius.circular(30.0),
                                 bottomRight: Radius.circular(30.0)
                             )
                         ),
                         child:  Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget>[
                             Text(
                               'Select End Date',
                               style: TextStyle(
                                   fontStyle: FontStyle.italic,
                                   fontSize: 20,
                                   fontWeight: FontWeight.w600,
                                   color: kPrimaryColor
                               ),
                             ),
                             InkWell(
                               onTap: () {
                                 _selectDate(context,_dateController2, selectedDate2 );
                               },
                               child: Container(
                                 width: 200,
                                 height: 30,
                                 margin: EdgeInsets.only(top: 0),
                                 alignment: Alignment.center,
                                 decoration: BoxDecoration( color: Colors.white,),
                                 child: TextFormField(
                                   style: TextStyle(fontSize: 20),
                                   textAlign: TextAlign.center,
                                   enabled: false,
                                   keyboardType: TextInputType.text,
                                   controller: _dateController2,
                                   /* onSaved: (String val) {
                                _setDate=val;
                              },*/
                                   // onSaved:(String val) {},
                                   decoration: InputDecoration(
                                       disabledBorder:
                                       UnderlineInputBorder(borderSide: BorderSide.none),
                                       // labelText: 'Time',
                                       contentPadding: EdgeInsets.only(top: 0.0)),
                                 ),
                               ),
                             ),
                           ],

                         ),
                       ),

    Container(
      height: MediaQuery.of(context).size.height*0.15 ,
      width: MediaQuery.of(context).size.width *0.9 ,
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(top: 3.0, bottom: 30.0),
      padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),

      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              topLeft:Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)
          )
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Select frequency',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              color: kPrimaryColor,

            ),
          ),

      DropdownButton(
      hint: Text('Please choose a frequency'), // Not necessary for Option 1
      value: _selectedFreq,
      onChanged: (newValue) {
        setState(() {
          _selectedFreq = newValue.toString();
        });
      },
      items: _freq.map((freq) {
        return DropdownMenuItem(
          child: SizedBox(
            width: 100.0, // for example
            child: Text(freq, textAlign: TextAlign.center),
          ),
          value: freq,
        );
      }).toList(),
    ),
  ]
      )
    ),
               ElevatedButton.icon(

                 label: Text("Show  Measures's History",
                               style: TextStyle(
                                   fontStyle: FontStyle.italic,
                                   fontSize: 20,
                                   fontWeight: FontWeight.w600,
                                   color: Colors.white
                 ),),
                 icon: Icon(Icons.web),
                 style: ElevatedButton.styleFrom(
                   shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(18.0), side: BorderSide(color: Colors.white)),
                   primary: kPrimaryColor,
                   fixedSize: Size(MediaQuery.of(context).size.width *0.8, 50),
                 ),
                 onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) =>LineChartPage(sensor: widget.sensor, dateStart: selectedDate1, dateEnd: selectedDate1 ,freq: _selectedFreq),
                     ),
                   );
                 },
               )

     // LineChartPage(sensor: widget.sensor, periode: _selectedPeriode),
        ],
      ),
    ),
  );


}

/*
,DropdownButton(
                                   items: [
                                     DropdownMenuItem(
                                         child: Text("First Item"),
                                         value: 1,
                                               ),
                                     DropdownMenuItem(
                                          child: Text("Second Item"),
                                           value: 2,
                                        )
                                         ])
 */