import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? location; // location name for the UI
  String? time; // the time in that location
  String? flag; // URL to an asset flag icon
  String? url; // location URL for the API

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      print('Fetching time data...');
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone$url')).timeout(Duration(seconds: 5));;

      // Check if the response was successful
      if (response.statusCode == 200) {
        Map<String, dynamic> dera = jsonDecode(response.body);
        print(dera);

        // Extract datetime and offset
        String datetime = dera['datetime'];
        String offset = dera['utc_offset'].substring(1, 3);

        // Create a DateTime object and apply the offset
        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));

        // Set the time property
        time = DateFormat.jm().format(now);
      } else {
        throw Exception('Failed to load time data: ${response.statusCode}');
      }
    } catch (e) {
      print('Caught error: $e');
      time = 'Could not fetch time data';
    }
  }
}
