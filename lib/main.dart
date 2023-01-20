import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hamropasal/Screens/google-auth/googleAuthentication.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:khalti_flutter/localization/khalti_localizations.dart';
import 'package:provider/provider.dart';

import 'Screens/splashscreens/screen_one.dart';
import 'constants/constants.dart';
import 'firebase_options.dart';

// void main() {
//   runApp(const MyApp());
// }
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "dev project", options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = "Hamro Pasal";
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        //use your public/test key here
        publicKey: 'test_public_key_99795ae72a0147538c5928d21d792775',
        enabledDebugging: true,
        builder: (context, navKey) {
          return ChangeNotifierProvider(
            create: (context) => GoogleSignInProvider(),
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Hamro-Pasal',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                home: SplashScreen(),
                navigatorKey: navKey,
                localizationsDelegates: const [
                  KhaltiLocalizations.delegate,
                ]),
          );
        });
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx) => OnboardingScreenOne()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/images/HamroPasal.png'),
              width: 500,
            ),
            SizedBox(),
            SpinKitChasingDots(
              color: orange,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
