import 'package:flutter/material.dart';
import 'package:vasitionary/helper/constants.dart';
import 'package:vasitionary/model/dictionary_word_list.dart';

class ViewMeaning extends StatelessWidget {
  final String word;
  final String meaning;
  final String audio;
  final String video;
  // receive data from the FirstScreen as a parameter
  ViewMeaning({Key key, @required this.word, @required this.meaning, @required this.audio, @required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPLICATION_NAME),backgroundColor: COLOR_APPBAR,),
      body: Container(
        child: Text("Word: "+word+"\n\nMeaning: "+meaning,
          //wordList.contains(text),
          style: TextStyle(fontSize: 24),textAlign: TextAlign.left, textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}

bool checkForValue(List<WordList> wordList, String text){
  if(wordList.contains(text)){
    return true;
  }else{
    return false;
  }
}