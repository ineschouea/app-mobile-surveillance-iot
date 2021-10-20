import 'package:map/models/sensor.dart';
import 'package:map/widget/line_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom_widget/zoom_widget.dart';
import '../constants.dart';

class LineChartPage extends StatefulWidget {
  const LineChartPage({Key? key, required this.sensor, required this.dateStart, required this.dateEnd, required this.freq, }) : super(key: key);

  // Declare a field that holds the Todo.
  final Sensor sensor;
  final DateTime dateStart;
  final DateTime dateEnd;
  final String freq;

  @override
  State<StatefulWidget> createState() => _LineChartPageState();
}

class _LineChartPageState extends State<LineChartPage> {

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text("Measures History"), centerTitle: true),
      body:SafeArea(
  //by default scroll directioin is vertical
  child: SingleChildScrollView(
  //changing scroll direction into horizontal
  scrollDirection: Axis.horizontal,
  child: Row(
  children: <Widget>[
      Container(
          height: MediaQuery.of(context).size.height ,

          width: MediaQuery.of(context).size.width ,
          color: Colors.black,
         // child: Column(
            //children: <Widget>[
             /* Container(
                  height: MediaQuery.of(context).size.height*0.06 ,
                  width: MediaQuery.of(context).size.width *0.9 ,
                  margin: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),

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
                      "Start date:  "+new DateFormat('dd/MM/yyyy').format(dateStart),
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
                      )
                    ],
                  )
              ),
              Container(
                  height: MediaQuery.of(context).size.height*0.06 ,
                  width: MediaQuery.of(context).size.width *0.9 ,
                  margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),

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
                         "End date:  "+new DateFormat('dd/MM/yyyy').format(dateEnd),
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
                      )
                    ],
                  )
              ),
              Container(
                  height: MediaQuery.of(context).size.height*0.06 ,
                  width: MediaQuery.of(context).size.width *0.9 ,
                  margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),

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
                          "Frequency:  "+freq,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
                      )
                    ],
                  )
              ),*/
         // Container(
  child: SafeArea(
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[ Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        color: const Color(0xff020227),
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryLightColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  topLeft:Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)
              )
          ),
          height: MediaQuery.of(context).size.height*0.8,
          width: MediaQuery.of(context).size.width *0.95 ,

            margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
          padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
          child: LineChartWidget(sensor: widget.sensor,dateStart: widget.dateStart, dateEnd: widget.dateEnd ,freq: widget.freq)
        ),
      )
          ]
  )
      )
  )
      )
  ]
  )
      )
      )

  );



}
