import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

abstract class AppStyle {
  //reg (Regular): fontWeight: FontWeight.w400
  // med (Medium): fontWeight: FontWeight.w500
  // smb (SemiBold): fontWeight: FontWeight.w600
  // bold (Bold): fontWeight: FontWeight.w700

  // Size 36
  static final TextStyle med36White = GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: AppColor.white,
      fontSize: 36,
      fontWeight: FontWeight.w500,
    ),
  );

  static final TextStyle bold36White = GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: AppColor.white,
      fontSize: 36,
      fontWeight: FontWeight.w700,
    ),
  );


  // Size 24
  static final TextStyle bold24White = GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: AppColor.white,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
  );

  // Size 20
  static final TextStyle reg20Black = GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: AppColor.black,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  );

  static final TextStyle reg20White = GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: AppColor.white,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  );

  static final TextStyle reg20LightBlack = GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: AppColor.lightBlack,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  );

  static final TextStyle bold20Yellow = GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: AppColor.yellow,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  );

  static final TextStyle bold20White = GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: AppColor.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  );

  static final TextStyle bold20Grey = GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: AppColor.grey,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  );

  static final TextStyle smb20White = GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: AppColor.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  );

  static final TextStyle smb20Black = GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: AppColor.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  );

  static final TextStyle smb20Yellow = GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: AppColor.yellow,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  );

  // Size 16
    static final TextStyle reg16White = GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: AppColor.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  );

  static final TextStyle reg16Yellow = GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: AppColor.yellow,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  );

  static final TextStyle reg16LightBlack = GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: AppColor.lightBlack,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  );

  // Size 14
  static final TextStyle reg14White = GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: AppColor.white,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );

  static final TextStyle reg14Yellow = GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: AppColor.yellow,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );
}
