class Quote {
  String text = "";
  String author = "";
//below example of named parameters(use of curly brackets)

  // Quote({ required String text, required String author}) {
  //   this.text = text;
  //   this.author = author;
  // }
 // below example of named parameters
 Quote({ required this.text, required this.author})
 {

 }


}

//below example of named parameters
// Quote quote= Quote(text:'hello', author: 'john');
// Quote quote1= Quote(author:'john', text: 'hello');

