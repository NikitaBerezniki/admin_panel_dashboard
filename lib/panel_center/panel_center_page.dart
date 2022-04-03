import 'package:admin_panel_dashboard/constants.dart';
import 'package:flutter/material.dart';

import '../panel_left/Panel_left_page.dart';
import 'bar_charts.dart';

class Person {
  final String name;
  final Color color;

  Person({required this.name, required this.color});
}

class PanelCenterPage extends StatefulWidget {
  const PanelCenterPage({Key? key}) : super(key: key);

  @override
  State<PanelCenterPage> createState() => _PanelCenterPageState();
}

class _PanelCenterPageState extends State<PanelCenterPage> {
  final _controller = ScrollController();
  final List<Person> _persons = [
    Person(name: 'Theria Bowen', color: Constants.orangeLight),
    Person(name: 'George Willies', color: Constants.redDark),
    Person(name: 'Huye Jeckman', color: Constants.greenLight),
    Person(name: 'Carlo Dodilas', color: Constants.orangeLight),
    Person(name: 'Pablo Escabaro', color: Constants.redDark),
    Person(name: 'Don Huan', color: Constants.greenLight),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            const TextIndicatorsWidget(
                text: 'Products Available',
                descr: '82% of the Products Available'),
            const Padding(
              padding: EdgeInsets.all(Constants.kPadding / 2),
              child: BarChartSample2(),
            ),
            
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding / 2),
              child: ContactsWidget(persons: _persons),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactsWidget extends StatelessWidget {
  const ContactsWidget({
    Key? key,
    required List<Person> persons,
  })  : _persons = persons,
        super(key: key);

  final List<Person> _persons;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Constants.purpleLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [const Padding(
              padding: EdgeInsets.all(Constants.kPadding),
              child: Text(
                'Persons message',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
        ...List.generate(
          _persons.length,
          (index) => ListTile(
            title: Text(_persons[index].name,
                style: const TextStyle(color: Colors.white)),
            leading: CircleAvatar(
              backgroundColor: _persons[index].color,
              radius: 15,
              child: Text(_persons[index].name.substring(0, 1),
                  style: const TextStyle(color: Colors.white)),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.message,
                  color: Colors.white,
                )),
          ),
        ),
      ]),
    );
  }
}
