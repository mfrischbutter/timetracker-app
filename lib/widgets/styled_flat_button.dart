import 'package:flutter/material.dart';
import 'package:timetracker_app/styles/styles.dart';

class StyledFlatButton extends StatelessWidget {
  final String text;
  final onPressed;
  final double radius;
  final Color color;
  final bool filled;
  final Color splashColor;

  const StyledFlatButton(
    this.text, {
    this.onPressed,
    Key key,
    this.radius,
    this.color,
    this.splashColor,
    this.filled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: (filled) ? color ?? Colors.blue[500] : null,
      splashColor: splashColor ?? Colors.blue[200],
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.0),
        child: Text(
          this.text,
          style: Styles.p.copyWith(
            color: Colors.white,
            height: 1,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      onPressed: () {
        this.onPressed();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 4.0),
        side: BorderSide(
          color: color ?? Colors.blue[500],
          width: 1,
        ),
      ),
    );
  }
}
