import 'dart:io';

import 'package:flutter/material.dart';
//below imported quote.dart file
 import 'quote.dart';
//below imported quote_card.dart file
import 'quote_card.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

void main() => runApp(MaterialApp(
  home:QuoteList(),

  ));

class QuoteList extends StatefulWidget{
  @override
 _QuoteListState createState() =>_QuoteListState();

  }
class _QuoteListState extends State<QuoteList>
{
  bool ?  _loading ;
  File ?  _image;
  List ?_outputs;
  List<Quote> filteredProducts = [];
String?fruitType;
  final  _imagePicker=new ImagePicker();
  String ?  filterPrice = '';

  void initState() {
    super.initState();
    _loading = true;



    //   _outputs![0]["label"] = quotes;
  //  filteredProducts = quotes;
    //filteredProducts = quotes.where((i) => i.ingredient==_outputs![0]["label"] ).toList();
    //AllMovies.whereNotNull().where((i) => i.isAnimated).toList()
    if(_outputs!=null) {
      filteredProducts = quotes.where((c) => c.ingredient ==  _outputs![0]["label"]).toList();
      print("tessst" +_outputs![0]["label"]);
      print("filtertotalOld " + quotes.length.toString());

    }
    else
      {
        filteredProducts=quotes;
      }
    loadModel().then((Value)
    {
      setState(() {
        _loading=false;
      });
    });
  }



  List<Quote> quotes=[
    Quote(title: 'Butter Chicken', text:'A classic Indian dish, beloved by all' ,ingredient: "Chicken,Lemon,Oil,Masala,Chilli,Onion",
        author: 'Darshan Shinde',image_url: 'http://farm8.staticflickr.com/7009/6535803057_34ae340d9c_z.jpg',
       isFavoured: false, iconColor: Colors.red),
    Quote(title: 'Gajar Halwa Cake', text:'A sweet carrot-based dessert' ,ingredient: "Carrots,Saffron,Ghee,Milk",
        author: 'Darshan Shinde',image_url: 'https://asthaskitchendilse.files.wordpress.com/2021/02/wp-1613898001193608997646282241255.jpg',
        isFavoured: false, iconColor: Colors.red),
    Quote(title: 'Chicken Kathi Rolls', text:'A famous India roll with a range of spices' ,ingredient: "Chilli Pepper,Capsicum,Cucumber,Onion,Oil",
        author: 'Gandhali Prabhudesai',
        image_url: 'https://spicecravings.com/wp-content/uploads/2020/12/Chicken-Kathi-Roll-Featured-1.jpg',
        isFavoured: true, iconColor: Colors.black),
    Quote(title: 'Aam Panna', text:'A refreshing and cooling drink' ,ingredient: "Mango,Jaggery,Lemon,Water",
        author: 'Gandhali Prabhudesai',
        image_url: 'https://upload.wikimedia.org/wikipedia/commons/0/01/Keri_Ka_Sharbat.JPG',
        isFavoured: true, iconColor: Colors.black),
    Quote(title: 'Aloo Chop', text:'Boiled potato fritter' ,ingredient: "Potato,Baking soda,Chickpea flour,Oil,Garam Masala",
        author: 'Gandhali Prabhudesai',
        image_url: 'https://www.vegrecipesofindia.com/wp-content/uploads/2017/11/aloo-chop-recipe-1-500x500.jpg',
        isFavoured: true, iconColor: Colors.black),

    // Quote(title: 'Butter Chicken', text:'A classic Indian dish, beloved by all' ,
    //     author: 'Darshan Shinde',image_url: 'http://farm8.staticflickr.com/7009/6535803057_34ae340d9c_z.jpg',
    //     isFavoured: false, iconColor: Colors.blue),
  ];



