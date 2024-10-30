import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData () async {
  //   simulate a network request for a user
    String username =await Future.delayed(Duration(seconds: 3), (){
    return ('Dennis');
    });

    String bio =  await Future.delayed(Duration(seconds: 2), (){
      return ('A software Developer');
    });


    print('The user is $username and his/her bio is $bio');
  }
  
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Text('Choose Location'),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
