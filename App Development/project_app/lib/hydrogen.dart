import 'package:flutter/material.dart';

class HydrogenPage extends StatefulWidget {
  const HydrogenPage({Key? key}) : super(key: key);

  @override
  State<HydrogenPage> createState() => _HydrogenPageState();
}

class _HydrogenPageState extends State<HydrogenPage>
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
        child: Text("Hydrogen Analytics"),
      ),
    );
  }
}
