// import 'package:dating_app/presentation/features/user/home/user_home_screen.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'SparkMatch',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           primarySwatch: Colors.pink,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: HomeScreen());
//   }
// }
import 'package:dating_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SparkMatchApp());
}

class SparkMatchApp extends StatelessWidget {
  const SparkMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SparkMatch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black54),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
