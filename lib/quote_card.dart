import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listofdata_flutter/quote.dart';
class QuoteCard extends StatelessWidget {
/*  const QuoteCard({
    super.key,
  });*/
  final Quote quote;
  //handle null saftey like below line (instead of  final Function delete;)
  final Function()? delete;
  //suggested to add "required" keyword(as it shows error on quote)
  //QuoteCard({required this.quote});
  QuoteCard({required this.quote,required this.delete});


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          //crossAxisAlignment used to stretch alignment
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),

            SizedBox(height: 6.0),
            Text(
              quote.author,
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[800]
              ),
            ),
            SizedBox(height: 8.0),
            TextButton.icon(
                onPressed: delete,
                label: Text('Delete Quote'),
                icon: Icon(Icons.delete),


            )],
        ),
      ),


    );
  }
}