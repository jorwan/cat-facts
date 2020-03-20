import 'package:flutter/material.dart';

import 'cat_fact_provider.dart';
import 'cat_image_provider.dart';

main() => runApp(CatFactApp());

class CatFactApp extends StatefulWidget {
  @override
  _CatFactAppState createState() => _CatFactAppState();
}

class _CatFactAppState extends State<CatFactApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Scaffold(
          body: Container(
            color: Colors.white,
            child: FlatButton(
              onPressed: () {
                setState(() {});
              },
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[_getCatImage(), _getCatFact()]),
            ),
          ),
        ),
      ),
    );
  }

  /**
   * Get Cat Image
   */
  Widget _getCatImage() {
    return Container(
      height: 300,
      width: double.infinity,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 250,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CatImageProvider.getCatImage()),
        ),
      ),
    );
  }

  Widget _getCatFact() => Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: FutureBuilder<String>(
          future: CatFactProvider.getCatFact(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) =>
              Text(snapshot.data ?? ''),
        ),
      );
}
