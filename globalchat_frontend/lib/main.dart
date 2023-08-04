import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:globalchat_flutter/notifier/chat_notifier.dart';
import 'package:globalchat_flutter/notifier/pref_notifier.dart';
import 'package:globalchat_flutter/screen/welcome_screen.dart';
import 'package:globalchat_flutter/util/routes.dart';
import 'package:provider/provider.dart';

import 'notifier/login_notifier.dart';
import 'notifier/register_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => RegisterNotifier()),
    ChangeNotifierProvider(create: (_) => LoginNotifier()),
    ChangeNotifierProvider(create: (_) => PrefNotifier()),
    ChangeNotifierProvider(create: (_) => ChatNotifier()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  Widget page = const WelcomeScreen();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Global Chat',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: Routes.ROOT,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
