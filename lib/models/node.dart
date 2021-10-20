import 'package:map/models/sensor.dart';

class Node{
  final String NodeName;
  final double NodeLatitude;
  final double NodeLongitude;
  final List<Sensor> sensors;

  const Node(this.NodeName, this.NodeLatitude, this.NodeLongitude, this.sensors);
}