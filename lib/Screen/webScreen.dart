

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<WebScreenLayout> {
  // Height of your Container
  static const _containerHeight = 100.0;

  // You don't need to change any of these variables
  var _fromTop = -_containerHeight;
  final _controller = ScrollController();
  var _allowReverse = true, _allowForward = true;
  var _prevOffset = 0.0;
  var _prevForwardOffset = -_containerHeight;
  var _prevReverseOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_listener);
  }

  // entire logic is inside this listener for ListView
  void _listener() {
    double offset = _controller.offset;
    var direction = _controller.position.userScrollDirection;

    if (direction == ScrollDirection.reverse) {
      _allowForward = true;
      if (_allowReverse) {
        _allowReverse = false;
        _prevOffset = offset;
        _prevForwardOffset = _fromTop;
      }

      var difference = offset - _prevOffset;
      _fromTop = _prevForwardOffset + difference;
      if (_fromTop > 0) _fromTop = 0;
    } else if (direction == ScrollDirection.forward) {
      _allowReverse = true;
      if (_allowForward) {
        _allowForward = false;
        _prevOffset = offset;
        _prevReverseOffset = _fromTop;
      }

      var difference = offset - _prevOffset;
      _fromTop = _prevReverseOffset + difference;
      if (_fromTop < -_containerHeight) _fromTop = -_containerHeight;
    }
    setState(() {}); // for simplicity I'm calling setState here, you can put bool values to only call setState when there is a genuine change in _fromTop
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("ListView")),
      body: Stack(
        children: <Widget>[
          _yourListView(),
          Positioned(
            top: _fromTop,
            left: 0,
            right: 0,
            child: _yourContainer(),
          )
        ],
      ),
    );
  }

  Widget _yourListView() {
    return ListView.builder(
      itemCount: 100,
      controller: _controller,
      itemBuilder: (_, index) => ListTile(title: Text("Item $index")),
    );
  }

  Widget _yourContainer() {
    return Opacity(
      opacity: 1 - (-_fromTop / _containerHeight),
      child: Container(
        height: _containerHeight,
        color: Colors.white.withOpacity(0.5),
        alignment: Alignment.center,
        child: Text("Home", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}








// class WebScreenLayout extends StatelessWidget {
//   const WebScreenLayout({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: CustomScrollView(
//   slivers: <Widget>[
//     SliverToBoxAdapter(
//       child: Container(
//         color: Colors.green,
//         height: 100,
//       ),
//     ),

//     // I wan to stick this widget in the top, when I scroll up, initially it should be gone. 
//     SliverAppBar(
//       backgroundColor: Colors.blueAccent,
//       floating: true,
//       pinned: true,
//       expandedHeight: 70,
//       flexibleSpace: LayoutBuilder(
//         builder: (context, constraints) {
//           return const FlexibleSpaceBar(
//             title: Text("Sticky Header"),
//           );
//         },
//       ),
//     ),
//     SliverList(
//       delegate: SliverChildBuilderDelegate((context, index) {
//         return Text("Text $index");
//       }, childCount: 50),
//     ),
//   ],
// )
//     );
    
//   }
// }