import 'dart:ui';

class Quote {
  String? text = "";
  String? author = "";

  //newly added
  int? id;
  String? image_url;
  String? ingredient;
  String? title;
  bool? isFavoured=false;
  Color ? iconColor;
//below example of named parameters(use of curly brackets)

  // Quote({ required String text, required String author}) {
  //   this.text = text;
  //   this.author = author;
  // }
 // below example of named parameters
 // Quote({ required this.text, required this.author})
 // {
 //
 // }
  Quote({this.title,this.text,this.ingredient,this.author, this.image_url, this.isFavoured,required this.iconColor});
//  BlogModel({this.image_url, this.title});


}

//below example of named parameters
// Quote quote= Quote(text:'hello', author: 'john');
// Quote quote1= Quote(author:'john', text: 'hello');

