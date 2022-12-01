import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '409631560 林威朋'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Product> listItems = List<Product>.generate(10, (i) {
    return Product(
      name:"第$i本",
      price:'售價:$i元',
      tag: i,
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (context, index){
            return ListTile(
              leading: const Icon(Icons.auto_stories),
              title: Text(listItems[index].name),
              subtitle: Text(listItems[index].price),
              onTap: (){
                int dataIndex = listItems[index].tag;
                final snackBar = SnackBar(
                  duration: const Duration(milliseconds: 500),
                    content: Text('點選了第$dataIndex本'));
                Scaffold.of(context).showSnackBar(snackBar);
              },
            );
          },
        )
      ),
    );
  }
}
class Product{
  final String name;
  final String price;
  final int tag;

  Product({required this.name,  required this.price, required this.tag});
}
