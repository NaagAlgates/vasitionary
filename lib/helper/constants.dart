import 'package:flutter/material.dart';

//Hints
const String HINT_SEARCH_TEXT = "தேடு";
const String HINT_MEANING_TEXT = "அர்த்தம்: ";
const String HINT_SORKKUVARI_TEXT = "சொற்குவாரி";
const String HINT_SETTINGS_TEXT = "அமைப்புகள்";
const String HINT_INVALID_PASSWORD = "தவறான கடவுச்சொல்";
const String HINT_EMAIL = "மின்னஞ்சல்";
const String HINT_INVALID_EMAIL = "தவறான மின்னஞ்சல்";
const String HINT_LOGIN_FAILED = "உள்நுழைவு தோல்வியடைந்தது";
const String HINT_LOGGIN_IN = "உள்நுழைய முயலுதல் ...";
const String HINT_PASSWORD = "கடவுச்சொல்";
const String HINT_LOGIN = "உள்நுழை";
const String HINT_LOGGING_OUT = "வெளியேற்றுதல் ...";
const String HINT_ENTER_EMAIL = "புதிய கடவுச்சொல் இணைப்பை உருவாக்க மின்னஞ்சலை உள்ளிடவும்.";
const String HINT_REQUESTING_PASSWORD_RESET_FAILED = "கடவுச்சொல் மீட்டமைப்பு தோல்வியடைந்தது, சரியான முகவரியை உள்ளிடுகிறீர்களா?";
const String HINT_REQUESTING_PASSWORD_RESET = "கடவுச்சொல் மீட்டமைப்பைக் கோருகிறது.";
const String HINT_ACCOUNT_CREATION_FAILED = "பதிவு செய்ய முடியவில்லை.";
const String HINT_REGISTERING = "பதிவு செய்கிறது ...";
const String HINT_LOGIN_GOOGLE = "கூகிள் துணையுடன் உள்நுழைக";
const String HINT_SOCIAL_LOGIN = "-------------சமூகவலைதள உள்நுழைவு-------------";

//Application Constants
const String APPLICATION_NAME = "சொற்களஞ்சியம்";
const String TITLE_MAIN_PAGE = APPLICATION_NAME;
const String DATE_FORMAT="MM-DD-YYYY";
const String TITLE_SEARCH_PAGE = "வார்த்தை தேடல்";
const String TITLE_CREATE_ACCOUNT = "கணக்கை உருவாக்குக";
const String TITLE_FORGOT_PASSWORD = "கடவை மறந்தேன்";

//Action items label
const String BTN_YES_TEXT = "ஆம்";
const String BTN_OKAY_TEXT = "சரி";
const String BTN_NO_TEXT = "இல்லை";
const String BTN_CREATE_TEXT = "உருவாக்கு";
const String BTN_LOGOUT_TEXT = "வெளியேறு";

//Display Message text
const String DISPLAY_MESSAGE_NO_WORDS="தயவுசெய்து ஒரு வார்த்தையை உள்ளிடவும்";
const String DISPLAY_2ND_COLUMN_HEADING = "தினம் ஒரு சொல்!";
const String DISPLAY_3RD_COLUMN = "தினம் ஒரு குறள்!";
const String DISPLAY_MENU_2 = "சொற்குவாரி";
const String DISPLAY_PASSWORD_CONDITIONS =
    "* கடவுச்சொல்லில் குறைந்தது ஒரு கேப்பிட்டல் எழுத்து கொண்டிருக்க வேண்டும். \n\n"+
    "* கடவுச்சொல்லில் குறைந்தது ஒரு சிறப்பு எழுத்து கொண்டிருக்க வேண்டும். \n\n"+
    "* கடவுச்சொல்லில் குறைந்தபட்சம் ஒரு எண் எழுத்துக்குறி இருக்க வேண்டும். \n\n"+
    "* கடவுச்சொல்லில் குறைந்தது ஒரு சிறிய எழுத்து கொண்டிருக்க வேண்டும். \n\n"+
    "* கடவுச்சொல் நீளம் குறைந்தது 8 எழுத்துகள் இருக்க வேண்டும்.";
const String DISPLAY_MENU_2_DESCRIPTION = "தங்களிடம் உள்ள சொற்களை இங்கே உள்ளீடுக.";

//Constant Colors
Color COLOR_APPBAR=Colors.blueAccent;
const Color COLOR_DISABLED=Colors.grey;
Color COLOR_ENABLED=COLOR_APPBAR;
const Color COLOR_WHITE = Colors.white;
const Color COLOR_BLACK = Colors.black;
Color APP_COLOR_GREEN =  HexColor("#64A03C");
Color APP_CREATE_ACCOUNT = HexColor("#82E3FF");
Color APP_CREATE_ACCOUNT_ICONS = Colors.lightBlue;

Color R1C1 = HexColor("#FC0300");
Color R1C2 = HexColor("#FFAF02");
Color R1C3 = HexColor("#FC0300");

Color R2C1 = COLOR_APPBAR;
Color R2C2 = HexColor("#011B66");
Color R2C3 = COLOR_APPBAR;

Color R3C1 = HexColor("#FFAF02");
Color R3C2 = HexColor("#FC0300");
Color R3C3 = HexColor("#FFAF02");

//Ints

const int MAX_LINES = 1;
const int MAX_CHAR_COUNT = 30;

//Fonts
const double FONT_SIZE_REGULAR_12=12.0;
const double FONT_SIZE_REGULAR_15=15.0;
const double FONT_SIZE_REGULAR_20=20.0;
const double FONT_SIZE_HEADING_30=30.0;
const double FONT_SIZE_HEADING_40=40.0;

//Padding
const double PADDING_REGULAR_10 = 10.0;
const double PADDING_REGULAR_15 = 15.0;
const double PADDING_REGULAR_20 = 20.0;

//General
const double RADIUS_2 = 2.0;
const double RADIUS_5 = 5.0;

//Dimensions:

const double ICON_SMALL_WIDTH=25.0;
const double ICON_SMALL_HEIGHT=25.0;
const double RADIUS_CIRCLE = 60.0;
const double RADIUS_SMALL_CIRCLE = 50.0;
const double ELEVATION_GAME_AREA = 40.0;

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

int getFactorial(var maxValue) {
  var fact = 1;
  for(var i = 2;i<=maxValue;i++)
  {
    fact *=i;
  }
  return fact;
}

