import 'package:flutter/material.dart';

class CarbonMonoxidePage extends StatefulWidget {
  const CarbonMonoxidePage({Key? key}) : super(key: key);

  @override
  State<CarbonMonoxidePage> createState() => _CarbonMonoxidePageState();
}

class _CarbonMonoxidePageState extends State<CarbonMonoxidePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Carbon Monoxide Analytics"),
      ),
    );
  }
}
