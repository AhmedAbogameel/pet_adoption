import 'package:flutter/material.dart';
import 'package:pet_adoption/constants.dart';

Widget inputField(Function(String) onSubmitted){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 25),
    child: TextField(
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Search',
          isDense: true,
          suffixIcon: Icon(
            Icons.search,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: kPrimaryColor,width: 0.3),
          )
      ),
      onSubmitted: onSubmitted,
    ),
  );
}