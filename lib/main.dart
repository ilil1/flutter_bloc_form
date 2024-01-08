import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/core.dart';
import 'features/features.dart';

final router = AppRouter();

main() {
  AppConfig.init(
    callback: () {
      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.dumpErrorToConsole(details);
      };
      runApp(const App());

      return;
    },
  );
}

class ErrorArea extends StatelessWidget {
  const ErrorArea({required this.errorDetails, super.key});

  final FlutterErrorDetails errorDetails;

  @override
  Widget build(BuildContext context) {
    return ErrorPage(
      errorMessage: errorDetails.exceptionAsString(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: preCacheImages(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Listener(
              behavior: HitTestBehavior.opaque,
              onPointerDown: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Form',
                  darkTheme: darkTheme,
                  theme: lightTheme,
                  routerConfig: router.setRouter,
                  locale: const Locale('ko', 'KR'),
                  builder: (context, child) {
                    ErrorWidget.builder = (errorData) {
                      Widget error = Text('$errorData');
                      if (child is Scaffold || child is Navigator) {
                        error = Scaffold(body: ErrorArea(errorDetails: errorData));
                      }
                      return error;
                    };
                    return child!;
                  }),
            );
          } else {
            return Container();
          }
        });
  }

  Future<bool> preCacheImages(BuildContext context) async {
    if (kDebugMode) return true;
    return Future.wait([]).then((value) => true).catchError((e) => false);
  }
}

class AppConfig {
  static AppConfig get to => AppConfig();
  static final List<Locale> _locales = [const Locale('ko'), const Locale('en')];

  List<Locale> get locales => _locales;

  static Future init({required VoidCallback callback}) async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    callback();
  }
}