  loadModel() async
  {
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels:'assets/labels.txt',
    );
  }

  pickImage() async
  {
    var image=await _imagePicker.pickImage(source: ImageSource.gallery);
    if(image==null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path );
      quotes.clear();
      quotes=[
        Quote(title: 'Butter Chicken', text:'A classic Indian dish, beloved by all' ,ingredient: "Chicken,Lemon,Oil,Masala,Chilli,Onion",
            author: 'Darshan Shinde',image_url: 'http://farm8.staticflickr.com/7009/6535803057_34ae340d9c_z.jpg',
            isFavoured: false, iconColor: Colors.red),
        Quote(title: 'Gajar Halwa Cake', text:'A sweet carrot-based dessert' ,ingredient: "Carrots,Saffron,Ghee,Milk",
            author: 'Darshan Shinde',image_url: 'https://asthaskitchendilse.files.wordpress.com/2021/02/wp-1613898001193608997646282241255.jpg',
            isFavoured: false, iconColor: Colors.red),
        Quote(title: 'Chicken Kathi Rolls', text:'A famous India roll with a range of spices' ,ingredient: "Chilli Pepper,Capsicum,Cucumber,Onion,Oil",
            author: 'Gandhali Prabhudesai',
            image_url: 'https://spicecravings.com/wp-content/uploads/2020/12/Chicken-Kathi-Roll-Featured-1.jpg',
            isFavoured: true, iconColor: Colors.black),
        Quote(title: 'Aam Panna', text:'A refreshing and cooling drink' ,ingredient: "Mango,Jaggery,Lemon,Water",
            author: 'Gandhali Prabhudesai',
            image_url: 'https://upload.wikimedia.org/wikipedia/commons/0/01/Keri_Ka_Sharbat.JPG',
            isFavoured: true, iconColor: Colors.black),
        Quote(title: 'Aloo Chop', text:'Boiled potato fritter' ,ingredient: "Potato,Baking soda,Chickpea flour,Oil,Garam Masala",
            author: 'Gandhali Prabhudesai',
            image_url: 'https://www.vegrecipesofindia.com/wp-content/uploads/2017/11/aloo-chop-recipe-1-500x500.jpg',
            isFavoured: true, iconColor: Colors.black),

        // Quote(title: 'Butter Chicken', text:'A classic Indian dish, beloved by all' ,
        //     author: 'Darshan Shinde',image_url: 'http://farm8.staticflickr.com/7009/6535803057_34ae340d9c_z.jpg',
        //     isFavoured: false, iconColor: Colors.blue),
      ];
    });
    classifyImage(_image!);

  }

  classifyImage(File  image) async
  {
    var output= await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading=false;
      _outputs=output;
      fruitType= "${_outputs![0]["label"]}".replaceAll(RegExp(r'[0-9]'), '');

      filterProductsByPrice111(fruitType.toString().trim());
    });

  }
