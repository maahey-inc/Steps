import 'package:flutter/material.dart';
import 'package:steps_app/theme.dart';

class Button extends StatelessWidget {
  Function() onpressed;
  Widget child;
  Color color;
  double radius;
  Button({
    @required this.child,
    @required this.onpressed,
    this.color = darkgrey,
    this.radius = 10,
  });
  //const Button({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //autofocus: false,
      onPressed: onpressed,
      child: child,
      style: ButtonStyle(
        //elevation: 5.0,
        // padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}
