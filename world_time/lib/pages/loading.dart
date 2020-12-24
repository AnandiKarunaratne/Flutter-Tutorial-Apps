import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // void getTime() async {
  //
  //   // make the request
  //   Response response = await get('http://worldtimeapi.org/api/timezone/Asia/Colombo');
  //   Map data = jsonDecode(response.body);
  //   // print(data['utc_offset']);
  //
  //   // get properties from data
  //   String datetime = data['datetime'];
  //   String offsetHours = data['utc_offset'].substring(1,3);
  //   String offsetMinutes = data['utc_offset'].substring(4,6);
  //   // print(datetime);
  //   // print(offset_minutes);
  //
  //   // create DateTime object
  //   DateTime now = DateTime.parse(datetime);
  //   now = now.add(Duration(hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)));
  //   print(now);
  //
  //   // Response response = await get ('https://jsonplaceholder.typicode.com/todos/1'); // json placeholder
  //   // Map data = jsonDecode(response.body); // json returns a string. we convert it to a map
  //   // print(data);
  //   // print(data['title']); // we cant do this unless we do jsndecode
  //
  // }

  // String time = 'loading';

  void setupWorldTime() async { // add async because we use await
    WorldTime instance = WorldTime(location: 'Colombo', flag: 'srilanka.png', url: 'Asia/Colombo');
    await instance.getTime(); // we cant add await here. add future to getTme
    // print(instance.time); // we cant do this as WorldTime is asynchronous
    // setState(() {
    //   time = instance.time;
    // });
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    // getTime();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Text('loading screen'),
      // body: Padding(
      //   padding: EdgeInsets.all(50.0),
      //   // child: Text(time),
      //   child: Text('loading'),
      // ),
      backgroundColor: Colors.blue[900],
      body: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 50.0,
          ),
      ),
    );
  }
}
