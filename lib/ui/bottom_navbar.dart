import 'package:assignment_2/ui/screens/home_screen.dart';
import 'package:assignment_2/ui/screens/order_screen.dart';
import 'package:assignment_2/ui/screens/profile_screen.dart';
import 'package:assignment_2/ui/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {



int currentTab=1;

final List<Widget> screens=[

  HomeScreen(),
  WishlistScreen(),
  OrderScreen(),
  ProfileScreen(),
];

Widget currentScreen= HomeScreen();
final PageStorageBucket bucket= PageStorageBucket();









  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(

        onPressed: () {  },
        child: CircleAvatar(radius: 28,backgroundColor:  Color(0xFF600D8D),child: Image.asset('assets/images/Logo.png',width: 40,height: 40,)),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  MaterialButton(
                    minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentTab=1;
                          currentScreen=HomeScreen();
                        });
                      },
                  child: Column(
                    children: [
                      Icon( currentTab==1?Icons.home: Icons.home_outlined,color: currentTab==1? Color(0xFF600D8D) : Colors.grey,),
                      Text('Home',style: TextStyle(color:  currentTab==1? Color(0xFF600D8D) : Colors.grey,),)
                    ],
                  ),),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentTab=2;
                        currentScreen=WishlistScreen();
                      });
                    },
                    child: Column(
                      children: [
                        Icon( currentTab==2? Icons.favorite: Icons.favorite_outline,color: currentTab==2? Color(0xFF600D8D) : Colors.grey,),
                        Text('Wishlist',style: TextStyle(color:  currentTab==2? Color(0xFF600D8D) : Colors.grey,),)
                      ],
                    ),),





                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentTab=3;
                        currentScreen=OrderScreen();
                      });
                    },
                    child: Column(
                      children: [
                        Icon( currentTab==3? Icons.emoji_food_beverage: Icons.emoji_food_beverage_outlined,color: currentTab==3? Color(0xFF600D8D) : Colors.grey,),
                        Text('Order',style: TextStyle(color:  currentTab==3? Color(0xFF600D8D) : Colors.grey,),)
                      ],
                    ),),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentTab=4;
                        currentScreen=ProfileScreen();
                      });
                    },
                    child: Column(
                      children: [
                        Icon( currentTab==4? Icons.person: Icons.person_outline,color: currentTab==4? Color(0xFF600D8D) : Colors.grey,),
                        Text('Profile',style: TextStyle(color:  currentTab==4? Color(0xFF600D8D) : Colors.grey,),)
                      ],
                    ),),





                ],
              ),


            ],
          ),
        ),
      ),

      body: PageStorage(
        bucket: bucket,
        child: currentScreen,),
    );
  }
}
