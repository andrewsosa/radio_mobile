import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ListItem extends StatelessWidget {
  const ListItem({this.station});

  final station;



  @override
  Widget build(BuildContext context) {
    final String freq = station['freq'];
    final String amfm = station['amfm'];
    final String tag = station['tag'];
    final String callsign = station['callsign'];


    return new Container(
      // padding: new EdgeInsets.symmetric(vertical: 4.0),
      child: new Material(
        color: Colors.transparent,
        child: new Container (
          padding: new EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: new Row (
            children: <Widget>[
              new Container(
                // color: Colors.amberAccent,
                padding: new EdgeInsets.only(right: 16.0),
                child: new SizedBox(
                  width: 140.0,
                  child: new Text(
                      '$freq $amfm',
                      textAlign: TextAlign.right,
                      style: new TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.orange,
                        fontSize: 32.0
                      ),
                    ),
                ),
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    '$callsign',
                    style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                  new Text(
                    '$tag',
                    style: new TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300
                    ),
                  )
                ],
              )
              // new Expanded(
              //   child: new Text('$callsign'),
              // )
            ],
          )
        )
      )
    );

    // return new Material(
    //   // color: Colors.white,
    //   child: new ListTile(
    //     dense: true,
    //     leading: new Container(
    //       // color: Colors.amber,
    //       child: new Align(
    //         alignment: Alignment.centerRight,
    //         child: new Text(
    //           '$freq\n$amfm',
    //           softWrap: false,
    //           textAlign: TextAlign.end,
    //           style: new TextStyle(
    //             fontWeight: FontWeight.w600,
    //             fontSize: 14.0,
    //             color: Colors.orange
    //           ),
    //         ),
    //       )
    //     ),
    //     title: new Text(
    //       '$callsign',
    //       style: new TextStyle(
    //         fontSize: 16.0
    //       ),
    //     ),
    //     subtitle: new Text(
    //       '$tag',
    //       style: new TextStyle(
    //         fontSize: 14.0
    //       ),
    //     ),
    //   )
    // );
  }
}
