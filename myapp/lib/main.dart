import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  // home: Text('hey ninjas!'), // properties have to be comma separated
  home: Home(),
));

class Home extends StatelessWidget { // stless
  @override
  Widget build(BuildContext context) { // we return a widget
    return Scaffold( // basically like a wrapper to few different layout widgets
      appBar: AppBar( // Widgets always start with a capital letter
        title: Text('my first app'), // usual design => property: widget()
        centerTitle: true, // this does  not have to be a widget
        backgroundColor: Colors.red[600], // ctrl+q
      ),

      // body: Center( // centralizes whatever inside the center widget
        //
        // text
        // child: Text( // when we need something directly inside a widget we use the child property
        //   'hello ninjas!',
        //   style: TextStyle (
        //     fontSize: 20.0,
        //     fontWeight: FontWeight.bold,
        //     letterSpacing: 2.0,
        //     color: Colors.grey[600],
        //     fontFamily: 'IndieFlower',
        //   ),
        // ),
        //
        //
        // images
        // child: Image(
        //   image: NetworkImage('https://images.unsplash.com/photo-1607088829641-c82e5a47b2c5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80'), // url
        //   image: AssetImage('assets/image2.jpg'),
        // child: Image.asset('assets/image2.jpg'),
        //
        //
        // icons
        // child: Icon(
        //   Icons.airport_shuttle,
        //   color: Colors.lightBlue,
        //   size: 50.0,
        // ),
        //
        //
        // button
        // child: RaisedButton( // has a shadow
        //   onPressed: () {},
        //   child: Text('click me'),
        //   color: Colors.lightBlue,
        // )
        //
        // child: FlatButton( // does not have a shadow
        //   onPressed: () {
        //     print('you clicked me');
        //   },
        //   child: Text('click me'),
        //   color: Colors.lightBlue,
        // )
        //
        // child: RaisedButton.icon(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.mail
        //   ),
        //   label: Text('mail me'),
        //   color: Colors.amber,
        // ),
        //
        // child: IconButton(
        //   onPressed: () {
        //     print('you clicked me');
        //   },
        //   icon: Icon(Icons.alternate_email),
        //   color: Colors.amber,
        // )
      // ),

      // body: Container( // container takes up the space a child takes if there is a child inside
      //   // we can add padding and margin to our child if we use container
      //   padding: EdgeInsets.all(20.0), // inside space of the container
      //   // padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      //   // padding: EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
      //   margin: EdgeInsets.all(30.0), // outside space of the container
      //   color: Colors.grey[400], // background colour
      //   child: Text('hello'),
      // ),

      // body: Padding( // use padding widget if you want to add padding, but if you need to add margin too use container
      //   padding: EdgeInsets.all(90.0),
      //   child: Text('hello'),
      // ),

      // rows
      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly, // main axis - along a row, cross axis - along a column
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: <Widget>[
      //     Text('hello, world'),
      //     FlatButton(
      //       onPressed: (){},
      //       color: Colors.amber,
      //       child: Text('click me')
      //     ),
      //     Container(
      //       color: Colors.cyan,
      //       padding: EdgeInsets.all(30.0),
      //       child: Text('inside container'),
      //     ),
      //   ],
      // ),

      // column
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.end, // main axis - along a column, cross axis - along a row
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: <Widget>[
      //     Row(
      //       children: <Widget>[
      //         Text('hello,'),
      //         Text('world'),
      //       ],
      //     ),
      //     Container(
      //       padding: EdgeInsets.all(20.0),
      //       color: Colors.cyan,
      //       child: Text('one'),
      //     ),
      //     Container(
      //       padding: EdgeInsets.all(30.0),
      //       color: Colors.pinkAccent,
      //       child: Text('two'),
      //     ),
      //     Container(
      //       padding: EdgeInsets.all(40.0),
      //       color: Colors.amber,
      //       child: Text('three'),
      //     )
      //   ],
      // ),

      // expanded widgets - similar to flexbox
      body: Row(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Image.asset('assets/image2.jpg')),
          Expanded(
            flex: 1, // portion of width we want to associate with this expanded widget
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.cyan,
              child: Text('1'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.pinkAccent,
              child: Text('2'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.amber,
              child: Text('3'),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton( // this button has nothing inside it
        onPressed: () {}, // anonymous function
        child: Text('click'), // we are gonna add a text, hence the child
        backgroundColor: Colors.red[600],
      ),
    );
  }
}


