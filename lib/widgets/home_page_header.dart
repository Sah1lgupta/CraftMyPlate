import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePageHeader extends StatefulWidget {

   HomePageHeader({super.key, });

  @override
  State<HomePageHeader> createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader> {


   String? username;

   String? emailID;

   String? location;




   @override
   void initState() {



     retrieveData();

     super.initState();


   }

  Future<void> retrieveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve values using keys
    String? user = prefs.getString('username');
    String?  email = prefs.getString('emailID');
    String?  locationn = prefs.getString('location');


    setState(() {

      username=user;
      emailID=email;
      location=locationn;


    });


    print('Username: $username');
    print('emailID: $emailID');
    print('location: $location');


  }

  @override
  Widget build(BuildContext context) {


    return  Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hi $username!',style: TextStyle(fontSize: 27,fontFamily: 'Poppins',color: Color(0xFF600D8D),fontWeight: FontWeight.w600),),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 15,),
                  Text('Current Location',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w100),),
                  SizedBox(height: 4,),
                  Row(
                    children: [
                      Icon(Icons.location_pin),
                      SizedBox(width: 9,),
                      Text('$location',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.w600),),
                    ],
                  ),
                ],
              ),

              Column(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_outline,color: Color(0xFF600D8D))),
                  Text('How it works?'),
                ],
              )
            ],),
        ],
      ),
    );
  }
}
