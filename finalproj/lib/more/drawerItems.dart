import 'package:finalproj/more/drawerItem.dart';
import 'package:flutter/material.dart';

class DrawerItems {
  static const home = DrawerItem(title: 'HOme', icon: Icons.home);
  static const more = DrawerItem(title: 'More', icon: Icons.abc);
  static const News = DrawerItem(title: 'News', icon: Icons.ring_volume);
  static const About = DrawerItem(title: 'About', icon: Icons.call);
  static const Logout = DrawerItem(title: 'Logout', icon: Icons.logout);

  static final List<DrawerItem> all = [home, more, News, About, Logout];
}
