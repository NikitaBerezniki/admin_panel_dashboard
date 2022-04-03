import 'package:admin_panel_dashboard/constants.dart';
import 'package:admin_panel_dashboard/responsive_layout.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class ButtonsInfo {
  final String title;
  final IconData icon;

  ButtonsInfo({required this.title, required this.icon});
}

int _currentIndex = 0;
final List<ButtonsInfo> _buttonsNames = [
  ButtonsInfo(title: 'Home', icon: Icons.home),
  ButtonsInfo(title: 'Settings', icon: Icons.settings),
  ButtonsInfo(title: 'Notifications', icon: Icons.notifications),
  ButtonsInfo(title: 'Contacts', icon: Icons.contacts),
  ButtonsInfo(title: 'Sales', icon: Icons.sell),
  ButtonsInfo(title: 'Marketing', icon: Icons.mark_email_read),
  ButtonsInfo(title: 'Security', icon: Icons.verified_user),
  ButtonsInfo(title: 'Users', icon: Icons.supervised_user_circle_rounded),
];

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(Constants.kPadding),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Admin menu'.toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: ResponsiveLayot.isComputer(context)
                      ? null
                      : IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close, color: Colors.white),
                        ),
                ),
                ...List.generate(
                  _buttonsNames.length,
                  (index) => Column(
                    children: [
                      Container(
                        decoration: index == _currentIndex
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(colors: [
                                  Constants.redDark.withOpacity(0.9),
                                  Constants.redLight.withOpacity(0.9),
                                ]),
                              )
                            : null,
                        child: ListTile(
                          title: Text(_buttonsNames[index].title,
                              style: const TextStyle(color: Colors.white)),
                          leading: Padding(
                            padding: const EdgeInsets.all(Constants.kPadding),
                            child: Icon(
                              _buttonsNames[index].icon,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () => setState(() => _currentIndex = index),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Constants.kPadding * 2),
                          ),
                        ),
                      ),
                      const Divider(color: Colors.white, thickness: 0.1)
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
