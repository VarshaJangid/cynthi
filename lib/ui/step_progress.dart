// import 'package:cynthi/ui/register/mobile_screen.dart';
// import 'package:cynthi/ui/register/mobile_view_model.dart';
// import 'package:cynthi/utils/app_constant.dart';
// import 'package:flutter/material.dart';
//
// import 'component/custom_button.dart';
// import 'component/login_text_field.dart';
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, this.title = ''}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final _stepsText = [
//     "About you",
//     "About you",
//     "Some more..",
//     "Your credit card details"
//   ];
//
//   final _stepCircleRadius = 1.0;
//
//   final _stepProgressViewHeight = 200.0;
//
//   Color _activeColor = Colors.green;
//
//   Color _inactiveColor = Colors.grey;
//
//   TextStyle _headerStyle =
//       TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
//
//   TextStyle _stepStyle = TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold);
//
//   Size? _safeAreaSize;
//
//   int _curPage = 1;
//
//   StepProgressView _getStepProgress() {
//     return StepProgressView(
//       _stepsText,
//       _curPage,
//       _stepProgressViewHeight,
//       _safeAreaSize!.width,
//       _stepCircleRadius,
//       _activeColor,
//       _inactiveColor,
//       _headerStyle,
//       _stepStyle,
//       decoration: BoxDecoration(color: Colors.white),
//       padding: EdgeInsets.all(0),
//     );
//   }
//
//
//
// //Build method of Main Page
//   Widget build(BuildContext context) {
//     var mediaQD = MediaQuery.of(context);
//     _safeAreaSize = mediaQD.size;
//     return Scaffold(
//         body: Column(
//       children: <Widget>[
//         Container(height: 30.0, child: _getStepProgress()),
//         _curPage == 1
//             ? Text("dfkjxn")
//             : _curPage == 2
//                 ? Text("_curPage 2")
//                 : _curPage == 3
//                     ? Text("_curPage 3")
//                     : Text("$_curPage"),
//         MaterialButton(
//           color: Colors.green,
//           onPressed: () {
//             if (_curPage < 4) {
//               setState(() {
//                 _curPage++;
//               });
//             }
//           },
//           child: Text('Next'),
//         ),
//         MaterialButton(
//           color: Colors.red,
//           onPressed: () {
//             if (_curPage > 1) {
//               setState(() {
//                 _curPage--;
//               });
//             }
//           },
//           child: Text('prev'),
//         ),
//       ],
//     ));
//   }
// }
//
// class StepProgressView extends StatelessWidget {
//   const StepProgressView(
//     List<String> stepsText,
//     int curStep,
//     double height,
//     double width,
//     double dotRadius,
//     Color activeColor,
//     Color inactiveColor,
//     TextStyle headerStyle,
//     TextStyle stepsStyle, {
//     Key? key,
//     required this.decoration,
//     required this.padding,
//     this.lineHeight = 5.0,
//   })  : _stepsText = stepsText,
//         _curStep = curStep,
//         _height = height,
//         _width = width,
//         _dotRadius = dotRadius,
//         _activeColor = activeColor,
//         _inactiveColor = inactiveColor,
//         _headerStyle = headerStyle,
//         _stepStyle = stepsStyle,
//         assert(curStep > 0 == true && curStep <= stepsText.length),
//         assert(width > 0),
//         assert(height >= 2 * dotRadius),
//         assert(width >= dotRadius * 2 * stepsText.length),
//         super(key: key);
//
//   //height of the container
//   final double _height;
//
//   //width of the container
//   final double _width;
//
//   //container decoration
//   final BoxDecoration decoration;
//
//   //list of texts to be shown for each step
//   final List<String> _stepsText;
//
//   //cur step identifier
//   final int _curStep;
//
//   //active color
//   final Color _activeColor;
//
//   //in-active color
//   final Color _inactiveColor;
//
//   //dot radius
//   final double _dotRadius;
//
//   //container padding
//   final EdgeInsets padding;
//
//   //line height
//   final double lineHeight;
//
//   //header textstyle
//   final TextStyle _headerStyle;
//
//   //steps text
//   final TextStyle _stepStyle;
//
//   List<Widget> _buildDots() {
//     var wids = <Widget>[];
//     _stepsText.asMap().forEach((i, text) {
//       var lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;
//       if (i != _stepsText.length - 1) {
//         wids.add(
//           Expanded(
//             child: Container(
//               height: lineHeight,
//               color: lineColor,
//             ),
//           ),
//         );
//       }
//     });
//
//     return wids;
//   }
//
//   Widget build(BuildContext context) {
//     return Container(
//       padding: padding,
//       height: this._height,
//       width: this._width,
//       decoration: this.decoration,
//       child: Column(
//         children: <Widget>[
//           Container(
//             height: 20,
//             child: Row(
//               children: _buildDots(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
