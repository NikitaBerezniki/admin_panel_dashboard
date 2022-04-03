import 'package:admin_panel_dashboard/app_bar/app_bar_widget.dart';
import 'package:admin_panel_dashboard/drawer/drawer_page.dart';
import 'package:admin_panel_dashboard/panel_center/panel_center_page.dart';
import 'package:admin_panel_dashboard/panel_left/panel_left_page.dart';
import 'package:admin_panel_dashboard/panel_right/panel_right_page.dart';
import 'package:admin_panel_dashboard/responsive_layout.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int currentIndex = 0;
  static const List<Icon> _icons = [
    Icon(Icons.add, size: 30),
    Icon(Icons.list, size: 30),
    Icon(Icons.compare_arrows, size: 30)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: (ResponsiveLayot.isTinyLimit(context) ||
                  ResponsiveLayot.isTinyHeightLimit(context))
              ? Container()
              : const AppBarWidget(),
          preferredSize: const Size(double.infinity, 100)),
      body: ResponsiveLayot(
        tiny: Container(),
        phone: IndexedStack(index: currentIndex, children: const [
          PanelLeftPage(),
          PanelCenterPage(),
          PanelRightPage()
        ]), //
        tablet: Row(children: const [
          Expanded(child: PanelLeftPage()),
          Expanded(child: PanelCenterPage()),
        ]),
        largeTablet: Row(children: const [
          Expanded(child: PanelLeftPage()),
          Expanded(child: PanelCenterPage()),
          Expanded(child: PanelRightPage()),
        ]),
        computer: Row(children: const [
          Expanded(child: DrawerPage()),
          Expanded(child: PanelLeftPage()),
          Expanded(child: PanelCenterPage()),
          Expanded(child: PanelRightPage()),
        ]),
      ),
      drawer: ResponsiveLayot.isComputer(context) ? null : const DrawerPage(),
      bottomNavigationBar: ResponsiveLayot.isPhone(context)
          ? CurvedNavigationBar(
              items: _icons,
              backgroundColor: Colors.transparent,//Constants.purpleDark
              index: currentIndex,
              onTap: (index) => setState(() => currentIndex = index),
            )
          : null,
    );
  }
}
