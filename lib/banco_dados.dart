import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class Dbhelper{
  Dbhelper._();
  static Dbhelper instancia = Dbhelper._();
  static Database? _bancodados;

  get bancodados async{
    if(_bancodados != null) return _bancodados;
    return await abrir();
  }

  abrir() async{
    return openDatabase(
      join(await getDatabasesPath(),'bancodados.db'),
      version:1,
      onCreate: ((db, version) {
        db.execute('create table categorias (titulo TEXT)');
        db.execute('create table tarefas (titulo TEXT, categoria TEXT, feito INTEGER, nodia INTEGER)');
      })
    );

  }
  
  pegartabela(String Tabela) async {
    Database db = await instancia.bancodados;
    return await db.query(Tabela);
  }

  pegarlinha(String tabela, String titulo) async {
    Database db = await instancia.bancodados;

  return await db.rawQuery("SELECT * FROM ${tabela} WHERE titulo = '$titulo'");
  }

  void add(String Tabela, Map<String, dynamic> valores) async {
    
    Database db = await instancia.bancodados;
    db.insert(Tabela, valores);

  }

  void limpar(String Tabela) async{
    Database db = await instancia.bancodados;
    db.delete(Tabela);
  }

  void deletarlinha(String tabela, String titulo) async{
    Database db = await instancia.bancodados;
    db.rawDelete("DELETE FROM '${tabela}' WHERE titulo = '${titulo}'");
  }
}
