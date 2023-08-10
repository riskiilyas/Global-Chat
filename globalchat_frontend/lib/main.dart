import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:globalchat_flutter/notifier/chat_notifier.dart';
import 'package:globalchat_flutter/notifier/login_with_token_notifier.dart';
import 'package:globalchat_flutter/notifier/pref_notifier.dart';
import 'package:globalchat_flutter/notifier/theme_notifier.dart';
import 'package:globalchat_flutter/util/app_localization.dart';
import 'package:globalchat_flutter/util/constants.dart';
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
    ChangeNotifierProvider(create: (_) => LoginWithTokenNotifier()),
    ChangeNotifierProvider(create: (_) => PrefNotifier()),
    ChangeNotifierProvider(create: (_) => ChatNotifier()),
    ChangeNotifierProvider(create: (_) => ThemeNotifier()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    context.watch<ThemeNotifier>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: Routes.ROOT,
      onGenerateRoute: Routes.generateRoute,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('id')
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale!.languageCode &&
              locale.countryCode == deviceLocale.countryCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalization.delegate
      ],
    );
  }
}
