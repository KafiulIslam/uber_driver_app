import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'color.dart';


const thirtyTwoSpacerVertical =  SizedBox(
  height: 32,
);
const thirtyTwoSpacerHorizontal =  SizedBox(
  width: 32,
);

const primarySpacerVertical = SizedBox(height: 16,);
const primarySpacerHorizontal = SizedBox(width: 16,);

const eightVerticalSpace = SizedBox(height: 8.0,);
const eightHorizontalSpace = SizedBox(width: 8.0,);

final outline = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: const BorderSide(color: deepAss),
);

final FirebaseAuth fAuth = FirebaseAuth.instance;
  User? currentFirebaseUser;