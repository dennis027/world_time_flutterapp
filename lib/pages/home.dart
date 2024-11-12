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

    deta['isDayTime'] == null ? deta['isDayTime'] = false :  deta['isDayTime'] = deta['isDayTime'];
    String bgImage = deta['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = deta['isDayTime'] ? Colors.blue :Colors.indigo ;

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
          decoration:BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover
            )

          ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: SafeArea(child: Column(
            children: [
              TextButton.icon(
                  onPressed:  () async {
                   dynamic results = await  Navigator.pushNamed(context, '/location');
                   setState(() {
                     deta = {
                       'location' : results.location,
                       'flag':results.flag,
                       'time':results.time,
                       'isDayTime':results.isDayTime
                     };
                   });
                  },
                  label: Text(
                      "Edit Location",
                      style: TextStyle(
                        color: Colors.grey[200]
                      ),
                  ) ,
                  icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],),),
        
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    deta['location'],
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2.5,
                      color:Colors.white
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              
              Text(deta['time'],
              style: TextStyle(
                fontSize: 66,
                  color:Colors.white
              ),)
              
              
              
        
            ],
          )),
        ),
      ),
    );
  }
}
