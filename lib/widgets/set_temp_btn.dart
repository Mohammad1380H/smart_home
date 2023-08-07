import 'package:flutter/material.dart';
import 'package:smart_home/res/string.dart';

import '../res/dimens.dart';
import '../res/style.dart';

class SetTempBtn extends StatelessWidget {
  const SetTempBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Dimens.margin,0,Dimens.margin,0),
      child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(double.maxFinite, Dimens.hundred/2)),
            backgroundColor:MaterialStateProperty.all(Colors.blueAccent) ,
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)))),
          child:  Text(KeyString.setTemp,style: Styles.normalText,)),
    );
  }
}
