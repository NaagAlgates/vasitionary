import 'dart:convert';

import 'package:flutter/services.dart';

class DictionaryWordList {
  static List<WordList> wordList;

  static int getCount() {
    return wordList.toList().length;
  }

  static String getWordByIndex(int index){
    return wordList[index].word.toString();
  }

  static String getMeaningByIndex(int index){
    return wordList[index].meaning.toString();
  }

  static Future loadPlayers() async {
    try {
      wordList = new List<WordList>();
      String jsonString = await rootBundle.loadString('assets/v_word_list.json');
      Map parsedJson = json.decode(jsonString);
      var categoryJson = parsedJson['wordList'] as List;
      for (int i = 0; i < categoryJson.length; i++) {
        wordList.add(new WordList.fromJson(categoryJson[i]));
      }
    } catch (e) {
      print(e);
    }
  }
}
class WordList
{
  String meaning;

  String audio;

  String video;

  String word;

  String getMeaning ()
  {
    return meaning;
  }

  void setMeaning (String meaning)
  {
    this.meaning = meaning;
  }

  String getAudio ()
  {
    return audio;
  }

  void setAudio (String audio)
  {
    this.audio = audio;
  }

  String getVideo ()
  {
    return video;
  }

  void setVideo (String video)
  {
    this.video = video;
  }

  String getWord ()
  {
    return word;
  }

  void setWord (String word)
  {
    this.word = word;
  }

  String toString() {
    return "ClassPojo [meaning = " + meaning + ", audio = " + audio +
        ", video = " + video + ", word = " + word + "]";
  }
  WordList({this.word,this.video,this.audio,this.meaning});
  factory WordList.fromJson(Map<String, dynamic> parsedJson) {
    return WordList(
        meaning: parsedJson['meaning'],
        audio: parsedJson['audio'],
        video: parsedJson['video'],
        word: parsedJson['word']
    );
  }

}
