import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kPrimary = Color(0XFFFBC740);
const Color kTextPrimary = Color(0XFF1b1b1b);
const Color kMuted = Color(0XFFCCCCCC);
const Color kGhost = Color(0XFFEEEEEE);
const Color kWhite = Color(0XFFFFFFFF);

themeData(context) => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      primaryColor: kPrimary,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
    );
