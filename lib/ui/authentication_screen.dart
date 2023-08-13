import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/firebase_api.dart';
import '../provider/auth_provider.dart';
import '../resources/custom_colors.dart';
import '../widgets/custom_textfield.dart';

class EmailAuthScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<EmailAuthScreen> {






  @override
  Widget build(BuildContext context) {

    final myToggleModel = Provider.of<MyToggleModel>(context, listen: true);
    return  Scaffold(
        resizeToAvoidBottomInset:false,

      backgroundColor: CustomColors.litegray,


      body: Stack(
        children: [



          Positioned(child: Image.asset('assets/images/authheader/auth_header.png',fit: BoxFit.cover,scale: 0.9,),),

          Positioned(left: MediaQuery.of(context).size.width * 0.3,top: MediaQuery.of(context).size.height * 0.2,child: Text('CraftMyPlate',style: TextStyle(color: Colors.white,fontSize: 23,fontFamily: 'Poppins'),)),
          Positioned(left: MediaQuery.of(context).size.width * 0.07,top: MediaQuery.of(context).size.height * 0.88,child: Container(width: 320,   child: Text(textAlign: TextAlign.center,maxLines: 2,'By continuing you agree to our Terms of Service and Priacy Policy',style: TextStyle(color: Colors.grey,fontSize: 15,fontFamily: 'Poppins'),))),


          Positioned(top: MediaQuery.of(context).size.height * 0.06,left: MediaQuery.of(context).size.width * 0.39,child: Image.asset('assets/images/Logo.png',fit: BoxFit.cover,scale: 1.2,),),
          myToggleModel.isToggled!=false? loginWidget(myToggleModel) :  signinWidget(myToggleModel),
          Positioned(left: MediaQuery.of(context).size.width * 0.3,top: MediaQuery.of(context).size.height * 2,child: Text('CraftMyPlate',style: TextStyle(color: Colors.white,fontSize: 23,fontFamily: 'Poppins'),)),
          ],
      )
    //
    );
  }






  Widget signinWidget(MyToggleModel myToggleModel){




    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Column(
    //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 330,),

        Column(
          children: [



            MyTextFieldWidget(textEditingController: _emailController, label: 'Email', hint: 'Enter Your Email', obscureText: false,),
            SizedBox(height: 16),
            MyTextFieldWidget(textEditingController: _passwordController, label: 'Password', hint: 'Enter Your Password', obscureText: true,),
            SizedBox(height: 16),
          ],
        ),



        Column(
          children: [

            Container(
              width: 340,
              height: 50,
              child: ElevatedButton(
                onPressed:() { if( _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){ storeData(); FirebaseAPIs.signInWithEmailAndPassword(context,_emailController, _passwordController); } else if(_emailController.text.toString().isEmpty || _passwordController.text.toString().isEmpty){  showValidationToast();}},

                child: Text('Sign In',style: TextStyle(fontFamily: 'Poppins'),),
                style: ElevatedButton.styleFrom(backgroundColor: CustomColors.purple),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account? ',style: TextStyle(fontFamily: 'Poppins',color: CustomColors.darkgray),),
                InkWell(
                  child: Text(' Login',style: TextStyle(color: CustomColors.purple,fontFamily: 'Poppins'),),
                  onTap: (){
                   myToggleModel.toggle();
                 },),
              ],
            )

          ],
        ),




      ],
    );
  }




  Widget loginWidget(MyToggleModel myToggleModel){


    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Column(
     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        Column(
          children: [
            SizedBox(height: 330,),

            MyTextFieldWidget(textEditingController: _emailController, label: 'Email', hint: 'Enter Your Email', obscureText: false,),
            SizedBox(height: 16),
            MyTextFieldWidget(textEditingController: _passwordController, label: 'Password', hint: 'Enter Your Password', obscureText: true,),
            SizedBox(height: 16),
          ],
        ),

        Column(
          children: [

            Container(
              width: 340,
              height: 50,
              child: ElevatedButton(
                onPressed:() {if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){  storeData(); FirebaseAPIs.logInWithEmailAndPassword(context,_emailController, _passwordController); } else if(_emailController.text.toString().isEmpty || _passwordController.text.toString().isEmpty){ showValidationToast();}},
                child: Text('Log In',style: TextStyle(fontFamily: 'Poppins'),),
                style: ElevatedButton.styleFrom(backgroundColor: CustomColors.purple),
              ),
            ),

            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New Here? ',style: TextStyle(fontFamily: 'Poppins',color: CustomColors.darkgray),),
                InkWell(
                  child: Text(' Signup',style: TextStyle(color: CustomColors.purple,fontFamily: 'Poppins'),),
                  onTap: (){
                    myToggleModel.toggle();
                  },),
              ],
            )

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

    // Store a value with a key

    prefs.setBool('is_logged_in', true);

    print('Data stored in shared preferences.');
  }



}
