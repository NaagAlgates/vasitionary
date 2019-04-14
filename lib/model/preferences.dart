
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vasitionary/helper/constants.dart';

Future<bool> saveWordOfTheDayIndex(int randomNumber) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(PREF_WORD_INDEX, randomNumber);
  return prefs.commit();
}

Future<int> getWordOfTheDayIndex() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt(PREF_WORD_INDEX);
}