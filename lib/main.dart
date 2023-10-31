import 'package:flutter/material.dart';
//below imported quote.dart file
 import 'quote.dart';
//below imported quote_card.dart file
import 'quote_card.dart';

void main() => runApp(MaterialApp(
  home:QuoteList(),

  ));

class QuoteList extends StatefulWidget{
  @override
 _QuoteListState createState() =>_QuoteListState();

  }
class _QuoteListState extends State<QuoteList>
{
  // List<String> quotes=['Be yourself,everyone else is already taken'
  // ,'I have nothing to declare except my genius',
  // 'The truth is rarely pure and never simple'
  // ];
  List<Quote> quotes=[
    Quote(author: 'Osca Wilde',text: 'Be yourself,everyone else is already taken'),
  Quote(author: 'Osca Wilde',text: 'I have nothing to declare except my genius'),
  Quote(author: 'Osca Wilde',text: 'The truth is rarely pure and never simple')


  ];
  //below function is example of "Cards" and while extracting above function we call function inside build
  //so commented below
//  Widget quoteTemplate( quote)
// {
//
//   //this widget is going to return QuoteCard(which we have extracted from card from flutter outline) as given below
//   //return QuoteCard(quote: quote);
// }
//below function is example of "Cards"
// Widget quoteTemplate(quote)
// {
//   //this widget is going to return Card as given below
// return Card(
//   margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
//   child: Padding(
//     padding: const EdgeInsets.all(12.0),
//     child: Column(
//       //crossAxisAlignment used to stretch alignment
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         Text(
//           quote.text,
//           style: TextStyle(
//             fontSize: 18.0,
//             color: Colors.grey[600],
//           ),
//         ),
//
//         SizedBox(height: 6.0),
//         Text(
//           quote.author,
//             style: TextStyle(
//               fontSize: 14.0,
//               color: Colors.grey[800]
//             ),
//         )
//       ],
//     ),
//   ),
//
//
// );
// }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.grey[200],
     appBar:AppBar(
       title: Text("Awesome Quotes"),
       centerTitle: true,
       backgroundColor: Colors.redAccent,
     ) ,
body: Column(
  //below two lines used if list of data is String
  // children: quotes.map((quotes)=>Text(quotes))
  //   .toList(),
  //below two lines used if list of data is Object
  //to show output variable inside string we use $ sign
  // and when introduce "." (dot) or some kind of annotation we use curly braces(dash used to separate two properties)
// children: quotes.map((quotes)=>Text('${quotes.text} - ${quotes.author}'))
//       .toList(),
//below 1 line after using "Card" Template function(quoteTemplate(quote)function)
  //children: quotes.map((quotes)=>quoteTemplate(quotes)).toList(),

  //below 1 line after using extracting widget "Card"
  //children: quotes.map((quotes)=>QuoteCard(quote: quotes)).toList(),

  //below 1 line after using extracting widget "Card" and invoking delete function(Textbutton for deleting data added in "quote_card.dart"  file)

children: quotes.map((quote)=>QuoteCard(
    quote: quote,
    delete:(){
      setState(() {
       quotes.remove(quote);
      });
    }
    )).toList()



),
   );
  }

}


