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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: SafeArea(child: Column(
          children: [
            OutlinedButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/location');
                },
                label: Text("Edit Location") ,
                icon: Icon(Icons.edit_location),),

            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  deta['location'],
                  style: TextStyle(
                    fontSize: 28,
                    letterSpacing: 2.5
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            
            Text(deta['time'],
            style: TextStyle(
              fontSize: 66
            ),)
            
            
            

          ],
        )),
      ),
    );
  }
}
