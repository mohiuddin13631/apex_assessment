
import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';

myStyle(double size,[Color? clr, FontWeight? fw,]){
  return GoogleFonts.roboto(
    fontSize: size,
    color: clr,
    fontWeight: fw,
  );
}