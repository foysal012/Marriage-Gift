import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sqflite/utils/utils.dart';

class SimpleTask extends StatefulWidget {
  const SimpleTask({Key? key}) : super(key: key);

  @override
  State<SimpleTask> createState() => _SimpleTaskState();
}

class _SimpleTaskState extends State<SimpleTask> {

  Box friendBox = Hive.box("man");
  String? name;

  void addName() async{
    await friendBox.put("name", "Foysal");
  }

  void readName() async{
    setState(() {
      name = friendBox.get("name");
    });
  }

  void updateName() async{
    await friendBox.put("name", "Joarder");
  }

  void deleteName() async{
    await friendBox.delete("name");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[300]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Hive Simple Functionality"),

            Text(name.toString()),

            SizedBox(
              height: 10,
            ),

            MaterialButton(onPressed: addName,
            child: Text("Add Name"),
            ),
            MaterialButton(onPressed: readName,
            child: Text("Read Name"),
            ),
            MaterialButton(onPressed: updateName,
            child: Text("Update Name"),
            ),
            MaterialButton(onPressed: deleteName,
            child: Text("Delete Name"),
            )
        ],),
      ),
    );
  }
}
