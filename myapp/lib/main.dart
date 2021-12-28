import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count=0;
  List? data;
 getData()async{
    try{
      final result=
      await http.Client().get(
     Uri.parse('https://jsonplaceholder.typicode.com/posts')
     );
     setState(() {
       data= jsonDecode(result.body);
     });
    //  print(data![0]['title']);
      // return data[0]['title'];
     //print(result);
    //print(result.body);
    }catch(err){
      print('Error${err}');
    }
  }

// getData(){
//   http.Client().get(
//     Uri.parse('https://jsonplaceholder.typicode.com/posts')
//     ).then((response) => print(response.body))
//     .catchError((e)=>print('Error${e}'));
// }

  // getData(){
  //   Future.delayed(Duration(seconds: 5),(){
  //     print('Show your name');
  //   });
  //   Future.delayed(Duration(seconds: 2),(){
  //     print('Show your id');
  //   });
  //   print('This is without future');
  // }



  @override
   
  void initState() {
    super.initState();
    getData();
  
   
  }


  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'API',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            ),
            ),
            body: Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 300,
                    color: Colors.yellow,
                    child: Column(
                      children: [
                        Text(
                          data![count]['title'],
                          // data[0]['title'].toString()
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        RaisedButton(
                          onPressed: (){
                            setState(() {
                            count++;
                            }); 
                          },
                          child:Text('GetData') 
                          ,)
                    ],)

                  ),
                  )

            ],)
      )
            );
  }
}