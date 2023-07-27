
import 'package:flutter/cupertino.dart';
import 'package:smart_home/route/name.dart';
import 'package:smart_home/view/room_screen.dart';


Map<String, Widget Function(BuildContext)> routes = {
  FromScreens.root: (context) => const RoomScreen(),

};
