import 'package:flutter/material.dart';

class Constants {
  static const kBottomTabBarHeight = 46.0;
  static const kCameraIconScale = 1.4;
  static const kHeaderPadding = EdgeInsets.only(top: 8.0);
  static const kCameraButtonWidth = 16.0;

  static const String NEW_GROUP = 'New group';
  static const String NEW_BROADCAST = 'New broadcast';
  static const String WEB_WHATSAPP = 'WhatsApp web';
  static const String STARRED_MESSAGES = 'Starred messages';
  static const String SETTINGS = 'Settings';

  static const List<String> choices = <String>[
    NEW_GROUP,
    NEW_BROADCAST,
    WEB_WHATSAPP,
    STARRED_MESSAGES,
    SETTINGS,
  ];
}
