import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
// import 'package:location/location.dart';

import 'list_item.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Find Radio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // Fields in a Widget subclass are always marked "final".
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List _stations = [];

  _getStations() async {
    var httpClient = createHttpClient();
    var res = await httpClient.get('http://postc.red/?locale=34229');
    List stations = JSON.decode(res.body);

    stations.sort((a, b) {
      double x = double.parse(a['freq']);
      double y = double.parse(b['freq']);
      return x.compareTo(y);
    });


    if (!mounted) return;


    setState(() {
      _stations = stations;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    _getStations();

    return new CupertinoPageScaffold(
      // navigationBar: new CupertinoNavigationBar(),
      child: new CustomScrollView(
        slivers: <Widget> [
          new CupertinoSliverNavigationBar(
            trailing: new GestureDetector(
              child: new Text(
                'Categories',
                style: new TextStyle(
                  color: Colors.orange,
                  fontSize: 16.0
                ),
              ),
               onTap: null,
            ),
            largeTitle: new Text('Local Radio'),
            // largeTitle: new Column(
            //   crossAxisAlignment: st,
            //   children: <Widget>[
            //      const Text('Find Radio', textAlign: TextAlign.start,)
            //   ],
            // ),
            backgroundColor: const Color(0x66FFFFFF),
          ),
          // const Text('hello'),

          new SliverPadding(
            // Top media padding consumed by CupertinoSliverNavigationBar.
            // Left/Right media padding consumed by Tab1RowItem.
            padding: MediaQuery.of(context).removePadding(
              removeTop: true,
              removeLeft: true,
              removeRight: true,
            ).padding,
            sliver: new SliverList(
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new ListItem(station: _stations[index]);
                },
                childCount: _stations.length,
              ),
            ),
          )
        ],
      ),
    );

    // return new Scaffold(
    //   appBar: new AppBar(
    //     title: new Text(widget.title),
    //   ),
    //   body: new ListView(
    //     children: _stations.map((s) => new ListItem(station: s)).toList(),
    //   ),
    // );
  }
}
