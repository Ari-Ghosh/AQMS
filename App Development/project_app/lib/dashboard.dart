import 'package:flutter/material.dart';
import 'package:project_app/temperature.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import 'ammonia_benzene_alcohol_smoke.dart';
import 'butane_ethane.dart';
import 'carbon_monoxide.dart';
import 'humidity.dart';
import 'hydrogen.dart';
import 'natural_gas.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  var currentPage = TileSections.dashboard;

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
    var container;
    if (currentPage == TileSections.dashboard) {
      container = const DashboardPage();
    } else if (currentPage == TileSections.dht11_t) {
      container = const TemperaturePage();
    } else if (currentPage == TileSections.dht11_h) {
      container = const HumidityPage();
    } else if (currentPage == TileSections.mq2) {
      container = const ButaneEthanePage();
    } else if (currentPage == TileSections.mq5) {
      container = const NaturalGasPage();
    } else if (currentPage == TileSections.mq7) {
      container = const CarbonMonoxidePage();
    } else if (currentPage == TileSections.mq8) {
      container = const HydrogenPage();
    } else if (currentPage == TileSections.mq135) {
      container = const AmmoniaBenzeneAlcoholSmokePage();
    }
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          myItems(
            1,
            Icons.thermostat_auto_outlined,
            "Temperature",
            0xFFA01515,
            currentPage == TileSections.dht11_t ? true : false,
          ),
          myItems(
            2,
            Icons.water_drop_outlined,
            "Humidity",
            0xFF09439B,
            currentPage == TileSections.dht11_h ? true : false,
          ),
          myItems(
            3,
            Icons.gas_meter_outlined,
            "Butane Ethane(LPG)",
            0xFF333232,
            currentPage == TileSections.mq2 ? true : false,
          ),
          myItems(
            4,
            Icons.compost_outlined,
            "Natural Gas(LPG)",
            0xFF033106,
            currentPage == TileSections.mq5 ? true : false,
          ),
          myItems(
            5,
            Icons.commute_sharp,
            "Carbon Monoxide",
            0xFF2E1B17,
            currentPage == TileSections.mq7 ? true : false,
          ),
          myItems(
            6,
            Icons.h_plus_mobiledata,
            "Hydrogen",
            0xFF455A64,
            currentPage == TileSections.mq8 ? true : false,
          ),
          myItems(
            7,
            Icons.smoke_free,
            "Ammonia, Benzene, Alcohol and Smoke",
            0xFF702503,
            currentPage == TileSections.mq135 ? true : false,
          ),
        ],
        staggeredTiles: const [
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(2, 140.0),
          StaggeredTile.extent(2, 140.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(2, 150.0),
        ],
      ),
    );
  }

  Material myItems(
    int id,
    IconData icon,
    String heading,
    int color,
    bool selected,
  ) {
    return Material(
      color: selected ? Colors.teal[200] : Colors.teal[400],
      elevation: 14.0,
      shadowColor: Colors.teal[800],
      borderRadius: BorderRadius.circular(24.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = TileSections.dashboard;
            } else if (id == 2) {
              currentPage = TileSections.dht11_t;
            } else if (id == 3) {
              currentPage = TileSections.dht11_h;
            } else if (id == 4) {
              currentPage = TileSections.mq2;
            } else if (id == 5) {
              currentPage = TileSections.mq5;
            } else if (id == 6) {
              currentPage = TileSections.mq7;
            } else if (id == 7) {
              currentPage = TileSections.mq8;
            } else if (id == 8) {
              currentPage = TileSections.mq135;
            }
          });
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Text
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        heading,
                        style: TextStyle(
                          color: new Color(color),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //Icon
                    Material(
                      color: new Color(color),
                      borderRadius: BorderRadius.circular(24.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          icon,
                          color: Colors.grey[200],
                          size: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum TileSections {
  dashboard,
  dht11_t,
  dht11_h,
  mq2,
  mq5,
  mq7,
  mq8,
  mq135,
}
