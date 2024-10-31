import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime () async {
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Nairobi'));
    Map dera = jsonDecode(response.body);
    print(dera);

    // getting properties from the object
    String datetime = dera['datetime'];
    String offset = dera['utc_offset'].substring(1,3);


    // create a daytime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset) ));
    print (now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading'),
    );
  }
}
