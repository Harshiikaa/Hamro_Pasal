import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hamropasal/view_models/auth_view_model.dart';
import 'package:hamropasal/view_models/global_auth_view_model.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:khalti_flutter/localization/khalti_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'Screens/ForgotPassword/forgot_screen.dart';
import 'Screens/LoginScreen/login_screens.dart';
import 'Screens/SignUp/signup_screens.dart';
import 'Screens/homeScreen/homeScreen.dart';
import 'Screens/splashscreens/screen_one.dart';
import 'constants/constants.dart';
import 'firebase_options.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "dev project", options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalUIViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: Center(
          child: Image.asset(
            "assets/images/loading.gif",
            height: 100,
            width: 100,
          ),
        ),
        child: Consumer<GlobalUIViewModel>(builder: (context, loader, child) {
          if (loader.isLoading) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }
          return KhaltiScope(
              //use your public/test key here
              publicKey: 'test_public_key_99795ae72a0147538c5928d21d792775',
              enabledDebugging: true,
              builder: (context, navKey) {
                return MaterialApp(
                    title: 'Flutter Demo',
                    theme: ThemeData(
                      primarySwatch: Colors.blue,
                    ),
                    initialRoute: "/splash",
                    routes: {
                      "/login": (BuildContext context) => LoginScreens(),
                      "/splash": (BuildContext context) => SplashScreen(),
                      "/register": (BuildContext context) => SignupScreen(),
                      "/forget-password": (BuildContext context) =>
                          ForgotScreen(),
                      "/dashboard": (BuildContext context) => HomeScreen(),
                    },
                    navigatorKey: navKey,
                    localizationsDelegates: const [
                      KhaltiLocalizations.delegate,
                    ]);
              });
        }),
      ),
    );
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return KhaltiScope(
//       //use your public/test key here
//         publicKey: 'test_public_key_99795ae72a0147538c5928d21d792775',
//         enabledDebugging: true,
//         builder: (context, navKey) {
//           return MaterialApp(
//               debugShowCheckedModeBanner: false,
//               title: 'Hamro-Pasal',
//               theme: ThemeData(
//                 primarySwatch: Colors.blue,
//               ),
//               home: SplashScreen(),
//               navigatorKey: navKey,
//               localizationsDelegates: const [
//                 KhaltiLocalizations.delegate,
//               ]);
//         }
//     );
//   }
// }

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
