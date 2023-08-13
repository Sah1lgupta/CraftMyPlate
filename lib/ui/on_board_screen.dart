import 'package:assignment_2/ui/authentication_screen.dart';
import 'package:assignment_2/ui/bottom_navbar.dart';
import 'package:assignment_2/ui/on_board_content.dart';
import 'package:assignment_2/ui/phone_number_auth.dart';
import 'package:flutter/material.dart';
import '../datamodels/on_board_content_model.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {



  int pageIndex =0;

  late PageController pageController;

  final List<Onboard> onBoardContent =[

    Onboard( image: "assets/on_board_1.riv",
        title: "Create Your Own Plate",
        description: "Create unforgettable memories with our unique feature to curate your favorite cuisines and food, tailored to your special occasion."
    ),

    Onboard( image: "assets/on_board_2.riv",
        title: "Exquisite Catering",
        description: "Experience culinary artistry like never before with our innovative and exquisite cuisine creations"
    ),

    Onboard( image: "assets/on_board_3.riv",
        title: "Personal Order Executive",
        description: "Embark on a personalized culinary journey with our dedicated one-to-one customer support, ensuring a seamless and satisfying experience every step of the way."
    ),

  ];



  @override
  void initState() {
    // TODO: implement initState
    pageController= PageController(initialPage:0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged:(index) {

                      setState(() {
                        pageIndex=index;
                      });
                    },
                    itemCount: onBoardContent.length,
                    controller: pageController,
                    itemBuilder: (BuildContext context, int index) => OnBoardContent(image:onBoardContent[index].image, title:onBoardContent[index].title , description: onBoardContent[index].description,),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height  * 0.04,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(onBoardContent.length, (index) => Padding(
                      padding: const EdgeInsets.all(4),
                      child: DotIndicator(isActive: index==pageIndex),
                    ))
                  ],),



                SizedBox(height: MediaQuery.of(context).size.height  * 0.02,),

                CircleAvatar(

             //       width: MediaQuery.of(context).size.width * 0.4,
             //   height: MediaQuery.of(context).size.height * 0.07,
                  radius: MediaQuery.of(context).size.aspectRatio  * 60,
                  backgroundColor: Color(0xFFC593E3),
               //   color: Color(0xFFC593E3),

                  child: ElevatedButton(onPressed: (){

                    pageController.nextPage(duration: Duration(microseconds: 300), curve: Curves.ease);

                    pageIndex==2? Navigator.push(context, MaterialPageRoute(builder: (context)=>SendOTPScreen())): null;
                  },
                    child: Icon(Icons.arrow_right,),
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF600D8D),shape: CircleBorder() ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height  * 0.04,),
              ],
            ),
      ),
    );
  }
}




class DotIndicator extends StatelessWidget{


  final bool isActive;

  const DotIndicator({super.key,  this.isActive=false});
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width  * 0.075,
      height: MediaQuery.of(context).size.height  * 0.01,

      decoration: BoxDecoration(
          color:  isActive ? Color(0xFF600D8D)
              : Color(0xFFA07CB4),
          borderRadius: BorderRadius.all(Radius.circular(50))
      ),
    );

  }



}