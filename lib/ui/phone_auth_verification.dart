
import 'package:assignment_2/ui/person_info.dart';
import 'package:assignment_2/ui/phone_number_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../resources/custom_colors.dart';


class VerificationScreen extends StatefulWidget {
  VerificationScreen( {required  this.verificationId,required  this.phoneNumber});
  
  final verificationId;
  final phoneNumber;


  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<VerificationScreen> {

  TextEditingController otpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  
  var otp;
  bool toggle1=false;
  



  void _signInWithSmsCode(BuildContext context) async {

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otp,


    );

      await _auth.signInWithCredential(credential).then((value) => storeData());
      print('Signed in with SMS code');


      Navigator.of(context).push(
        CupertinoPageRoute(builder: (context) => PersonInfo(),),);



  }

  @override
  Widget build(BuildContext context) {

    return  verificationWidget(context) ;
  }








  
  verificationWidget(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('OTP Verification',style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Icon(Icons.arrow_back_ios,color: Colors.black,),
          ),
          onPressed: () {
            Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>SendOTPScreen()));
          },
        ),

      ),
      body:  Column(
        children: [


          SizedBox(height: 30,),

          Text('We have send a verification code to',style: TextStyle(fontFamily: "Poppins",fontSize: 18,fontWeight: FontWeight.w400),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${widget.phoneNumber!.replaceRange(3, 9, "-******")}',style: TextStyle(fontFamily: "Poppins",fontSize: 18,fontWeight: FontWeight.w800),),
              SizedBox(width: 10,),
              Icon(Icons.verified,color: Colors.green,)
            ],
          ),



          SizedBox(height: 30,),




          Container(
            width: MediaQuery.of(context).size.width *0.7,
            child: PinCodeTextField(
              pinTheme: PinTheme(

                activeColor: Colors.black,
                inactiveColor: Colors.grey,
                selectedColor: Colors.black,
                selectedFillColor: Colors.black,
                inactiveFillColor: Colors.grey,

              ),
              cursorColor: Colors.black,
              appContext: context,
              keyboardType: TextInputType.number,
              autoFocus: true,
              length: 6,
              onChanged: (value) {

                otp=value;
                print('${otp}');
              },
            ),
          ),

          Container(
            width: 340,
            height: 50,
            child: ElevatedButton(
              onPressed:()=> _signInWithSmsCode(context) ,

              child: Text("Submit",style: TextStyle(fontFamily: 'Poppins'),),
              style: ElevatedButton.styleFrom(backgroundColor: CustomColors.purple),
            ),
          ),



        ],
      ),
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
