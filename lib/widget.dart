import 'package:flutter/material.dart';
import 'constants.dart';

class NWidget extends StatelessWidget {
  NWidget({@required this.icons, this.text});
  final IconData icons;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icons,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: ktextstyle,
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class NewWidget extends StatelessWidget {
  NewWidget({@required this.colour, this.widget, this.onPress});
  final Color colour;
  final Widget widget;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: widget,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}

class Roundbutton extends StatelessWidget {
  Roundbutton({@required this.icon, @required this.onpress});
  final IconData icon;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      constraints: BoxConstraints.tightFor(height: 56, width: 56),
      onPressed: onpress,
      elevation: 10.0,
      hoverColor: Colors.grey.shade700,
    );
  }
}
