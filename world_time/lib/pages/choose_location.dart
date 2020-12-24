import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  // void getData() async { // because of async, the other code wont wait on this function
  //
  //   // simulate network request for a username
  //   String username = await Future.delayed(Duration(seconds: 3), () { // asynchronous - rest of the code carries on. only this part wait 3 seconds
  //     // print('yoshi');
  //     return 'yoshi';
  //   });
  //   // await says wait till this is done
  //
  //   // print('statement'); // this prints without waiting 3 seconds
  //   // but if we want it to wait?
  //
  //   // simulate network request to get bio of the username
  //   String bio = await Future.delayed(Duration(seconds: 2), () { // asynchronous - rest of the code carries on. only this part wait 3 seconds
  //     return 'vegan, musician, & egg collector';
  //   });
  //
  //   print('$username - $bio');
  // }

  // int counter = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   // print('initState function ran');
  //   getData();
  // }

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Colombo', location: 'Colombo', flag: 'sl.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png')
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar( // automatically adds a back button to go to previous screen
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        elevation: 0,
      ),
      // body: RaisedButton(
      //   onPressed: () {
      //     setState(() {
      //       counter += 1;
      //     });
      //   },
      //   child: Text('counter is $counter'),
      // body: Text('choose location screen'),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}
