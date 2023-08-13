import 'package:flutter/material.dart';

class HomePageFooter extends StatelessWidget {
  const HomePageFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          //  Text('Start Crafting',style: TextStyle(fontFamily: 'Poppins',color: Colors.black, fontSize: 20,fontWeight: FontWeight.w500),),
          ],
        ),
        Image.asset('assets/images/footer/how_it_works.png'),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(maxLines: 2,'Delicious food with professional service!',style: TextStyle(fontFamily: 'Poppins',color: Colors.black, fontSize: 30,fontWeight: FontWeight.w600),),
        ),
      SizedBox(height: 200,)

      ],
    );
  }
}
