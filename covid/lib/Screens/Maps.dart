
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
int val=0;
class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}
double progress = 0;
class _MapState extends State<Map> {
  final Completer<WebViewController> _completer =
  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    List<Widget> body=[
      Stack(
        children: <Widget>[
          (progress != 1.0)
              ? LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red))
              : null,
          Container(
            height: 1000,
            width: 600,
            child:


            WebView(
              initialUrl: "https://covid19.locale.ai/",
              javascriptMode: JavascriptMode.unrestricted,

              onWebViewCreated: (WebViewController webViewController){
                _completer.complete(webViewController);
              },

            ),

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 80,
                    width: 50,
                    color: Colors.black54,
                  ),
                ],
              ),
              Container(
                height: 30,
                width: 500,
                color: Colors.black54,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10,left: 7),
            height: 50,
            width: 50,
            color: Colors.black54,
          ),
        ],
      ),
      Container(
        color: Colors.black54,
        child: Center(
          child: SpinKitWave(
            color: Colors.white,
          ),
        ),
      )
    ];
    return body[val];
  }

}
void map(String url)
async{
  if (await canLaunch(url)) {
 val=1;
} else {
    val=0;
throw 'Could not launch $url';
}
}