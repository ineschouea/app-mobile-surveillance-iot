import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as latLng;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:map/models/node.dart';
import 'package:map/models/sensor.dart';

import '../constants.dart';
import 'chart_page.dart';
import 'drawer_navigation.dart';
import 'line_chart_page.dart';

//create new class for "home" property of MaterialApp()
class Home extends StatelessWidget{

bool alertNode(Node node){
  bool test= false;
  for(Sensor sensor in node.sensors) {
    for(double measure in sensor.SensorMeasures){
      if(measure>45) {
        test = true;
      }
    }
  }

  return test;
}

  @override
  Widget build(BuildContext context) {
    //final List<String> entries = <String>['Sensor0','Sensor1', 'Sensor2', 'Sensor3','Sensor4', 'Sensor5', 'Sensor6'];
    //final List<int> colorCodes = <int>[600, 500, 100, 600, 500, 100, 600, 500, 100];
    final sensors = List.generate(
      20,
          (i) => Sensor(
        'Sensor $i',
        <double>[10.5, 20.25, 30.75, 40, 40, 30.8, 20.73, 10.31, 12.6, 30.1, 40, 30, 35]
      ),
    );

    final sensors2 = List.generate(
      5,
          (i) => Sensor(
          'Sensor $i',
          <double>[10.5, 20.25, 20, 40, 40, 30.8, 20.73, 50, 12.6, 30.1, 40, 30, 35]
      ),
    );

    final nodes = [Node('Node1', 51.5, -0.09, sensors),Node('Node2', 51.49, -0.11, sensors), Node('Node3', 51.51, -0.10, sensors2), Node('Node4', 51.479, -0.08, sensors),Node('Node5', 51.52, -0.07, sensors)];

    List<Marker> _markers=[];
    for (Node node in nodes) {
      _markers.add(Marker(
        width: 80.0,
        height: 80.0,
        point: latLng.LatLng(node.NodeLatitude, node.NodeLongitude),
        builder: (ctx) =>
            Container(
                child: IconButton(
                  icon: Icon(FontAwesomeIcons.mapMarkerAlt),
                  color: alertNode(node)==true ? Colors.red : kPrimaryColor,
                  iconSize: 45.0,
                  onPressed: (){
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                            height: MediaQuery.of(context).size.height * 0.35,

                            child:
                            Scrollbar(
                                child:ListView.builder(
                                    padding: const EdgeInsets.all(8),
                                    itemCount: node.sensors.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      if (index == 0) {
                                        // return the header
                                        return new Column(
                                            children: <Widget>[
                                              Container(
                                                  height: 30,
                                                  child: Text(
                                                    node.NodeName,
                                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
                                                  )
                                              ),
                                              Container(
                                                  height: 30,
                                                  child: Text(
                                                    node.NodeLatitude.toString() + ',' +node.NodeLongitude.toString() ,
                                                    style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor, fontSize: 20),
                                                  )
                                              ),
                                              Container(
                                                  height: 30,
                                                  child: Text(
                                                    "Sensors list:",
                                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
                                                  )
                                              )
                                            ]

                                        );
                                      }
                                      return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ChartPage(sensor: node.sensors[index]),
                                              ),
                                            );
                                          },
                                          child: Container(
                                              height: 50,
                                              color: kPrimaryLightColor,
                                              child: Center(child: Text(node.sensors[index].SensorName))
                                          )
                                      );

                                    }
                                )
                            )
                        )
                    );


                  },
                )
            ),
      ));

    }
      var alert;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Nodes Locations'),
          backgroundColor: kPrimaryColor,
        ),
        drawer: DrawerNavigaton(),
        body:
            new FlutterMap(
          options: MapOptions(
            center: latLng.LatLng(51.5, -0.09),
            zoom: 13.0,
          ),
          layers: [
            TileLayerOptions(
                urlTemplate: "https://api.mapbox.com/styles/v1/ines96/cktabux416qf418uq53xtuua2/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaW5lczk2IiwiYSI6ImNrdGFiNXl2cTAwNmcyb2xqb3hjeGt2cjgifQ.R_Kojn2fWB2VZ19OFCCN4Q",
                additionalOptions: {
                  'acessToken': "pk.eyJ1IjoiaW5lczk2IiwiYSI6ImNrdGFiNXl2cTAwNmcyb2xqb3hjeGt2cjgifQ.R_Kojn2fWB2VZ19OFCCN4Q",
                  'id': "mapbox.mapbox-streets-v8"
                }
            ),
            MarkerLayerOptions(
              markers: _markers,
            ),
          ],
        )

    );

  }
}
