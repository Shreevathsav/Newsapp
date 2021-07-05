import 'package:flutter/material.dart';

class Happenings extends StatefulWidget {
  // const Happenings({ Key? key }) : super(key: key);

  @override
  _HappeningsState createState() => _HappeningsState();
}

class _HappeningsState extends State<Happenings> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text('Happenings'),
    ));
  }
}
