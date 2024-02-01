import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:marriage_gift/model/contact_model_info.dart';
import 'package:marriage_gift/screen/homepage_screen.dart';
class AddNewUserInfo extends StatefulWidget {
   AddNewUserInfo({Key? key}) : super(key: key);

  //ContactInfo? contactInfo;

  @override
  State<AddNewUserInfo> createState() => _AddNewUserInfoState();
}

class _AddNewUserInfoState extends State<AddNewUserInfo> {

  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController giftOrMoneyController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode genderFocusNode = FocusNode();
  FocusNode giftOrMoneyFocusNode = FocusNode();

  Box giftBox = Hive.box("gift");

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    genderController.dispose();
    giftOrMoneyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [

                SizedBox(
                  height: height * 0.05,
                ),

                Row(
                  children: [
                    
                    IconButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back, color: Colors.black, size: 35,)
                    ),

                    SizedBox(
                      width: width * 0.05,
                    ),
                    
                    Text("Add New User Info",
                      style: GoogleFonts.singleDay(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25
                      ),
                    ),
                  ],
                ),
                
                SizedBox(
                  height: height * 0.05,
                ),

                WidgetTextFromField(
                    slNoController: nameController,
                    slNoFocusNode: nameFocusNode,
                    nameFocusNode: genderFocusNode,
                    labelTxt: "Name",
                    hintTxt: "Foysal Joarder",
                ),

                SizedBox(
                  height: height * 0.05,
                ),

                WidgetTextFromField(
                    slNoController: genderController,
                    slNoFocusNode: genderFocusNode,
                    nameFocusNode: giftOrMoneyFocusNode,
                  labelTxt: "Gender",
                  hintTxt: "Male or Female",
                ),

                SizedBox(
                  height: height * 0.05,
                ),

                WidgetTextFromField(
                    slNoController: giftOrMoneyController,
                    slNoFocusNode: giftOrMoneyFocusNode,
                    nameFocusNode: giftOrMoneyFocusNode,
                  labelTxt: "GiftOrMoney",
                  hintTxt: "Gift Name or Money Amount",
                ),

                SizedBox(
                  height: height * 0.05,
                ),

                InkWell(
                  onTap: () async{
                    if(
                    //widget.contactInfo == null
                    nameController.text !=null && genderController.text !=null && giftOrMoneyController.text !=null
                    ){
                      ContactModelInfo contactModelInfo = ContactModelInfo(
                          name: nameController.text,
                          gender: genderController.text,
                          giftOrMoney: giftOrMoneyController.text
                      );

                      giftBox.add(contactModelInfo);

                      nameController.clear();
                      genderController.clear();
                      giftOrMoneyController.clear();
                    }
                    //Navigator.of(context).popUntil((route) => false);
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added Data Successfuly")));
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff0f80b1),
                    ),
                    child: Center(
                      child: Text("Add",
                        style: GoogleFonts.singleDay(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}

class WidgetTextFromField extends StatelessWidget {
   WidgetTextFromField({
    super.key,
    required this.slNoController,
    required this.slNoFocusNode,
    required this.nameFocusNode,
    required this.labelTxt,
    required this.hintTxt,
  });

   TextEditingController slNoController;
   FocusNode slNoFocusNode;
   FocusNode nameFocusNode;
   String labelTxt;
   String hintTxt;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: slNoController,
      focusNode: slNoFocusNode,
      onFieldSubmitted: (value){
        FocusScope.of(context).requestFocus(nameFocusNode);
      },
      decoration: InputDecoration(
       // border:
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        width: 3,
        color: Color(0xff0f80b1)
      ),
    ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            width: 3,
            color: Color(0xff0f80b1)
          ),
        ),

        labelText: "$labelTxt",
        hintText: "$hintTxt",
      ),
    );
  }
}
