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
              quote.title.toString(),
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 6.0),
            Text(
              quote.text.toString(),
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[800]
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              quote.ingredient.toString(),
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.blueAccent[800]
              ),
            ),

            SizedBox(height:15.0),
            Image.network(
              quote.image_url.toString(),
              width: 200,
              height: 200,


            ),
            // SizedBox(height: 6.0),
            // Align(
            //     alignment: Alignment.topRight,
            // child:
            //
            // Text(
            //   quote.author.toString(),
            //   style: TextStyle(
            //       fontSize: 14.0,
            //       color: Colors.grey[800]
            //   ),
            // ),
            // ),

      SizedBox(height: 4.0),
      TextButton.icon(
        onPressed: delete,
        label: Text('Favorite',style: TextStyle(
            color: Colors.redAccent,
          fontSize: 20

        )),

        icon: Icon(Icons.favorite,color: Colors.red),

      ),


      //   SizedBox(height: 4.0),
      //       TextButton.icon(
      //           onPressed: delete,
      //           label: Text('Delete Quote'),
      //           icon: Icon(Icons.delete),
      //
      //
      //       )
          ],
         ),
       ),


    );
  }
}