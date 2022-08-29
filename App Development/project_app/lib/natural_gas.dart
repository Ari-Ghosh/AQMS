import 'package:flutter/material.dart';

class NaturalGasPage extends StatefulWidget {
  const NaturalGasPage({Key? key}) : super(key: key);

  @override
  State<NaturalGasPage> createState() => _NaturalGasPageState();
}

class _NaturalGasPageState extends State<NaturalGasPage>
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
        child: Text("Natural Gas, LPG Analytics"),
      ),
    );
  }
}
