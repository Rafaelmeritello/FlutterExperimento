import 'package:minhastarefas/Categorias_tela.dart';
import 'package:minhastarefas/banco_dados.dart';
import 'package:flutter/material.dart';
class Tarefa{
  int? feito;
  int? nodia;
  String? titulo;
  String? categoria;
  Tarefa({required this.titulo,
   required this.categoria,
   this.feito = 0,
   this.nodia = 0,
  });

  Map<String,dynamic> tomap(){
    return {
      'titulo':this.titulo,
      'feito':this.feito,
      'nodia':this.nodia,
      'categoria': this.categoria,

    };

  }
  static Tarefa frommap(Map<String,dynamic> map){
    var titulo = map['titulo'];
    var feito = map['feito'];
    var categoria = map['categoria'];
    var nodia = map['nodia'];
    return Tarefa(
      titulo: titulo,
      feito: feito,
      categoria:categoria,
      nodia:nodia,
      );
  }
}


class Categoria{

  String? titulo;

  Categoria({required this.titulo});

  Map<String,dynamic> tomap(){
    return {
      'titulo':this.titulo,
    };

  }
  void deletar(){
    Dbhelper.instancia.deletarlinha('categorias', '${this.titulo}');
  }

  static Categoria frommap(Map<String,dynamic> map){
    var titulo = map['titulo'];


    return Categoria(
      titulo: titulo,

      );
  }
}


abstract class ItemSelecionavel extends StatefulWidget{
 ItemSelecionavel({Key? key}): super(key: key);
  bool selecionado = false;



  void selecionar(){}
}




class Item_categoria extends ItemSelecionavel{
  Categoria? categoria;
  
  Item_categoria({Key? key, required this.categoria}): super(key: key);
  @override 


  
  State<Item_categoria > createState() => ItemcategoriaState();

}







class ItemcategoriaState extends State<Item_categoria> {
  void selecionar(){
              widget.selecionado ? Tarefas.selecionados.remove(widget.categoria!) : Tarefas.selecionados.add(widget.categoria!);
          widget.selecionado = !widget.selecionado;

          if (Tarefas.selecionados.length == 1){
            Tarefas.selecionando = true;
          }

          Tarefas.p.updateappbar(Text('${Tarefas.selecionados.length}'));

          if(Tarefas.selecionados.length == 0){
            Tarefas.p.appbarcontroler.sink.add(Text("Categorias"));
            Tarefas.selecionando = false;
          }
          
  }
  @override
  Widget build(BuildContext context) {
   
    return InkWell(
      onLongPress: (){

        selecionar();
      setState(() {});
      },


      onTap: (){
        if (Tarefas.selecionando == false){
          return;
        }
        setState(() {
          selecionar();

          
        });
      },

      
      child: Container(
        color: widget.selecionado ? Colors.yellow : Colors.white30,
        child: ListTile(

          title: Center(child: Text('${widget.categoria?.titulo}', style: TextStyle(fontSize: 18))),
        ),
      ),
    );
  }
}