// // Function to filter products by price
//   void filterProductsByPrice(String price) {
//     setState(() {
//       price= _outputs![0]["label"]  ;
//       // Use the 'where' method to filter products by price
//    filteredProducts= quotes
//           .where((product) =>
//           product.ingredient.toString().contains(filterPrice!))
//           .toList();
//    print( "list"+ _outputs![0]["label"]);
//     });
//   }

  // Function to filter products by price
  // void filterProductsByPrice(String price) {
  //   setState(() {
  //     price= _outputs![0]["label"]  ;
  //     // Use the 'where' method to filter products by price
  //     quotes= quotes
  //         .where((product) =>
  //         product.ingredient.toString().contains("banana"))
  //         .toList();
  //     print("list111" + _outputs![0]["label"]);
  //
  //     if(_outputs!=null) {
  // var count = quotes
  //     .where((c) => c.ingredient == _outputs![0]["label"]).length;
  //
  // print("filter211 " + count.toString());
  // print("filtertotalnew " + quotes.length.toString());
  //
  //     }
  //   });
  // }

  void filterProductsByPrice111(String enteredKeyword) {
    setState(() {
      //  price= _outputs![0]["label"]  ;
      fruitType = "${_outputs![0]["label"]}".replaceAll(RegExp(r'[0-9]'), '');
      print("list111Final" + ' ' + fruitType.toString());

      if (enteredKeyword.isEmpty) {
        quotes = quotes;
      }
      else {
        // Use the 'where' method to filter products by price
        // quotes= quotes
        //     .where((product) =>
        //     // product.ingredient.toString().contains(fruitType.toString()))
        // product.ingredient.toString().contains("banana"))  .toList();
        String text = fruitType.toString().trim();
        print("text:" + text.toString());
        quotes = quotes
            .where((element) =>
            element.ingredient!
                .toLowerCase()
                .contains(text))
            .toList();


        //  print("list111 "  + _outputs![0]["label"]);

      }

      //     if(_outputs!=null) {
      // var count = quotes
      //     .where((c) => c.ingredient == _outputs![0]["label"]).length;
      //
      // print("filter211 " + count.toString());
      // print("filtertotalnew " + quotes.length.toString());
      //
      //     }
    });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     resizeToAvoidBottomInset: false,
     backgroundColor: Colors.grey[200],
     appBar:AppBar(
       title: Text("Recipes"),
       centerTitle: true,
       backgroundColor: Colors.redAccent,
     ) ,
    //below final
body:
Column
  (

  children:<Widget> [


Expanded(

  child: SingleChildScrollView(
    child: Container(child: Column(

        children: quotes.map((quote)=>QuoteCard(
       quote: quote,

       delete:(){
         setState(() {
           quotes.remove(quote);
         });
       }
   )).toList()



    ) ,
        ),
    ),

),

    Expanded(child:  _loading!
          ? Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      )
          :Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[

            _image==null
                ? Container(

            )
                :Container(
              child: Image.file(_image!),
              height: 100,
              width: MediaQuery.of(context).size.width-200,

            ),
            SizedBox(
              height: 10,
            ),
            _outputs!=null
                ? Text(
              "${_outputs![0]["label"]}".replaceAll(RegExp(r'[0-9]'), ''),
              style: TextStyle(
                  color:  Colors.black,
                  fontSize: 20.0,
                  background: Paint()..color=Colors.white,
                  fontWeight: FontWeight.bold),
            )
                :Text("Classification waiting"),
            // Container(
            //   child:SingleChildScrollView(
            //     child:Column(
            //
            //       //below 1 line after using extracting widget "Card" and invoking delete function(Textbutton for deleting data added in "quote_card.dart"  file)
            //
            //         children: quotes.map((quote)=>QuoteCard(
            //             quote: quote,
            //             delete:(){
            //               setState(() {
            //                 quotes.remove(quote);
            //               });
            //             }
            //         )).toList()
            //
            //
            //
            //     ),
            //   ),
            //
            // )



          ],
        ),
      ),
    )

  ],
),

     floatingActionButton: FloatingActionButton(
       onPressed: pickImage,
       tooltip: 'Increment',
       child: Icon(Icons.add),

     ),


   );

  }










   //   body: _loading!
   //   ? Container(
   //   alignment: Alignment.center,
   //  child: CircularProgressIndicator(),
   //  )
   //      :Container(
   //  width: MediaQuery.of(context).size.width,
   //  child: Column(
   //  crossAxisAlignment: CrossAxisAlignment.center,
   //  mainAxisAlignment: MainAxisAlignment.center,
   //  children:[
   //
   //  _image==null
   //  ? Container(
   //
   //  )
   //      :Container(
   //  child: Image.file(_image!),
   //  height: 500,
   //  width: MediaQuery.of(context).size.width-200,
   //
   //  ),
   //  SizedBox(
   //  height: 20,
   //  ),
   //  _outputs!=null
   //  ? Text(
   //  "${_outputs![0]["label"]}".replaceAll(RegExp(r'[0-9]'), ''),
   //  style: TextStyle(
   //  color:  Colors.black,
   //  fontSize: 20.0,
   //  background: Paint()..color=Colors.white,
   //  fontWeight: FontWeight.bold),
   //  )
   //      :Text("Classification waiting")
   //  ],
   //  ),
   //  ),
   //  floatingActionButton: FloatingActionButton(
   //  onPressed: pickImage,
   //  tooltip: 'Increment',
   //  child: Icon(Icons.add),
   //  ),
   // );




}
















