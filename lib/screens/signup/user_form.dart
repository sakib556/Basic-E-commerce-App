import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/custom_widgets/text_field_1.dart';
class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);
  @override
  _UserFormState createState() => _UserFormState();
}
class _UserFormState extends State<UserForm> {
   late DateTime _dateTime;
   var selected = "choose";
   TextEditingController _nameController = TextEditingController();
   TextEditingController _phoneController = TextEditingController();
   TextEditingController _dobController = TextEditingController();
   TextEditingController _genderController = TextEditingController();
   TextEditingController _ageController = TextEditingController();
 //List<String> gender = ["Male", "Female", "Other"];
   var _genders = ['Male', 'Female', 'Other'];
   var _currentItemSelected = ['Male'];
   Future<void> _selectDateFromPicker(BuildContext context) async {
     final DateTime? picked = await showDatePicker(
         context: context,
         initialDate: DateTime(2010),
         firstDate: DateTime(1950),
         lastDate: DateTime.now()
     );
     if (picked != null)
       setState(() {
         _dobController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
       });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UserForm'),),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(5),
            child:SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text("Submit the form to continue.",style: TextStyle(color: Colors.black,fontSize: 22),),
                  Text("We will not share your information with anyone.",style: TextStyle(fontSize: 14, color: Color(0xFFBBBBBB))),
                  SizedBox(height: 15,),
                  TextField1(label: "Name",hint: "Enter your Name",),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Phone Number',
                        hintText: 'Enter your phone number',
                        hintStyle: TextStyle( color :Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        suffixIcon: IconButton(icon: Icon(Icons.input), onPressed: () {  },)
                    ),
                  ),
                  // DropdownButton<String>(
                  //     items: _genders.map((String dropDownStringItem){
                  //         return DropdownMenuItem<String>(
                  //           value: dropDownStringItem,
                  //           child: Text(dropDownStringItem),
                  //         );
                  //     }).toList(),
                  //     // onChanged: (String newValueSelected){
                  //     //   setState(() {
                  //     //       this._currentItemSelected=newValueSelected;
                  //     //   });
                  //     // },
                  //   value: _currentItemSelected,
                  //     ),
                  TextField(
                    controller: _dobController,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "date of birth",
                      suffixIcon: IconButton(
                          onPressed: () => _selectDateFromPicker(context),
                        icon: Icon(Icons.calendar_today_outlined),
                      ),
                    ),
                  ),
                  ]
                  ),
            ),
              ),
        )
        );

  }
}
