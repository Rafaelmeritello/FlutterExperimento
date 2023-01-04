  // ignore_for_file: unnecessary_brace_in_string_interps

  import 'package:minhastarefas/banco_dados.dart';
import 'package:flutter/material.dart';
  
  // ignore: non_constant_identifier_names
  void show_add_dialog(Function update, BuildContext context, String tabela){
    final _formKey = GlobalKey<FormState>();


    String? nome;

    showDialog(context: context,
     builder: (context){
      return
       AlertDialog(
        title: Text("Adicionar"),
        content: 
        Form(
          key: _formKey,
          child: 
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Digite o nome',
                ),
                validator: (value) {
                  if(value == null || value.isEmpty || value.trim().isEmpty){
                    return("Digite um nome");
                  }
                  nome = value;
                },
             
              )
          
        ),


        actions: [
          TextButton(onPressed: () async{
   

            if(_formKey.currentState!.validate()){


             var linha = await Dbhelper.instancia.pegarlinha('$tabela', '$nome') as List<dynamic>;
            print('ssd ${linha.length}');
            if(linha.length > 0){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$nome já existe, tente outro nome'))
              );
              return;
            }


            Dbhelper.instancia.add('$tabela', {'titulo':'${nome}'});
             
            Navigator.pop(context);

             update();
            
            }
          
          }, child: Text('Adicionar'))
        ],
      );
     });
  }


void show_delete_dialog(objeto, BuildContext context, Function update){
                     showDialog(context: context, 
                    builder: (context){

                      return AlertDialog(

                        title: Text('${objeto.titulo}'),
                        content: Text('quer mesmo deletar ${objeto.titulo}?'),
                        actions: [
                          TextButton(onPressed: (){
                              Navigator.pop(context);
                          }, child: Text('Não')),
                          TextButton(
                            onPressed: (){
                              objeto.deletar();
                              update();
                              Navigator.pop(context);
                            }, 
                            child: Text("Sim")),
   
                        ],


                      );
                    });
}