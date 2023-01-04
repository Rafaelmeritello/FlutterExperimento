import 'package:flutter/material.dart';
import 'package:minhastarefas/Categorias_tela.dart';
import 'package:minhastarefas/MeuDia.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MinhasTarefas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),


    home: Inicio(),
      

      

    



// Rotas
      onGenerateRoute: (settings){
        
        Map<String,dynamic>? args = settings.arguments as Map<String, dynamic>?;
   


        switch (settings.name){



        }


      }

  // fim- rotas

    );
  }
}



class Inicio extends StatefulWidget {
  const Inicio({Key? key}): super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  int navindex = 0;
  List<Widget> telas = [
    Meudia(),
    Tarefas(),
    ];
  Widget build(BuildContext context) {



    return Scaffold(

      body: telas[navindex],
      
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: navindex,

        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: true,
        onTap: (index){
          setState(()=> navindex = index);
          Tarefas.limpaselecao();
         },
      

        items: const [


            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
             backgroundColor: Colors.red,
              label: 'MeuDia'
            ),


          BottomNavigationBarItem(
              icon: Icon(Icons.task_alt_outlined),
              label: 'Tarefas',
              backgroundColor: Colors.green,
            )
        ]
        
        ),
    );
  }
}