import 'package:flutter/material.dart';
import 'ammonia_benzene_alcohol_smoke.dart';
import 'butane_ethane.dart';
import 'carbon_monoxide.dart';
import 'dashboard.dart';
import 'humidity.dart';
import 'hydrogen.dart';
import 'my_drawer_header.dart';
import 'natural_gas.dart';
import 'temperature.dart';

void main() {
  runApp(const AQMSApp());
}

class AQMSApp extends StatelessWidget {
  const AQMSApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A.Q.M.S. app',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const Homepage(title: 'A.Q.M.S. Home Page'),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = const DashboardPage();
    } else if (currentPage == DrawerSections.dht11_t) {
      container = const TemperaturePage();
    } else if (currentPage == DrawerSections.dht11_h) {
      container = const HumidityPage();
    } else if (currentPage == DrawerSections.mq2) {
      container = const ButaneEthanePage();
    } else if (currentPage == DrawerSections.mq5) {
      container = const NaturalGasPage();
    } else if (currentPage == DrawerSections.mq7) {
      container = const CarbonMonoxidePage();
    } else if (currentPage == DrawerSections.mq8) {
      container = const HydrogenPage();
    } else if (currentPage == DrawerSections.mq135) {
      container = const AmmoniaBenzeneAlcoholSmokePage();
    }
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        title: const Text(
          "Air Quality Monitoring System",
          textAlign: TextAlign.center,
        ),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        //shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          const Divider(),
          menuItem(2, "Temperature", Icons.thermostat_auto_outlined,
              currentPage == DrawerSections.dht11_t ? true : false),
          menuItem(3, "Humidity", Icons.water_drop_outlined,
              currentPage == DrawerSections.dht11_h ? true : false),
          const Divider(),
          menuItem(4, "Butane Ethane(LPG)", Icons.gas_meter_outlined,
              currentPage == DrawerSections.mq2 ? true : false),
          menuItem(5, "Natural Gas(LPG)", Icons.compost_outlined,
              currentPage == DrawerSections.mq5 ? true : false),
          const Divider(),
          menuItem(6, "Carbon Monoxide", Icons.commute_sharp,
              currentPage == DrawerSections.mq7 ? true : false),
          menuItem(7, "Hydrogen", Icons.h_plus_mobiledata,
              currentPage == DrawerSections.mq8 ? true : false),
          const Divider(),
          menuItem(8, "Ammonia, Benzene, Alcohol and Smoke", Icons.smoke_free,
              currentPage == DrawerSections.mq135 ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.dht11_t;
            } else if (id == 3) {
              currentPage = DrawerSections.dht11_h;
            } else if (id == 4) {
              currentPage = DrawerSections.mq2;
            } else if (id == 5) {
              currentPage = DrawerSections.mq5;
            } else if (id == 6) {
              currentPage = DrawerSections.mq7;
            } else if (id == 7) {
              currentPage = DrawerSections.mq8;
            } else if (id == 8) {
              currentPage = DrawerSections.mq135;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  dht11_t,
  dht11_h,
  mq2,
  mq5,
  mq7,
  mq8,
  mq135,
}
