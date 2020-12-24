import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart'; // used to format time properly

class WorldTime {

  String location; // location name for the UI
  String time; // time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDaytime; // true or false if daytime or not

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {

    try{
      // make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data['utc_offset']);

      // get properties from data
      String datetime = data['datetime'];
      String offsetHours = data['utc_offset'].substring(1,3);
      String offsetMinutes = data['utc_offset'].substring(4,6);
      // print(datetime);
      // print(offset_minutes);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)));
      // print(now);

      // set the time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      // time = now.toString();
      time = DateFormat.jm().format(now);

      // Response response = await get ('https://jsonplaceholder.typicode.com/todos/1'); // json placeholder
      // Map data = jsonDecode(response.body); // json returns a string. we convert it to a map
      // print(data);
      // print(data['title']); // we cant do this unless we do jsondecode
    }

    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }

  }
}

// WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
// instance.getTime()