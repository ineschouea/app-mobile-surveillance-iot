import 'package:flutter/material.dart';
import 'package:map/components/text_field_container.dart';
import 'package:map/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.only(
        topRight: Radius.circular(30.0),
        bottomLeft: Radius.circular(30.0),
          topLeft:Radius.circular(30.0),
          bottomRight: Radius.circular(30.0)
    )
      ),
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),

    );
  }
}

/*
TextField(
onChanged: onChanged,
decoration: InputDecoration(
icon: Icon(
icon,
color: kPrimaryColor,
),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10.0),
),
filled: true,
hintStyle: TextStyle(color: Colors.grey[800]),
hintText: hintText,
fillColor: Colors.white70),
)
*/
