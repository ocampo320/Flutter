import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  PlatformAppBar({
    this.title,
    this.actions,
  });
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? AppBar(
            title: Text(title),
            actions: actions,
          )
        : CupertinoNavigationBar(
            middle: Text(title),
            trailing: actions != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: actions,
                  )
                : null,
          );
  }

  @override
  Size get preferredSize {
    if (Platform.isAndroid) {
      return Size.fromHeight(kToolbarHeight + (0.0));
    } else {
      return const Size.fromHeight(44.0);
    }
  }
}
