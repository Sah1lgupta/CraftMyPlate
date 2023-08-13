import 'dart:async';

import 'package:assignment_2/ui/authentication_screen.dart';
import 'package:assignment_2/ui/bottom_navbar.dart';
import 'package:assignment_2/ui/on_board_screen.dart';
import 'package:assignment_2/ui/phone_number_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/firebase_api.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, }) : super(key: key);



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin  {



  late AnimationController _fadeOutController;
  late AnimationController _fadeInController;
  late AnimationController _slideController;



  late Animation<double> _opacityAnimation1;
  late Animation<double> _opacityAnimation2;
  late Animation<Offset> _slideAnimation;







  double _width = 0.25;
  double _height= 0.14;






  @override
  void initState() {




    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      setState(() {


        _width = MediaQuery.of(context).size.width * 0.00057 ;
        _height=  MediaQuery.of(context).size.height * 0.000143 ;

      });
    });







    _fadeOutController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _fadeInController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _slideController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

  //  _logoSizecontroller = AnimationController(
  //      vsync: this,
 //       duration: Duration(milliseconds: 500),
 //   );



    _opacityAnimation1 = Tween<double>(begin: 1.0, end: 0.0).animate(_fadeOutController);
    _opacityAnimation2 = Tween<double>(begin: 0.0, end: 1.0).animate(_fadeInController);
      _slideAnimation= Tween<Offset>(
        begin: Offset(0, 1),
        end: Offset(0, 0),
      ).animate(CurvedAnimation(parent: _slideController, curve: Curves.bounceInOut));

//    _logoSizeAnimation = Tween<double>(
//      begin: 100.0, // Initial size
//      end: 150.0,   // Size after increment
//    ).animate(CurvedAnimation(parent: _logoSizecontroller, curve: Curves.easeInOut));
  


    _fadeOutController.forward();
    _fadeInController.forward();
    _slideController.forward();






  }

  @override
  void dispose() {
    _fadeOutController.dispose();
    _fadeInController.dispose();
    _slideController.dispose();
  //  _logoSizecontroller.dispose();

    super.dispose();
  }







  @override
  Widget build(BuildContext context) {



    checkUserAuthentication(context);




    return   Center(
        child: Stack(
          children:[
            Container(
              width:  MediaQuery.of(context).size.width *1,
              height:  MediaQuery.of(context).size.height *1,
                child: RiveAnimation.asset('assets/splash_bg.riv',fit: BoxFit.cover,),
                ),

            Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

              Center(
                child: AnimatedContainer(
                  duration:  Duration(milliseconds: 800),
                  child: Container(
                      width:   MediaQuery.of(context).size.width *_width,
                      height:  MediaQuery.of(context).size.height * _height,

                      child: Image.asset(width: MediaQuery.of(context).size.width *0.004,
                        height:MediaQuery.of(context).size.height * 0.004,
                        'assets/images/Logo.png',fit: BoxFit.cover,)),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height *0.03,),


              Stack(
                children: [

                  Center(
                    child: Container(
                        width:  MediaQuery.of(context).size.width *0.47,
                        height:  MediaQuery.of(context).size.height *0.04,

                        child: FadeTransition(
                          opacity:   _opacityAnimation1,
                          child: Image.asset(width: MediaQuery.of(context).size.width *0.001,
                            height:MediaQuery.of(context).size.height * 0.01,
                            'assets/images/Welcome.png',fit: BoxFit.cover,),
                        )),
                  ),

                  SlideTransition(
                    position: _slideAnimation,
                    child: Center(
                      child: Container(
                          width:  MediaQuery.of(context).size.width *0.6,
                          height:  MediaQuery.of(context).size.height *0.067,

                          child: FadeTransition(
                            opacity:  _opacityAnimation2,
                            child: Image.asset(width: MediaQuery.of(context).size.width *0.001,
                              height:MediaQuery.of(context).size.height * 0.01,
                              'assets/images/TAGLINE.png',fit: BoxFit.cover,),
                          )),
                    ),
                  ),



                ],
              ),



            ],),


          ]
        ));
  }


  Widget splashScreen1(){

    return  Center(
        child: Container(

            child: Image.asset(width: MediaQuery.of(context).size.width *1,
              height:MediaQuery.of(context).size.height * 1,
              '',fit: BoxFit.cover,)));
  }

  Widget splashScreen2(){

    return  Center(
        child: Container(

            child: Image.asset(width: MediaQuery.of(context).size.width *1,
              height:MediaQuery.of(context).size.height * 1,
              '',fit: BoxFit.cover,)));
  }

  Future<void> checkUserAuthentication(BuildContext context) async {

    FirebaseAuth _auth = FirebaseAuth.instance;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn =await prefs.getBool('is_logged_in') ?? false;



    Future.delayed(Duration(milliseconds: 2600), () {


      print('Is Logged In: $isLoggedIn');

      isLoggedIn==true ?
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomNavbar())):
      Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => OnBoardScreen()),);












    });

  }

}



