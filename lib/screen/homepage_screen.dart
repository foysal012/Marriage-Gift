
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:marriage_gift/model/contact_model_info.dart';
import 'package:marriage_gift/screen/add_new_user_info.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  Box giftBox = Hive.box("gift");

  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController giftOrMoneyController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [

              SizedBox(
                height: height * 0.05,
              ),

              Text("All gift Records",
              style: GoogleFonts.singleDay(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25
              ),
              ),

              Expanded(
                // child: FutureBuilder(
                //     future: MyDBHelper.readContactInfo(),
                //     builder: (BuildContext context, AsyncSnapshot<List<ContactInfo>>snapshot){
                //       if(!snapshot.hasData){
                //         return Center(
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               CircularProgressIndicator(color: Colors.pink,),
                //               Text("Loading...",
                //               style: GoogleFonts.lobster(
                //                 fontStyle: FontStyle.italic,
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 25,
                //                 letterSpacing: 4,
                //               ),
                //               )
                //             ],
                //           ),
                //         );
                //       }
                //       else{
                //         return snapshot!.data!.isEmpty? Center(
                //           child: Column(
                //             children: [
                //               Text("No Data Found",
                //                 style: GoogleFonts.lobster(
                //                   fontStyle: FontStyle.italic,
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 25,
                //                   letterSpacing: 4,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ) :
                //             ListView(
                //             children: snapshot!.data!.map((e) {
                //               print(e.name);
                //               return Center(
                //                 child: ListTile(
                //                   leading: Text(e.slNo.toString()),
                //                   title: Text("${e.name}"),
                //                   subtitle: Text("${e.giftOrMoney}"),
                //                   trailing: Text("${e.gender}"),
                //               ),);
                //             }).toList(),
                //             );
                //       }
                //     }
                // ),
                child: ValueListenableBuilder(
                    valueListenable: giftBox.listenable(),
                    builder: (context, Box box, widget){
                      if(box.isEmpty){
                        return Center(child: Text("No Data Found"));
                      } else{
                        return ListView.builder(
                          shrinkWrap: true,
                            reverse: false,
                            scrollDirection: Axis.vertical,
                            itemCount: box.length,
                            itemBuilder: (context, index){
                            var data = box.values.toList().cast<ContactModelInfo>();
                            return Slidable(
                              endActionPane: ActionPane(

                                dismissible: DismissiblePane(onDismissed: () {

                                },),

                                  motion: ScrollMotion(),

                                  children: [
                                    SlidableAction(
                                      onPressed: (context){
                                        updateContactInfo(
                                            data[index],
                                            data[index].name,
                                            data[index].gender,
                                            data[index].giftOrMoney,
                                        );
                                      },
                                      backgroundColor: Color(0xFF21B7CA),
                                      foregroundColor: Colors.white,
                                      icon: Icons.edit,
                                      label: 'Edit',
                                    ),
                                    SlidableAction(
                                      onPressed: (context) {
                                        deleteContactInfo(data[index]);
                                      },
                                      backgroundColor: Color(0xFFFE4A49),
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    ),
                                  ],
                              ),
                              startActionPane: ActionPane(

                                dismissible: DismissiblePane(onDismissed: () {

                                },),

                                motion: ScrollMotion(),

                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      deleteContactInfo(data[index]);
                                    },
                                    backgroundColor: Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                  SlidableAction(
                                    onPressed: (context){
                                      updateContactInfo(
                                        data[index],
                                        data[index].name,
                                        data[index].gender,
                                        data[index].giftOrMoney,
                                      );
                                    },
                                    backgroundColor: Color(0xFF21B7CA),
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit_sharp,
                                    label: 'Edit',
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff0f80b1),
                                    ),
                                    child: Center(child: Text("${index}",
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 18
                                      ),
                                    ))),
                                title: Text(data[index].name,
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 18
                                  ),
                                ),
                                subtitle: Text(data[index].gender,
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black45,
                                      fontSize: 16
                                  ),
                                ),
                                trailing: Text(data[index].giftOrMoney,
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 16
                                  ),
                                ),
                              ),
                            );
                            }
                        );
                      }
                    }
                ),
              ),
            ],
          )

        ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNewUserInfo()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  //update record
  Future updateContactInfo(ContactModelInfo contactModelInfo, String name, String gender, String giftOrMoney) async{
    nameController.text = name;
    genderController.text = gender;
    giftOrMoneyController.text = giftOrMoney;
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Edit User Data"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 10,),

                TextFormField(
                  controller: genderController,
                  decoration: InputDecoration(
                    hintText: "Gender",
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 10,),

                TextFormField(
                  controller: giftOrMoneyController,
                  decoration: InputDecoration(
                    hintText: "GiftOrMoney",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),

            actions: [

              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel")
              ),

              TextButton(
                  onPressed: (){
                    if(nameController.text != null && genderController.text != null && giftOrMoneyController.text != null){

                      contactModelInfo.name = nameController.text;
                      contactModelInfo.gender = genderController.text;
                      contactModelInfo.giftOrMoney = giftOrMoneyController.text;

                      contactModelInfo.save();

                      nameController.clear();
                      genderController.clear();
                      giftOrMoneyController.clear();
                    }
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Updated Data Successfuly")));
                  },
                  child: Text("Update")
              ),
            ],
          );
        }
    );

  }

  // delete record
  Future deleteContactInfo(ContactModelInfo contactModelInfo) async{
    await contactModelInfo.delete();
  }
}
