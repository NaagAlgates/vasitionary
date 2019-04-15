import 'package:flutter/material.dart';

//Hints
const String HINT_SEARCH_TEXT = "தேடு";

//Application Constants
const String APPLICATION_NAME = "சொற்களஞ்சியம்";
const String TITLE_MAIN_PAGE = APPLICATION_NAME;
const String DATE_FORMAT="MM-DD-YYYY";

//Action items label
const String BTN_YES_TEXT = "ஆம்";
const String BTN_NO_TEXT = "இல்லை";
const String BTN_CREATE_TEXT = "உருவாக்கு";

//Display Message text
const String DISPLAY_MESSAGE_NO_WORDS="தயவுசெய்து ஒரு வார்த்தையை உள்ளிடவும்";
const String DISPLAY_2ND_COLUMN_HEADING = "தினம் ஒரு சொல்!";
const String DISPLAY_3RD_COLUMN = "தினம் ஒரு குறள்!";
const String DISPLAY_MENU_2 = "சொற்குவாரி";
const String DISPLAY_MENU_2_DESCRIPTION = "தங்களிடம் உள்ள சொற்களை இங்கே உள்ளீடுக.";

//Constant Colors
Color COLOR_APPBAR=Colors.blueAccent;
const Color COLOR_DISABLED=Colors.grey;
Color COLOR_ENABLED=COLOR_APPBAR;
const Color COLOR_WHITE = Colors.white;
const Color COLOR_BLACK = Colors.black;

Color R1C1 = HexColor("#FC0300");
Color R1C2 = HexColor("#FFAF02");
Color R1C3 = HexColor("#FC0300");

Color R2C1 = HexColor("#9A0098");
Color R2C2 = HexColor("#011B66");
Color R2C3 = HexColor("#9A0098");

Color R3C1 = HexColor("#FFAF02");
Color R3C2 = HexColor("#FC0300");
Color R3C3 = HexColor("#FFAF02");

//Ints
const double FONT_SIZE_REGULAR_15=15.0;
const double FONT_SIZE_REGULAR_20=20.0;
const double FONT_SIZE_HEADING_30=30.0;
const double FONT_SIZE_HEADING_40=40.0;

//Padding
const double PADDING_REGULAR_10 = 10.0;
const double PADDING_REGULAR_15 = 15.0;

//Preference KeyedSubtree

const String PREF_WORD_INDEX = "word_of_the_day";
const String PREF_KURAL_INDEX = "kural_of_the_day";
const String PREF_DATE = "current_date";

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}