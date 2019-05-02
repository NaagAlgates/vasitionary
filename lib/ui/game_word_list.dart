import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vasitionary/helper/constants.dart';
String charList="";
int length=0;
Set<String> temp;
var output = new StringBuffer();
class DisplayWordList extends StatefulWidget {
  String sR1C1, sR1C2, sR1C3, sR2C1, sR2C2, sR2C3, sR3C1, sR3C2, sR3C3;

  DisplayWordList(
      {Key key,
      @required this.sR1C1,
      @required this.sR1C2,
      @required this.sR1C3,
      @required this.sR2C1,
      @required this.sR2C2,
      @required this.sR2C3,
      @required this.sR3C1,
      @required this.sR3C2,
      @required this.sR3C3})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DisplayWords(sR1C1, sR1C2, sR1C3, sR2C1, sR2C2, sR2C3, sR3C1, sR3C2, sR3C3);
  }
}

class DisplayWords extends State<DisplayWordList> {
  String sR1C1, sR1C2, sR1C3, sR2C1, sR2C2, sR2C3, sR3C1, sR3C2, sR3C3;
  DisplayWords(this.sR1C1,
      this.sR1C2,
      this.sR1C3,
      this.sR2C1,
      this.sR2C2,
      this.sR2C3,
      this.sR3C1,
      this.sR3C2,
      this.sR3C3);
  @override
  Widget build(BuildContext context) {
    /*List<String> charList = new List<String>();
    charList.add(sR1C1);
    charList.add(sR1C2);
    //charList.add(sR1C3);
    //charList.add(sR2C1);
    //charList.add(sR2C2);
    //charList.add(sR2C3);
    //charList.add(sR3C1);
    //charList.add(sR3C2);
    //charList.add(sR3C3);
    List<String> allWordList = getAllCombination(charList);*/
    charList= sR1C1+ sR1C2;//+ sR1C3+ sR2C1+ sR2C2+ sR2C3+ sR3C1+ sR3C2+ sR3C3;
    //List<String> allWordList = getAllCombination(charList.length);
    return new Container();
  }
}
/*
List<String> getAllCombination(int numberOfWords)
{
  List<String> randomStrings = new List<String>();
  Random random = new Random();
  for(int i = 0; i < numberOfWords; i++)
  {
    List<String> word = new List<String>();[random.nextInt(8)+3]; // words of length 3 through 10. (1 and 2 letter words are boring.)
    for(int j = 0; j < word.length; j++)
    {
      word[j] = (char)('a' + random.nextInt(26));
    }
    randomStrings[i] = new String(word);
  }
  return randomStrings;
}*/

/*List<String> getAllCombination() {
  combine(0);
}

*//*void iterate( String charList, List<String> temp, int pos) {
  for (int i=0;i<charList.length;i++){
    temp[pos] =charList[i];
    print (charList[i]);
    print (temp[pos]);
    print (pos);
    iterate(charList,temp,pos+1);
  }
}*//*

*//*Set<String> generatePerm(){
  combine(0);
}*//*
void combine(int start){
  length = charList.length;
_combine(start);
}
void _combine(int start){
  for( int i = start; i < length; ++i ){
    output.write( charList.substring(i,1) );
    print( output );
    //temp.add(output);
    if ( i < length )
      _combine( i + 1);
    print("CharList: "+charList[i]);
    //charList.replaceAll(charList[i], "");
    //length = output.length-1;
    String str = output.toString();
    print(str);
    print(str.length-1);
    str.replaceRange(str.length-1,str.length,"");
    print(str);
    //output.setLength( output.length - 1 );
  }
}*/
/*
Set<String> generatePerm(String input)
{
  Set<String> set = new HashSet<String>();
  if (input == "")
    return set;

  var  a = input.substring(0,1);

  if (input.length > 1)
  {
    input = input.substring(1);

    Set<String> permSet = generatePerm(input);

    for (String x in permSet)
    {
      for (int i = 0; i <= x.length; i++)
      {
        set.add(x.substring(0, i) + a + x.substring(i));
      }
    }
  }
  else
  {
    set.add(a + "");
  }
  return set;
}*/
