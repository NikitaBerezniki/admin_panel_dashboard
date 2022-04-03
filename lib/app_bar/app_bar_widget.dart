import 'package:admin_panel_dashboard/constants.dart';
import 'package:admin_panel_dashboard/responsive_layout.dart';
import 'package:flutter/material.dart';

List<String> _buttonNames = ['Overview', 'Revenues', 'Sales', 'Control'];
int _currentSelectedButton = 0;

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Constants.purpleLight,
        child: Row(children: [
          if (ResponsiveLayot.isComputer(context))
            const LogoWidget()
          else
            const OpenDrawerButtonWidget(),
          const SizedBox(width: Constants.kPadding),
          const Spacer(),
          if (ResponsiveLayot.isComputer(context))
            const SitesHeaderSectionsWidget()
          else
            const MobileHeaderSectionWidget(),
          const Spacer(),
          const SearchButtonWidget(),
          const NotificationButtonWidget(),
          if (!ResponsiveLayot.isPhone(context)) const AvatarWidget()
        ]),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: Constants.kPadding,
      margin: const EdgeInsets.all(Constants.kPadding),
      // height: double.infinity,
      decoration: const BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //       blurRadius: 10,
          //       color: Colors.black45,
          //       spreadRadius: 1,
          //       offset: Offset(0, 0)),
          // ],
          // shape: BoxShape.circle,
          ),
      // child: Image.asset(
      //   'assets/images/logo_long.png',
      //   fit: BoxFit.fitHeight,
      // ),
      child: CircleAvatar(
        backgroundColor: Colors.pink,
        radius: 30,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: ClipRRect(
              child: Image.asset('assets/images/logo.png'),
              borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }
}

class OpenDrawerButtonWidget extends StatelessWidget {
  const OpenDrawerButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (() {
        Scaffold.of(context).openDrawer();
      }),
      iconSize: 30,
      icon: const Icon(Icons.menu, color: Colors.white),
    );
  }
}

class SitesHeaderSectionsWidget extends StatefulWidget {
  const SitesHeaderSectionsWidget({Key? key}) : super(key: key);

  @override
  State<SitesHeaderSectionsWidget> createState() =>
      _SitesHeaderSectionsWidgetState();
}

class _SitesHeaderSectionsWidgetState extends State<SitesHeaderSectionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        _buttonNames.length,
        (int index) => TextButton(
          onPressed: () => setState(() => _currentSelectedButton = index),
          child: Padding(
            padding: const EdgeInsets.all(Constants.kPadding / 10), // /2
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _buttonNames[index],
                  style: TextStyle(
                      color: _currentSelectedButton == index
                          ? Colors.white
                          : Colors.white70),
                ),
                UnderliningTextWidget(index: index)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UnderliningTextWidget extends StatelessWidget {
  final int index;
  const UnderliningTextWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Constants.kPadding / 2),
      width: 60,
      height: 2,
      decoration: BoxDecoration(
          gradient: _currentSelectedButton == index
              ? const LinearGradient(
                  colors: [Constants.redDark, Constants.orangeDark])
              : null),
    );
  }
}

class MobileHeaderSectionWidget extends StatelessWidget {
  const MobileHeaderSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constants.kPadding * 2),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _buttonNames[_currentSelectedButton],
              style: const TextStyle(color: Colors.white),
            ),
            Container(
              margin: const EdgeInsets.all(Constants.kPadding / 2),
              width: 60,
              height: 2,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Constants.redDark, Constants.orangeDark])),
            )
          ]),
    );
  }
}

class SearchButtonWidget extends StatelessWidget {
  const SearchButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.white,
      icon: const Icon(Icons.search),
      iconSize: 30,
      onPressed: () {},
    );
  }
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Constants.kPadding),
      height: double.infinity,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          spreadRadius: 1,
          offset: Offset(0, 0),
        ),
      ], shape: BoxShape.circle),
      child: CircleAvatar(
        backgroundColor: Constants.orangeDark,
        radius: 30,
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: ClipRRect(
              child: Image.asset('assets/images/map.jpg'),
              borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}

class NotificationButtonWidget extends StatelessWidget {
  const NotificationButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          color: Colors.white,
          icon: const Icon(Icons.notifications_none_rounded),
          iconSize: 30,
          onPressed: () {},
        ),
        const Positioned(
            right: 6,
            top: 6,
            child: CircleAvatar(
              backgroundColor: Colors.pink,
              radius: 8,
              child: Text(
                '3',
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ))
      ],
    );
  }
}
