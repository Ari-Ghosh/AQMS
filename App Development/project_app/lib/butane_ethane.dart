import 'package:flutter/material.dart';

class ButaneEthanePage extends StatefulWidget {
  const ButaneEthanePage({Key? key}) : super(key: key);

  @override
  State<ButaneEthanePage> createState() => _ButaneEthanePageState();
}

class _ButaneEthanePageState extends State<ButaneEthanePage>
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
        child: Text("LPG, Butane Ethane Analytics"),
      ),
    );
  }
}
