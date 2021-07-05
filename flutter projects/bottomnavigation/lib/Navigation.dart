import 'package:flutter/material.dart';
import 'HloCalls.dart';
import 'Hlonymous.dart';
import 'HloChat.dart';
import 'Rooms.dart';
import 'Happenings.dart';

class Nav extends StatefulWidget {
  // const Nav({ Key? key }) : super(key: key);

  @override
  _NavState createState() => _NavState();

  void setState(Null Function() param0) {}
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HloChat(),
    Rooms(),
    Happenings(),
    Hlonymous(),
    HloCalls(),
  ];
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hlochat'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Hlochat'),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Rooms'),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Happenings'),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Hlonymous'),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Hlocalls'),
              backgroundColor: Colors.red),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),

      // Stack(
      //     children: [
      //       Positioned(
      //         bottom: 0,
      //         left: 0,
      //         child: Container(
      //           width: size.width,
      //           height: 80,
      //           child: Stack(
      //             overflow: Overflow.visible,
      //             children: [
      //               CustomPaint(
      //                 size: Size(size.width, 80),
      //                 painter: BNBCustomPainter(),
      //               ),
      //               Center(
      //                 heightFactor: 0.6,
      //                 child: FloatingActionButton(
      //                     backgroundColor: Colors.orange,
      //                     child: Icon(Icons.shopping_basket),
      //                     elevation: 0.1,
      //                     onPressed: () {
      //                       setState(() {
      //                         _selectedIndex = 0;
      //                       });
      //                     }),
      //               ),
      //               Container(
      //                 width: size.width,
      //                 height: 80,
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   children: [
      //                     IconButton(
      //                       icon: Icon(
      //                         Icons.home,
      //                         color: _selectedIndex == 1
      //                             ? Colors.orange
      //                             : Colors.grey.shade400,
      //                       ),
      //                       onPressed: () {
      //                         setState(() {
      //                           _selectedIndex = 1;
      //                         });
      //                       },
      //                       splashColor: Colors.white,
      //                     ),
      //                     IconButton(
      //                         icon: Icon(
      //                           Icons.restaurant_menu,
      //                           color: _selectedIndex == 2
      //                               ? Colors.orange
      //                               : Colors.grey.shade400,
      //                         ),
      //                         onPressed: () {
      //                           setState(() {
      //                             _selectedIndex = 2;
      //                           });
      //                         }),
      //                     Container(
      //                       width: size.width * 0.20,
      //                     ),
      //                     IconButton(
      //                         icon: Icon(
      //                           Icons.bookmark,
      //                           color: _selectedIndex == 3
      //                               ? Colors.orange
      //                               : Colors.grey.shade400,
      //                         ),
      //                         onPressed: () {
      //                           setState(() {
      //                             _selectedIndex = 3;
      //                           });
      //                         }),
      //                     IconButton(
      //                         icon: Icon(
      //                           Icons.notifications,
      //                           color: _selectedIndex == 4
      //                               ? Colors.orange
      //                               : Colors.grey.shade400,
      //                         ),
      //                         onPressed: () {
      //                           setState(() {
      //                             _selectedIndex = 4;
      //                           });
      //                         }),
      //                   ],
      //                 ),
      //               )
      //             ],

      //             //   onTap: _onItemTap,
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
    );
  }
}

// class BNBCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = new Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;

//     Path path = Path();
//     path.moveTo(0, 0); // Start
//     path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
//     path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
//     path.arcToPoint(Offset(size.width * 0.60, 20),
//         radius: Radius.circular(20.0), clockwise: false);
//     path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
//     path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.lineTo(0, 0);
//     canvas.drawShadow(path, Colors.black, 5, true);
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
