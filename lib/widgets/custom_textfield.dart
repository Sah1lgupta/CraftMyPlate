import 'package:flutter/material.dart';

class MyTextFieldWidget extends StatefulWidget {
  final TextEditingController textEditingController ;
  final String label;
  final String hint;
  final bool obscureText;

  const MyTextFieldWidget({super.key, required this.textEditingController, required this.label, required this.hint, required this.obscureText});

  @override
  State<MyTextFieldWidget> createState() => _MyTextFieldWidgetState();
}

class _MyTextFieldWidgetState extends State<MyTextFieldWidget> {



  @override
  Widget build(BuildContext context) {

    setState(() {
      widget.textEditingController.text;
    });

    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Container(
        width: 340,
        height: 50,
        child: TextField(
          onChanged:(value) =>widget.textEditingController.text=value,

          style: TextStyle(fontFamily: 'Poppins'),
          obscureText: widget.obscureText,
           //   controller: widget.textEditingController,
              decoration: InputDecoration(
                labelText: '${widget.label}',
                hintText: '${widget.hint}',
             //   prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
      ),
    );
  }
}
