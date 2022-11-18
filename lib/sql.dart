

// ننشئ كلاس SQL

// import 'package:sqflite/sqflite.dart';
//
// import 'package:path/path.dart';

// class SqlDb {
//
//   // initalize SQL DB
//
//   static Database? _db ;
//
//   // هنا انا بقوله انشئ قاعدة البيانات في حالة انها مش موجودة استدعي الفانكش بتاعة انشاءها
//
//   Future<Database?> get db async {
//     if (_db == null){
//       _db  = await intialDb() ;
//       return _db ;
//     }else {
//       return _db ;
//     }
//   }
//
//
//
//   intialDb() async {
//
//     // هنا عشان انشئ مسار للداتا بيز داخل هاتف الموبيل عشان يخزن البيانات طول مالتطبيق موجود
//     // في فانكشن جاهزة اقدر اخزن بيها الداتا بيز موجودة جوا SQL
//
//     // getDatabasepath  ودي فانكشن بتجيب المسار جاهز للموبيل
//
//     String databasepath = await getDatabasesPath();
//
//     // هنا لازم اختار اسم قاعدة البيانات واضيف المسار معاها عشان اربطهم ببعض وده هيكون من خلال join ودي فانكشن موجودة داخل باكدج
//     // path.dart
//     // join : هعدي منها المسار واسم قاعدة البيانات اللي عايز اكريتها
//     // ولو بصينا عليها هلاقيها بتضيفلي اسمالمسار اللي متحدد للداتا بيز وتعمل / للداتا بيز نفسها بعد المسار ده
//   // databasepath/tasks.db
//     String path = join(databasepath, 'Tasks.db');
//
//     // بعد معملت المسار واسم قاعدة البيانات ابدا افتح قواعد البيانات عشان انشاها
//
//     Database mydb = await openDatabase(path, onCreate: OnCreateDb, version: 1, onUpgrade: onUpdate);
//
//     return mydb;
//
//   }
// // on create : اقدر جواها انشئ الجدول بتاع قاعدة البيانات اللي انا محتاجه
//
//   // عشان اقدر انشئ الجدول واعمل سطور فوق بعض جواه لازم الفانكشن جواه تكون ''' , '''
//
//   // فانكشن لانشاء قاعدة الاعمدة لقواعد البيانات
//
//   OnCreateDb (Database db, int version) async{
//
//
//
//     await db.execute('''
//
//       CREATE TABLE 'notes' (
//
//       'id' INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
//
//       'note' TEXT NOT NULL,
//         )
//
//
//     ''');
//
//
//     print('1- Create Data Base And Table Is Done ');
//   }
//
//   onUpdate(Database, int oldVersion, int newVersion) async{
//
//     print('Upgrade');
//
//   }
//
//
//   // فانكشن التعامل مع الداتا
//
// readData(String sql) async {
//
//     // هنا انا بستدعي الفيوتشر فانكشن اللي عملتها فوق عشان لو الداتا بيز موجودة يجبها لو مش موجودة ينشاها
//
//     Database? mydb = await db;
//
//
//     List<Map> response = await mydb!.rawQuery(sql);
//     return response;
//
//
//
// }
// insertData (String sql) async {
//
//     // هنا انا بستدعي الفيوتشر فانكشن اللي عملتها فوق عشان لو الداتا بيز موجودة يجبها لو مش موجودة ينشاها
//
//     Database? mydb = await db;
//
//
//     int response = await mydb!.rawInsert(sql);
//     return response;
//
//
//
// }
// updateData (String sql) async {
//
//     // هنا انا بستدعي الفيوتشر فانكشن اللي عملتها فوق عشان لو الداتا بيز موجودة يجبها لو مش موجودة ينشاها
//
//     Database? mydb = await db;
//
//
//     int response = await mydb!.rawUpdate(sql);
//     return response;
//
//
//
// }
// deleteData (String sql) async {
//
//     // هنا انا بستدعي الفيوتشر فانكشن اللي عملتها فوق عشان لو الداتا بيز موجودة يجبها لو مش موجودة ينشاها
//
//     Database? mydb = await db;
//
//
//     int response = await mydb!.rawDelete(sql);
//     return response;
//
//
//
// }
//
//
// }


import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {

  static Database? _db ;

  Future<Database?> get db async {
    if (_db == null){
      _db  = await intialDb() ;
      return _db ;
    }else {
      return _db ;
    }
  }


  intialDb() async {
    String databasepath = await getDatabasesPath() ;
    String path = join(databasepath , 'wael.db') ;
    Database mydb = await openDatabase(path , onCreate: _onCreate , version: 3  , onUpgrade:_onUpgrade ) ;
    return mydb ;
  }

  _onUpgrade(Database db , int oldversion , int newversion ) {


    print("onUpgrade =====================================") ;

  }

  _onCreate(Database db , int version) async {
    await db.execute('''
  CREATE TABLE "notes" (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
    "note" TEXT NOT NULL
  )
 ''') ;
    print(" onCreate =====================================") ;

  }

  readData(String sql) async {
    Database? mydb = await db ;
    List<Map> response = await  mydb!.rawQuery(sql);
    return response ;
  }
  insertData(String sql) async {
    Database? mydb = await db ;
    int  response = await  mydb!.rawInsert(sql);
    return response ;
  }
  updateData(String sql) async {
    Database? mydb = await db ;
    int  response = await  mydb!.rawUpdate(sql);
    return response ;
  }
  deleteData(String sql) async {
    Database? mydb = await db ;
    int  response = await  mydb!.rawDelete(sql);
    return response ;
  }


// SELECT
// DELETE
// UPDATE
// INSERT


}

