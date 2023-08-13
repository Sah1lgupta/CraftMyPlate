
import 'package:assignment_2/widgets/custom_carousel_slider.dart';
import 'package:assignment_2/widgets/custom_searchbar.dart';
import 'package:assignment_2/widgets/home_page_footer.dart';
import 'package:assignment_2/widgets/home_page_header.dart';
import 'package:assignment_2/widgets/main_course_widget.dart';
import 'package:assignment_2/widgets/services_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sticky_headers/sticky_headers.dart';
import '../../widgets/crafting_platter.dart';
import '../../widgets/menu_widget.dart';
import '../../widgets/starter_widget.dart';
import '../../widgets/top_categories_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  ScrollController _scrollController = ScrollController();

  bool _showTextView = true;

  @override
  void initState() {


    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (_showTextView) {
          setState(() {
            _showTextView = false;
          });
        }
      } else {
        if (!_showTextView) {
          setState(() {
            _showTextView = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }




  String? username ;
  String? emailID ;
  String? location ;






@override
  Widget build(BuildContext context) {





    return SafeArea(
      child: AnimatedBuilder(
        animation: _scrollController,
        builder: (BuildContext context, Widget? child) {
         // bool showTextView = _scrollController.position.userScrollDirection == ScrollDirection.reverse;



          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [

                HomePageHeader(),

                CustomCarouselSlider(),

                StickyHeader(
                    header:    Container(
                        height:_showTextView==false? 120: 77,color:Colors.white,child: Column(

                      children: [
                        CustomSearchbar(),
                        _showTextView == false? TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin:_showTextView==false? 0.0 : 1.0, end: _showTextView==false ? 1.0 : 0.0),
                          duration: Duration(milliseconds: 800), // Adjust the duration as needed
                          curve: Curves.easeInOut, // Use a custom curve to control the animation speed
                          builder: (BuildContext context, double value, Widget? child) {
                            return Opacity(
                              opacity: value,
                              child:  Text('Start Crafting Now>>',style: TextStyle(fontFamily: 'Poppins',color: Color(0xFF600D8D), fontSize: 20,fontWeight: FontWeight.w500),),
                            );
                          },
                        ): SizedBox(),
                        //    Text('Start Crafting Now>>',style: TextStyle(fontFamily: 'Poppins',color: Color(0xFF600D8D), fontSize: 20,fontWeight: FontWeight.w500),),


                      ],
                    )),

                    content: Column(
                      children: [
                        CraftingPlatter(),
                        MenuWidget(),
                        TopCategoriesWidget(),
                        Starters(),
                        MainCourseWidget(),
                        ServicesWidget(),
                        HomePageFooter(),
                      ],
                    )),


              ],
            ),
          );

        },

      ),
    );

  }






}



class TextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      curve: Curves.ease,
      duration: Duration(seconds: 800),
      opacity: 1, // Change this to 0.0 to make the TextView disappear initially
      child:  Text('Start Crafting Now>>',style: TextStyle(fontFamily: 'Poppins',color: Color(0xFF600D8D), fontSize: 20,fontWeight: FontWeight.w500),),


    );
  }
}


