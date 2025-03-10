import 'package:boiler_plate/auth_check.dart';
import 'package:boiler_plate/pages/home_page.dart';
import 'package:boiler_plate/pages/page_handler.dart';
import 'package:boiler_plate/pages/profile_page.dart';
import 'package:boiler_plate/pages/login_page.dart';
import 'package:boiler_plate/widgets/index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

// Global Navigator Key
final GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  await Hive.openBox("myRegistrationBox");
  await Hive.openBox("sessions");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageIndexProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: globalNavigatorKey, // Add this line
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        primaryColor: Colors.black,
      ),
      initialRoute: '/auth',
      routes: {
        '/': (context) => const PageHandler(),
        '/auth': (context) => const AuthCheck(),
        '/login': (context) => const LoginPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
