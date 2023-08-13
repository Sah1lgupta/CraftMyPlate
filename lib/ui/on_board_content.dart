

import 'package:assignment_2/ui/phone_number_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({Key? key, required this.image, required this.title, required this.description}) : super(key: key);

  final image;
  final title;
  final description;



  @override
  Widget build(BuildContext context) {
    return  Column(

      crossAxisAlignment: CrossAxisAlignment.center,

      children: [

        SizedBox(height: MediaQuery.of(context).size.height  * 0.04,),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [

            Padding(
              padding: const EdgeInsets.only(right: 30,top: 20),
              child: Container(
                width:  MediaQuery.of(context).size.width  * 0.16,
                height:  MediaQuery.of(context).size.height  * 0.03,
                child: ElevatedButton(onPressed: (){ Navigator.push(context, CupertinoPageRoute(builder: (context)=>SendOTPScreen()));},
                    child: Text('Skip', style: TextStyle(color: Color(0xFF9E0DEF)),),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFE7CDF5), ),
                ),
              ),
            ),
        ],),

        SizedBox(height: MediaQuery.of(context).size.height  * 0.1,),



        Container(
          height: MediaQuery.of(context).size.height * 0.3,
            child: RiveAnimation.asset('${image}',fit: BoxFit.fitHeight,)),

       // SizedBox(height: MediaQuery.of(context).size.height  * 0.02,),

        Text('${title}', style: TextStyle(fontSize: MediaQuery.of(context).size.aspectRatio  * 50,fontWeight: FontWeight.w500),),

     //   SizedBox(height: MediaQuery.of(context).size.height  * 0.015,),

        Padding(
          padding: const EdgeInsets.all(8),
          child: Text('${description}',textAlign: TextAlign.center, style: TextStyle(fontSize: MediaQuery.of(context).size.aspectRatio  * 35,fontWeight: FontWeight.w300),),
        ),


      ],
    );
  }
}
