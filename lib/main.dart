import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyDisklavier',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Piano Controls'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _baseUrl = "http://192.168.88.1/";

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        constraints: BoxConstraints.expand(),
                        child: ColoredBox(
                            color: Colors.green,
                            child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: TextButton(
                                    onPressed: () async {
                                      print("~~ Play Start");
                                      // Use this command to play what is on usb
                                      await http.get(Uri.parse(_baseUrl + 'ctrl/setSong.php?prefix=s&song_id=1')).timeout(
                                        Duration(seconds: 5),
                                        onTimeout: () {
                                          print("~~ Play Timeout");
                                          // time has run out, do what you wanted to do
                                          return null;
                                        },
                                      );
                                      // await http.get(Uri.parse(_baseUrl + 'ctrl/setSeq.php?status=play'));
                                      print("~~ Play End");
                                    },
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          // FittedBox(
                                          //     fit: BoxFit.contain,
                                          //     child: Text(
                                          //       'Play',
                                          //       style: TextStyle(
                                          //           fontSize: 256,
                                          //           fontWeight: FontWeight.bold,
                                          //           color: Colors.black),
                                          //     )),
                                          FittedBox(
                                              fit: BoxFit.fill,
                                              child: Icon(Icons.play_arrow,
                                                  color: Colors.black, size: 256.0))
                                        ])))

                        ))),
                Expanded(
                  flex: 1,
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    child: ColoredBox(
                        color: Colors.red,
                        child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: TextButton(
                                onPressed: () async {
                                  print("~~ Stop Start");
                                  await http.get(Uri.parse(_baseUrl + 'ctrl/setSeq.php?status=pause')).timeout(
                                    Duration(seconds: 5),
                                    onTimeout: () {
                                      print("~~ Stop Timeout");
                                      // time has run out, do what you wanted to do
                                      return null;
                                    },
                                  );
                                  print("~~ Stop End");
                                },
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // FittedBox(
                                      //     fit: BoxFit.contain,
                                      //     child: Text(
                                      //       'Stop',
                                      //       style: TextStyle(
                                      //           fontSize: 256,
                                      //           fontWeight: FontWeight.bold,
                                      //           color: Colors.black),
                                      //     )),
                                      FittedBox(
                                          fit: BoxFit.fill,
                                          child: Icon(Icons.stop,
                                              color: Colors.black, size: 256.0))
                                    ])))),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        constraints: BoxConstraints.expand(),
                        child: ColoredBox(
                          color: Colors.purple,
                          child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: TextButton(
                                  onPressed: () async {
                                    print("~~ Back Start");
                                    await http.get(Uri.parse(_baseUrl + 'ctrl/setSeq.php?status=back_song')).timeout(
                                      Duration(seconds: 5),
                                      onTimeout: () {
                                        print("~~ Back Timeout");
                                        // time has run out, do what you wanted to do
                                        return null;
                                      },
                                    );
                                    print("~~ Back End");
                                  },
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // FittedBox(
                                        //     fit: BoxFit.contain,
                                        //     child: Text(
                                        //       'Back',
                                        //       style: TextStyle(
                                        //           fontSize: 256,
                                        //           fontWeight: FontWeight.bold,
                                        //           color: Colors.black),
                                        //     )),
                                        FittedBox(
                                            fit: BoxFit.fill,
                                            child: Icon(Icons.arrow_back,
                                                color: Colors.black,
                                                size: 256.0))
                                      ]))),
                        ),
                      )),
                  Expanded(
                    flex: 1,
                    child: Container(
                        constraints: BoxConstraints.expand(),
                        child: ColoredBox(
                          color: Colors.yellow,
                          child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: TextButton(
                                  onPressed: () async {
                                    print("~~ Next Start");
                                    await http.get(Uri.parse(_baseUrl + 'ctrl/setSong.php?control=next')).timeout(
                                      Duration(seconds: 5),
                                      onTimeout: () {
                                        print("~~ End Timeout");
                                        // time has run out, do what you wanted to do
                                        return null;
                                      },
                                    );
                                    print("~~ Next End");
                                  },
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // FittedBox(
                                        //     fit: BoxFit.contain,
                                        //     child: Text(
                                        //       'Next',
                                        //       style: TextStyle(
                                        //           fontSize: 256,
                                        //           fontWeight: FontWeight.bold,
                                        //           color: Colors.black),
                                        //     )),
                                        FittedBox(
                                            fit: BoxFit.fill,
                                            child: Icon(Icons.arrow_forward,
                                                color: Colors.black,
                                                size: 256.0))
                                      ]))),
                        )),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
