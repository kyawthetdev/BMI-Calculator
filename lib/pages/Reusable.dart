import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class Reusable {

  //***************************reUsableCard****************************//
  static Widget reUsableCard(
      {@required Color colour, childWidget, Function onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        child: childWidget,
      ),
    );
  }
//*****************************reusableButton***********************************//
  static Widget reusableButton({@required label, @required onPressed}) {
    return FlatButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))),
      onPressed: onPressed,
      height: kBottomHeight,
      child: Text(
        label,
        style: kCalculateStyle,
      ),
      color: kBottomContainerColor,
    );
  }
  //******************************reUsableWidget*******************************//
  static  Widget reUsableWidget({icon, label}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(height: 15.0),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }

  //*****************************reusableRoundIconButton***************************//
  static  Widget reusableRoundIconButton({@required icon, @required onPressed}) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: icon,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      fillColor: kRoundIconButtonColor,
    );
  }
}
