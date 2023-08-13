
import 'package:assignment_2/ui/bottom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../resources/custom_colors.dart';
import '../widgets/custom_textfield.dart';

class PersonInfo extends StatelessWidget {
   PersonInfo({Key? key}) : super(key: key);


  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _locationController = TextEditingController();





  @override
  Widget build(BuildContext context) {





    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
       leading: IconButton(
         icon: Padding(
           padding: const EdgeInsets.only(left: 12),
           child: Icon(Icons.arrow_back_ios,color: Colors.black,),
         ),
         onPressed: () {
           Navigator.of(context).pop();
         },
       ),

      ),
      body: personInfo(context),
    );
  }

  Widget personInfo(BuildContext context ){




    return Column(

      children: [

        SizedBox(height: 30,),

        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Just a step away!',style: TextStyle(fontFamily: "Poppins",fontSize: 25,fontWeight: FontWeight.w600),),
            ],
          ),
        ),
        SizedBox(height: 30,),

        Column(
          children: [


            MyTextFieldWidget(textEditingController: _nameController, label: 'Full Name', hint: 'Enter Your Full Name', obscureText: false,),
            SizedBox(height: 16),
            MyTextFieldWidget(textEditingController: _emailController, label: 'Email ID', hint: 'Enter Your Email ID', obscureText: false,),
            SizedBox(height: 16),
            MyTextFieldWidget(textEditingController: _locationController, label: 'Location', hint: 'Enter Your city', obscureText: false,),
            SizedBox(height: 16),

          ],
        ),


      Spacer(),


        Column(
          children: [

            Container(
              width: 340,
              height: 50,
              child: ElevatedButton(
                onPressed:() {

                  if( _emailController.text.isNotEmpty && _nameController.text.isNotEmpty &&  _locationController.text.isNotEmpty){storeData(); Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>BottomNavbar())); } else if(_emailController.text.toString().isEmpty || _nameController.text.toString().isEmpty || _locationController.text.toString().isEmpty){  showValidationToast();}

                  },

                child: Text("Let's Start",style: TextStyle(fontFamily: 'Poppins'),),
                style: ElevatedButton.styleFrom(backgroundColor: CustomColors.purple),
              ),
            ),
            SizedBox(height: 25),


          ],
        ),




      ],
    );
  }


  showValidationToast() {

    Fluttertoast.showToast(
      msg: 'Please fill the details.',
      toastLength: Toast.LENGTH_SHORT, // You can use Toast.LENGTH_LONG for a longer duration.
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1, // Time duration for iOS and web (in seconds).
      backgroundColor: Colors.grey[700],
      textColor: Colors.white,
      fontSize: 16.0,
    );

  }

  Future<void> storeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    prefs.setString('username', '${_nameController.text}');
    prefs.setString('emailID', '${_emailController.text}');
    prefs.setString('location', '${_locationController.text}');

    print('Data stored in shared preferences.');
  }
}
