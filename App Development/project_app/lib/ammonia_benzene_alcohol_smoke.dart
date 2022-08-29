import 'package:flutter/material.dart';

class AmmoniaBenzeneAlcoholSmokePage extends StatefulWidget {
  const AmmoniaBenzeneAlcoholSmokePage({Key? key}) : super(key: key);

  @override
  State<AmmoniaBenzeneAlcoholSmokePage> createState() =>
      _AmmoniaBenzeneAlcoholSmokePageState();
}

class _AmmoniaBenzeneAlcoholSmokePageState
    extends State<AmmoniaBenzeneAlcoholSmokePage>
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
        child: Text("Ammonia,Benzene,Alcohol and Smoke Analytics"),
      ),
    );
  }
}
