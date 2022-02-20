import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const anaRenk = Colors.indigo;

  static const String baslikText = 'Ortalama Hesapla';

  static final TextStyle baslikStyle = GoogleFonts.asap(
      fontSize: 24, fontWeight: FontWeight.w600, color: Colors.indigo);

  static BorderRadius borderRadius = BorderRadius.circular(16);

  static final TextStyle ortalamaGosterBodyStyle = GoogleFonts.asap(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.indigo);

  static final TextStyle ortalamaStyle = GoogleFonts.asap(
      fontSize: 55, fontWeight: FontWeight.w800, color: Colors.indigo);

  static final EdgeInsets dropDownPadding =
      // ignore: prefer_const_constructors
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  // ignore: prefer_const_constructors
  static final yatayPadding8 = EdgeInsets.symmetric(horizontal:8);
}
