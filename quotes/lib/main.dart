import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(MaterialApp(
  home: QuoteList(),
));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  // List<String> quotes = [
  //   'Be yourself; everyone else is already taken',
  //   'I have nothing to declare except my genius',
  //   'The truth is rarely pure and never simple'
  // ];

  // we need to add the authors names
  // but having a separate array is inconvenient as the indexes should match exactly
  // so instead we will create an object - quote.dart

  List<Quote> quotes = [
    Quote(author: 'author1', text: 'Be yourself; everyone else is already taken'),
    Quote(author: 'author2', text: 'I have nothing to declare except my genius'),
    Quote(author: 'author3', text: 'The truth is rarely pure and never simple')
  ];

  // card template for quotes to be displayed
  // Widget quoteTemplate(quote) {
    // return Card(
    //     margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
    //     child: Padding(
    //       padding: const EdgeInsets.all(12.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         children: <Widget>[
    //           Text(
    //             quote.text,
    //             style: TextStyle(
    //               fontSize: 18.0,
    //               color: Colors.grey[600],
    //             ),
    //           ),
    //           SizedBox(height: 6.0,),
    //           Text(
    //             quote.author,
    //             style: TextStyle(
    //               fontSize: 14.0,
    //               color: Colors.grey[800],
    //             ),
    //           )
    //         ],
    //       ),
    //     )
    // );
  //   return QuoteCard(quote: quote);
  // }

  // template is minimzed to quotecard.
  // flutter outline -> right click -> extract new widget -> give a new name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        // children: quotes.map((quote) => Text(quote)).toList(),// map through quotes and for each quote,
        // we can turn anything into a list using toList()
        // children: quotes.map((quote) => Text('${quote.text} - ${quote.author}')).toList(), // quote's text property
        // children: quotes.map((quote) => quoteTemplate(quote)).toList(),
        // children: quotes.map((quote) => QuoteCard(quote: quote)).toList(),
        children: quotes.map((quote) => QuoteCard(
          quote: quote,
          delete: () { // we define the function here, and passed as a parameter
            setState(() {
              quotes.remove(quote);
            });
          }
        )).toList(),
      ),
    );
  }
}

// this happens after we select the extract new widget from the card template
// to make the quotecard reusable we will move it to a separate file
