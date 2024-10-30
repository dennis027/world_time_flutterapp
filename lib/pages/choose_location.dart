import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter =0;
  
  @override
  void initState() {
    super.initState();
    print("whats happening over here");
  }

  @override
  Widget build(BuildContext context) {
    print("whats happening over here too");
    return Scaffold(
      body: TextButton(
          onPressed: () {
            setState(() {
              counter +=1;
            });
          },
          child: Text('Counter is $counter')),

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
