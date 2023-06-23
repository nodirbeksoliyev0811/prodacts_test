import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/app_routs.dart';
import 'package:n8_default_project/ui/login_screen.dart';
import 'package:n8_default_project/ui/home_screen.dart';
import 'package:n8_default_project/ui/tab_box.dart';

import 'local/storage_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageRepository.getInstance();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: TabBox(),
      // initialRoute: RoutNames.splash ,
      // onGenerateRoute: AppRouts.generateRoute,
    );
  }
}

