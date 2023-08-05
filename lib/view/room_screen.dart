import 'package:flutter/material.dart';
import 'package:smart_home/res/color.dart';
import 'package:smart_home/widgets/condition_card_widget.dart';

import '../gen/assets.gen.dart';
import '../res/dimens.dart';
import '../widgets/circular_porgress_bar.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:WithColor.scaffoldColor,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ConditoinCard(
                  gradient:WithGradiant.conditionCardGradiant,
                  icon: ImageIcon(AssetImage(Assets.icon.airConditioner.path)),
                  iconColor: Colors.white,
                  title: 'AC',
                  textStyle: const TextStyle(color: Colors.white),
                  width: Dimens.conditonCardDimens,
                  height: Dimens.conditonCardDimens,
                  onTap: () {
                  }),
              ConditoinCard(
                  gradient: const [Colors.white, Colors.white],
                  icon: ImageIcon(AssetImage(Assets.icon.vinyl.path)),
                  iconColor: Colors.grey.shade700,
                  title: 'Music',
                  textStyle: TextStyle(color: Colors.grey.shade500),
                  width: Dimens.conditonCardDimens,
                  height: Dimens.conditonCardDimens,
                  onTap: () {}),
              ConditoinCard(
                  gradient: const [Colors.white, Colors.white],
                  icon: ImageIcon(AssetImage(Assets.icon.lightIcon.path)),
                  iconColor: Colors.grey.shade700,
                  title: 'Light',
                  textStyle: TextStyle(color: Colors.grey.shade500),
                  width: Dimens.conditonCardDimens,
                  height: Dimens.conditonCardDimens,
                  onTap: () {}),
              ConditoinCard(
                  gradient: const [Colors.white, Colors.white],
                  icon: ImageIcon(AssetImage(Assets.icon.lock.path)),
                  iconColor: Colors.grey.shade700,
                  title: 'Security',
                  textStyle: TextStyle(color: Colors.grey.shade500),
                  width: Dimens.conditonCardDimens,
                  height: Dimens.conditonCardDimens,
                  onTap: () {}),
              const SizedBox(
                height: Dimens.hundred/2,
              ),
            ],
          ),
          const SizedBox(
            height: Dimens.hundred,
          ),
          SizedBox(
              width: Dimens.hundred*2,
              height: Dimens.hundred*2,
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
            height: Dimens.hundred/2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Column(
                children: [Text('Samsung AC'), Text('Connected')],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('on'),
                  Switch(
                      value: true,
                      onChanged: (value) {
                        value = !value;
                      }),
                ],
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)))),
              child: const Text('Set Temp '))
        ],
      ),
    );
  }
}
