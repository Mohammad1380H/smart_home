import 'package:flutter/material.dart';

import '../res/dimens.dart';
import '../res/style.dart';

class DeviceName extends StatelessWidget {
  final String deviceName;
  final bool status;

  const DeviceName({
    super.key,
    required this.deviceName,
    required this.status
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Dimens.margin, 0, Dimens.margin, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                deviceName,
                style: Styles.boldDeviceName,
              ),
              Text(
                status ? 'Connected' : 'DisConnected',
                style: Styles.normalStatus,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ON',
                style: Styles.normalText,
              ),
              Switch(
                  value: true,
                  onChanged: (value) {
                    value = !value;
                  }),
            ],
          )
        ],
      ),
    );
  }
}
