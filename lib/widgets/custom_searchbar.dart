import 'package:flutter/material.dart';

class CustomSearchbar extends StatelessWidget {
   CustomSearchbar({Key? key}) : super(key: key);


  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: customSearchBar(),
    );
  }

  Widget customSearchBar(){

    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: -5,
            blurRadius: 10,
            offset: Offset(0, 3), // changes the position of the shadow
          ),
        ],
      ),
      child: TextField(

        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search food or events',
          hintStyle: TextStyle(height: 3.2,fontFamily: 'Poppins'),
          suffixIcon: Icon(Icons.search,color: Color(0xFF600D8D)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none, // Remove the default border
          ),
          filled: true,
          fillColor: Colors.white, // Set the background color of the search bar
        ),
      ),
    );
  }
}
