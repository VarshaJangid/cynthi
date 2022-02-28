import 'package:flutter/material.dart';
import '/ui/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cynthi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:country_code_picker/country_code_picker.dart';

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   TextEditingController phoneController = new TextEditingController();
//   String phoneNumber = "";
//
//   void _onCountryChange(CountryCode countryCode) {
//     this.phoneNumber = countryCode.toString();
//     print("New Country selected: " + countryCode.toString());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       appBar: AppBar(
//         title: const Text('Country Code Demo'),
//       ),
//       body: Center(
//         child: new ListView(
//             shrinkWrap: true,
//             padding: EdgeInsets.only(left: 24.0, right: 24.0),
//             children: <Widget>[
//               Container(
//                 width: 50,
//                 child: CountryCodePicker(
//                   onChanged: _onCountryChange,
//                   favorite: ['+91'],
//                   flagWidth: 0,
//                   showCountryOnly: true,
//                   showFlagMain:false,
//                   showOnlyCountryWhenClosed: false,
//                   alignLeft: false,
//                 ),
//               ),
//             ]),
//       ),
//     ));
//   }
// }
