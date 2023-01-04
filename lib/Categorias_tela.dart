import 'dart:async';

import 'package:flutter/material.dart';
import 'package:minhastarefas/banco_dados.dart';
import 'package:minhastarefas/objects.dart';
import 'package:minhastarefas/funções.dart';
import 'package:minhastarefas/props.dart';


class Tarefas extends StatefulWidget {
  Tarefas({Key? key}): super(key: key);
  static Props p = Props();
  static List<Categoria> selecionados = [];

  static void limpaselecao(){
            Tarefas.selecionando = false;
        Tarefas.selecionados = [];
        Tarefas.p.appbarcontroler.sink.add(Text("Categorias"));
        
  }
  static bool selecionando = false;

  @override
  State<Tarefas> createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {







  
  Future<dynamic> categorias = Dbhelper.instancia.pegartabela('categorias');

  void update(){
    Tarefas.selecionados = [];
    Tarefas.selecionando = false;
    setState(() {
      categorias = Dbhelper.instancia.pegartabela('categorias');
    });
      



  }
  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () async{
        if (Tarefas.selecionando == true){
        Tarefas.limpaselecao();
        update();
        return false;
        }
        return true;

   
        },
      child: Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: Tarefas.p.appbarcontroler.stream,
            initialData: Text('Categorias'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.data;
            },
          ),
        ),
        
        body: FutureBuilder(
          future: categorias,
          
    
        
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
    
              List<dynamic> data = snapshot.data;
              // usando o map para transformar a lista de MAPS para lista de categoria
              data = data.map((e) => Item_categoria(categoria: Categoria.frommap(e) ) ).toList();
    
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  
                  return data[index];
                },
              );
    
    
    
    
    
            }else{
              return CircularProgressIndicator();
            }
          },
    
          
        ),
    
    
    
    
    
    
    
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            
            show_add_dialog(update,context,'categorias');
    
          },
          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}