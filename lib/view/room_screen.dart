import 'package:flutter/material.dart';
import 'package:smart_home/res/color.dart';
import 'package:smart_home/res/string.dart';
import 'package:smart_home/res/style.dart';
import 'package:smart_home/widgets/condition_card_widget.dart';

import '../gen/assets.gen.dart';
import '../res/dimens.dart';
import '../widgets/circular_porgress_bar.dart';
import '../widgets/device_name.dart';
import '../widgets/set_temp_btn.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WithColor.scaffoldColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.fromLTRB(Dimens.margin, 0, Dimens.margin, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConditoinCard(
                    gradient: WithGradiant.conditionCardGradiant,
                    icon:
                        ImageIcon(AssetImage(Assets.icon.airConditioner.path)),
                    iconColor: Colors.white,
                    title: KeyString.ac,
                    textStyle: const TextStyle(color: Colors.white),
                    width: Dimens.conditonCardDimens,
                    height: Dimens.conditonCardDimens,
                    onTap: () {}),
                ConditoinCard(
                    gradient: const [Colors.white, Colors.white],
                    icon: ImageIcon(AssetImage(Assets.icon.vinyl.path)),
                    iconColor: Colors.grey.shade700,
                    title: KeyString.music,
                    textStyle: TextStyle(color: Colors.grey.shade500),
                    width: Dimens.conditonCardDimens,
                    height: Dimens.conditonCardDimens,
                    onTap: () {}),
                ConditoinCard(
                    gradient: const [Colors.white, Colors.white],
                    icon: ImageIcon(AssetImage(Assets.icon.lightIcon.path)),
                    iconColor: Colors.grey.shade700,
                    title: KeyString.light,
                    textStyle: TextStyle(color: Colors.grey.shade500),
                    width: Dimens.conditonCardDimens,
                    height: Dimens.conditonCardDimens,
                    onTap: () {}),
                ConditoinCard(
                    gradient: const [Colors.white, Colors.white],
                    icon: ImageIcon(AssetImage(Assets.icon.lock.path)),
                    iconColor: Colors.grey.shade700,
                    title: KeyString.security,
                    textStyle: TextStyle(color: Colors.grey.shade500),
                    width: Dimens.conditonCardDimens,
                    height: Dimens.conditonCardDimens,
                    onTap: () {}),
              ],
            ),
          ),
          const SizedBox(
            height: Dimens.hundred,
          ),
          SizedBox(
              width: Dimens.hundred * 2,
              height: Dimens.hundred * 2,
              child: CircularProgressbarWithAnimation(
                duration: const Duration(seconds: 5),
                textStyle: const TextStyle(color: Colors.red),
                colorConditions: [
                  ColorRule(color: Colors.red, rangeIndex: [0, 20]),
                  ColorRule(color: Colors.amber, rangeIndex: [20, 50]),
                  ColorRule(color: Colors.blue, rangeIndex: [50, 100]),
                ],
              )),
          const SizedBox(
            height: Dimens.hundred / 2,
          ),
          const DeviceName(deviceName: 'Samsung AC',status: true ,),
          const SetTempBtn()
        ],
      ),
    );
  }
}

