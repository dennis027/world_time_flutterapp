import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map<String, dynamic> deta = {};


  @override
  Widget build(BuildContext context) {

    final routeData = ModalRoute.of(context)?.settings.arguments;

    if (routeData != null && routeData is Map<String, dynamic>) {
      deta = routeData;
    } else {
      deta = {}; // Assign a default if null or not a map
    }

    print('Imported data: $deta');

    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          OutlinedButton.icon(
              onPressed: (){
                Navigator.pushNamed(context, '/location');
              },
              label: Text("Edit Location") ,
              icon: Icon(Icons.edit_location),)
        ],
      )),
    );
  }
}
