import 'package:admin_panel_dashboard/constants.dart';
import 'package:admin_panel_dashboard/panel_left/pie_chart.dart';
import 'package:admin_panel_dashboard/responsive_layout.dart';
import 'package:flutter/material.dart';

import 'curved_chart.dart';

class Todo {
  final String name;
  bool enable;

  Todo({
    this.enable = true,
    required this.name,
  });
}

final List<Todo> _todo = [
  Todo(name: 'Purchase Paper'),
  Todo(name: 'Refill the inventory of speakers', enable: false),
  Todo(name: 'Hire someone', enable: true),
  Todo(name: 'Marketing Strategy', enable: true),
  Todo(name: 'Selling furniture', enable: true),
  Todo(name: 'Finish the disclosure', enable: true),
];

class PanelLeftPage extends StatefulWidget {
  const PanelLeftPage({Key? key}) : super(key: key);

  @override
  State<PanelLeftPage> createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (ResponsiveLayot.isComputer(context))
            const BackgroundForDesctopWidget(),
          SingleChildScrollView(
            controller: _controller,
            child: Column(children: [
              const TextIndicatorsWidget(
                  text: 'Products Sold',
                  descr: '18% of Products Sold',
                  indicator: '4,500'),
              const LineChartSample2(),
              const PieChartSample2(),
              ListTodoWidget(todo: _todo)
            ]),
          ),
        ],
      ),
    );
  }
}

class TextIndicatorsWidget extends StatelessWidget {
  final String text;
  final String descr;
  final String indicator;
  const TextIndicatorsWidget({
    Key? key,
    required this.text,
    required this.descr,
    this.indicator = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Constants.kPadding / 2,
          right: Constants.kPadding / 2,
          top: Constants.kPadding / 2),
      child: Card(
        color: Constants.purpleLight,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: SizedBox(
          width: double.infinity,
          child: ListTile(
            title: Text(
              text, //'Products Sold'
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
            contentPadding: const EdgeInsets.symmetric(
                vertical: Constants.kPadding, horizontal: Constants.kPadding),
            subtitle: Text(
              descr, //'18% of Products Sold'
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            trailing: indicator == ''
                ? null
                : Chip(
                    label: Text(indicator, //'4,500'
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16)),
                  ),
          ),
        ),
      ),
    );
  }
}

class ListTodoWidget extends StatefulWidget {
  final todo;
  const ListTodoWidget({Key? key, required this.todo}) : super(key: key);

  @override
  State<ListTodoWidget> createState() => _ListTodoWidgetState();
}

class _ListTodoWidgetState extends State<ListTodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Constants.kPadding / 2,
          right: Constants.kPadding / 2,
          top: Constants.kPadding / 2,
          bottom: Constants.kPadding),
      child: Card(
        color: Constants.purpleLight,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(Constants.kPadding),
            child: Text(
              'ToDo list',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ...List.generate(
            widget.todo.length,
            (index) => CheckboxListTile(
              title: Text(
                widget.todo[index].name,
                style: const TextStyle(color: Colors.white),
              ),
              value: widget.todo[index].enable,
              onChanged: (newValue) =>
                  setState(() => widget.todo[index].enable = newValue ?? true),
            ),
          ),
        ]),
      ),
    );
  }
}

class BackgroundForDesctopWidget extends StatelessWidget {
  const BackgroundForDesctopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.purpleLight,
      width: 50,
      child: Container(
        decoration: const BoxDecoration(
          color: Constants.purpleDark,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
        ),
      ),
    );
  }
}
