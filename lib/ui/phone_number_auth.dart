
import 'package:assignment_2/ui/phone_auth_verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';


import '../resources/custom_colors.dart';
import 'authentication_screen.dart';


class SendOTPScreen extends StatefulWidget {
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<SendOTPScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = '';
  var phoneNumber;
  bool toggle1=false;


  void _verifyPhoneNumber() async {

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        print('Phone number verified and signed in');
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          this.verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    ).then((value) => toggle1=true);


    Future.delayed(Duration(seconds: 5), () {

        Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (context) =>  VerificationScreen(verificationId: verificationId, phoneNumber: phoneNumber,),),);


    });
  }


  @override
  Widget build(BuildContext context) {

    return  signInWidget(context) ;
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

  signInWidget(BuildContext context) {

    return  Scaffold(
        resizeToAvoidBottomInset:false,
        backgroundColor: CustomColors.litegray,

        body: Stack(
          children: [
            Positioned(child: Image.asset('assets/images/authheader/auth_header.png',fit: BoxFit.cover,scale: 0.9,),),
            Positioned(left: MediaQuery.of(context).size.width * 0.31,top: MediaQuery.of(context).size.height * 0.2,child: Text('CraftMyPlate',style: TextStyle(color: Colors.white,fontSize: 23,fontFamily: 'Poppins'),)),
            Positioned(left: MediaQuery.of(context).size.width * 0.07,top: MediaQuery.of(context).size.height * 0.88,child: Container(width: 320,   child: Text(textAlign: TextAlign.center,maxLines: 2,'By continuing you agree to our Terms of Service and Priacy Policy',style: TextStyle(color: Colors.grey,fontSize: 15,fontFamily: 'Poppins'),))),
            Positioned(top: MediaQuery.of(context).size.height * 0.06,left: MediaQuery.of(context).size.width * 0.39,child: Image.asset('assets/images/Logo.png',fit: BoxFit.cover,scale: 1.2,),),
            Positioned(left: MediaQuery.of(context).size.width * 0.3,top: MediaQuery.of(context).size.height * 2,child: Text('CraftMyPlate',style: TextStyle(color: Colors.white,fontSize: 23,fontFamily: 'Poppins'),)),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width:  MediaQuery.of(context).size.width * 1,
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Login or Signup',style: TextStyle(color: Colors.grey,fontSize: MediaQuery.of(context).size.aspectRatio * 40,fontFamily: 'Poppins'),),
                    ],
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,

                  ),

                  Container(
                    width: MediaQuery.of(context).size.width *0.87,
                    child: InternationalPhoneNumberInput(

                      //textFieldController: _phoneNumberController,
                      onInputChanged: (PhoneNumber number) {
                        phoneNumber = number.phoneNumber!;
                      },
                      inputDecoration: InputDecoration(

                        labelText: 'Phone Number',
                        border: OutlineInputBorder(),

                      ),
                      selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.DIALOG,
                      ),
                    ),
                  ),

                  SizedBox(
                    height:  MediaQuery.of(context).size.height * 0.01,
                  ),


                  Container(
                    width: MediaQuery.of(context).size.width *0.87,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: phoneNumber !=null? _verifyPhoneNumber   : null,

                      child: Text('Continue',style: TextStyle(fontFamily: 'Poppins'),),
                      style: ElevatedButton.styleFrom(backgroundColor: CustomColors.purple),
                    ),
                  ),


                  SizedBox(
                    height:  MediaQuery.of(context).size.height * 0.01,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Login or Signup with ',style: TextStyle(color: Colors.grey,fontSize: MediaQuery.of(context).size.aspectRatio * 30,fontFamily: 'Poppins'),),

                      SizedBox(
                        height:  MediaQuery.of(context).size.width * 0.01,
                      ),

                      InkWell(
                        onTap: (){Navigator.push(context, CupertinoPageRoute(builder: (context)=>EmailAuthScreen()));},
                          child: Text('Gmail',style: TextStyle(color: CustomColors.purple,fontSize: MediaQuery.of(context).size.aspectRatio * 30,fontFamily: 'Poppins'),)),

                    ],
                  ),

                ],
              ),
            ),
          ],
        )
      //
    );







  }

}




