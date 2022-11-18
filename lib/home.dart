import 'package:flutter/material.dart';
import 'package:waelsql/sql.dart';

class homePage extends StatefulWidget {

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {


  SqlDb sqlDb = SqlDb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('Notes Tasks To Do '),

      ),

          body: Column(

            children: [

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(

                        decoration: BoxDecoration(

                          color: Colors.green,

                          borderRadius: BorderRadius.circular(8.0),

                        ),
                        child: MaterialButton(

                          onPressed: () async {

                            int response = await sqlDb.insertData("INSERT INTO 'notes' ('note') VALUES ('الملاحظة السادسة') ");

                            print(response);

                          },

                        child: Text('Insert Data',
                        style: TextStyle(

                          fontSize: 16.0,
                          color: Colors.white,

                        ),
                        ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(

                        decoration: BoxDecoration(

                          color: Colors.blue,

                          borderRadius: BorderRadius.circular(8.0),

                        ),
                        child: MaterialButton(onPressed: () async {
                          
                          
                         List<Map> response =  await sqlDb.readData("SELECT * FROM 'notes' ");
                         print(response);
                          
                        },

                        child: Text('Read Data',
                        style: TextStyle(

                          fontSize: 16.0,
                          color: Colors.white,

                        ),
                        ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(

                        decoration: BoxDecoration(

                          color: Colors.red,

                          borderRadius: BorderRadius.circular(8.0),

                        ),
                        child: MaterialButton(

                          onPressed: () async {

                            int response = await sqlDb.deleteData("DELETE FROM 'notes' WHERE id = 6 ");

                            print(response);

                          },

                        child: Text('Delete Data',
                        style: TextStyle(

                          fontSize: 16.0,
                          color: Colors.white,

                        ),
                        ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(

                        decoration: BoxDecoration(

                          color: Colors.purple,

                          borderRadius: BorderRadius.circular(8.0),

                        ),
                        child: MaterialButton(onPressed: () async {


                         int response =  await sqlDb.updateData("UPDATE 'notes' SET 'note' = 'الملاحظة الاولي' WHERE id = 2 ");
                         print(response);

                        },

                        child: Text('Update Data',
                        style: TextStyle(

                          fontSize: 16.0,
                          color: Colors.white,

                        ),
                        ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),


            ],



          ),

    );
  }
}
