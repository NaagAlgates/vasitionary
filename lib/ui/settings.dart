import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vasitionary/helper/constants.dart';

class Settings extends StatefulWidget {
  String userEmail, userName, userDpUrl;

  Settings(
      {Key key,
      @required this.userEmail,
      @required this.userName,
      @required this.userDpUrl})
      : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    String userName = widget.userName;
    userName = userName.length<0 ? userName=widget.userEmail: widget.userName;
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Form(
          child: ListView(children: <Widget>[
        Stack(
          children: <Widget>[
            // The containers in the background
            new Column(
              children: <Widget>[
                new Container(
                    height: MediaQuery.of(context).size.height * .32,
                    decoration: new BoxDecoration(
                        border: new Border.all(
                            color: Colors.transparent,
                            width: 5.0,
                            style: BorderStyle.solid),
                        borderRadius: new BorderRadius.only(
                            bottomRight: Radius.circular(130.0)),
                        image: new DecorationImage(
                          image: new AssetImage('assets/images/xmas-coze.gif'),
                          fit: BoxFit.fitWidth,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.0),
                              BlendMode.multiply),
                        ))),
              ],
            ),
            // The card widget with top padding,
            // incase if you wanted bottom padding to work,
            // set the `alignment` of container to Alignment.bottomCenter
            Container(
              alignment: Alignment.topLeft,
              padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .22,
                  right: 20.0,
                  left: 5.0),
              child: new Container(
                  height: 130.0,
                  width: 130.0,
                  decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Colors.transparent,
                          width: 5.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.only(
                        bottomRight: Radius.circular(0.0),
                        bottomLeft: Radius.circular(60.0),
                        topRight: Radius.circular(60.0),
                        topLeft: Radius.circular(60.0),
                      ),
                      image: new DecorationImage(
                        image: new NetworkImage(widget.userDpUrl),
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.0), BlendMode.multiply),
                      ))
                  /*child: new Card(
                  color: Colors.white,
                  elevation: 4.0,
                ),*/
                  ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .315,
                  right: 5.0,
                  left: 20.0),
              child: new Container(
                  height: 130.0,
                  width: 270.0,
                  decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Colors.transparent,
                          width: 5.0,
                          style: BorderStyle.solid),
                      borderRadius: new BorderRadius.only(
                        bottomRight: Radius.circular(0.0),
                        bottomLeft: Radius.circular(60.0),
                        topRight: Radius.circular(60.0),
                        topLeft: Radius.circular(60.0),
                      ),),
                child: Text(userName.split(" ")[0],maxLines: 1,
                  style: TextStyle(color: Colors.black,fontSize: 35.0),),
                /*child: new Card(
                  color: Colors.white,
                  elevation: 4.0,
                ),*/
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: new EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .375,
                  right: 5.0,
                  left: 20.0),
              child: new Container(
                height: 40.0,
                width: 270.0,
                decoration: new BoxDecoration(
                  border: new Border.all(
                      color: Colors.transparent,
                      width: 5.0,
                      style: BorderStyle.solid),
                  borderRadius: new BorderRadius.only(
                    bottomRight: Radius.circular(0.0),
                    bottomLeft: Radius.circular(60.0),
                    topRight: Radius.circular(60.0),
                    topLeft: Radius.circular(60.0),
                  ),),
                child: Text(widget.userEmail,maxLines: 1,style: TextStyle(color: Colors.black,fontSize: 15.0),),
                /*child: new Card(
                  color: Colors.white,
                  elevation: 4.0,
                ),*/
              ),
            ),
          ],
        ),
        SizedBox(
          height: 60.0,
        ),
      ])),
    );
  }
}
