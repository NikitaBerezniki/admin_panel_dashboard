import 'package:admin_panel_dashboard/constants.dart';
import 'package:flutter/material.dart';

import '../panel_left/Panel_left_page.dart';
import 'multiline_chart.dart';

class Product {
  final String name;
  bool active;

  Product({required this.name, required this.active});
}

List<Product> _product = [
  Product(name: 'Portable Projectors', active: true),
  Product(name: 'Bluetooth Speaker', active: false),
  Product(name: 'Smart Watch', active: true),
  Product(name: 'Bookends', active: false),
  Product(name: 'Refregerator', active: true),
  Product(name: 'CarWash', active: true),
  Product(name: 'Battery', active: true),
  Product(name: 'TV Station', active: false),
  Product(name: 'Active Pencil', active: true),
];

class PanelRightPage extends StatefulWidget {
  const PanelRightPage({Key? key}) : super(key: key);
  @override
  State<PanelRightPage> createState() => _PanelRightPageState();
}

class _PanelRightPageState extends State<PanelRightPage> {
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              const TextIndicatorsWidget(
                  text: 'Products Review', descr: 'Multipacket source'),
              const MultiLineChartSample1(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Constants.kPadding,
                    vertical: Constants.kPadding),
                child: Card(
                  color: Constants.purpleLight,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(children: [
                    const Padding(
                      padding: EdgeInsets.all(Constants.kPadding),
                      child: Text(
                        'Product switch',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ...List.generate(
                        _product.length,
                        (index) => SwitchListTile.adaptive(
                            title: Text(
                              _product[index].name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            value: _product[index].active,
                            onChanged: (newValue) {
                              setState(() {
                                _product[index].active = newValue;
                              });
                            }))
                  ]),
                ),
              )
            ],
          )),
    );
  }
}
