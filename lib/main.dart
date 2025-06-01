import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_app/core/theme/theme.dart';
import 'package:status_app/features/auth/screen/login_screen.dart';
import 'package:status_app/features/home/screens/home_screen.dart';
import 'package:status_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: LoginScreen(),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('State App'), centerTitle: true),
//       body: Column(
//         children: [
//           Center(
//             child: Container(
//               margin: EdgeInsets.all(10),
//               padding: EdgeInsets.all(50),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: Colors.blueGrey,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 spacing: 10,
//                 children: [
//                   Text('Status'),
//                   Text('Happy'),
//                   const AnimatedEmoji(AnimatedEmojis.smile),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
