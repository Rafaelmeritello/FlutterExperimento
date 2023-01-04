import 'package:flutter/material.dart';
import 'package:minhastarefas/banco_dados.dart';

class Meudia extends StatefulWidget {
  Meudia({Key? key}): super(key: key);


  @override
  State<Meudia> createState() => _MeudiaState();
}

class _MeudiaState extends State<Meudia> {
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        actions: [
       
          Container(
            margin: EdgeInsets.only(right:13),
            child: IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.delete, size:30)),
            )
        ],
        title: Text('Meudia'),
        backgroundColor: Colors.red,
      ),
      body: Text('a'),
    );
  }
}