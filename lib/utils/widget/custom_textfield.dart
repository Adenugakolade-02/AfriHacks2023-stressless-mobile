import 'package:flutter/material.dart';

// ignore: must_be_immutable
class kTextFormField extends StatefulWidget {
  final String title;
  final Widget? prefixIcon;
  final TextEditingController controller;
  bool isPassword;
  String? Function(String?)? validator;
  int? maxLines=1;
  kTextFormField({super.key, required this.title, required this.prefixIcon, required this.controller, this.isPassword=false, this.validator, this.maxLines});

  @override
  State<kTextFormField> createState() => _kTextFormFieldState();
}

class _kTextFormFieldState extends State<kTextFormField> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: const TextStyle(fontFamily: "Urbanist", fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF4B4D4C)),),
        const SizedBox(height: 8,),
        TextFormField(
          decoration: InputDecoration(
            enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(1000),
              borderSide: const BorderSide(
                color: Color(0xFFDADADA),
                width: 1,
            )
          ),
            focusedBorder:   OutlineInputBorder(
              borderRadius: BorderRadius.circular(1000),
              borderSide: const BorderSide(
                color: Color(0xFFC9EBDF),
                width: 1
              )
            ),
            // disabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(1000),
            //   borderSide: const BorderSide(
            //     color: Color(0xFFDADADA),
            //     width: 1
            //   )
            // ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8,),
              child : widget.prefixIcon
              ),
            prefixIconColor: const Color(0xFF4B4D4C),
            prefixIconConstraints: const BoxConstraints(maxHeight: 32, maxWidth: 32),
            suffixIcon: widget.isPassword 
            ? IconButton(
              onPressed: (){
                setState(() {
                  showPassword = !showPassword;
                });
              }, 
              icon: Icon(showPassword? Icons.visibility:Icons.visibility_off, color: const Color(0xFFC9C7C5),)
            )
            : null
          ),
          cursorColor: const Color(0xFFC9EBDF),
          controller: widget.controller,
          validator: widget.validator,
          maxLines: widget.maxLines,
        ),
      ],
    );
  }
}