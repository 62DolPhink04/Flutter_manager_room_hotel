import 'package:flutter/material.dart';
import 'package:hostel_management_app/fetures/profile/controllers/account_setup_screen_controller.dart';
import 'package:hostel_management_app/fetures/authentication/controllers/authentication_repository.dart';
import 'package:hostel_management_app/fetures/authentication/controllers/forgotpassword_controller.dart';
import 'package:hostel_management_app/fetures/authentication/controllers/login_controller.dart';
import 'package:hostel_management_app/fetures/authentication/controllers/register_controller.dart';
import 'package:hostel_management_app/fetures/bookings/controllers/bookings_controller.dart';
import 'package:hostel_management_app/fetures/bookings/controllers/bookings_repository.dart';
import 'package:hostel_management_app/fetures/dashboard/controllers/dashboard_controller.dart';
import 'package:hostel_management_app/fetures/authentication/controllers/onboarding/onboaring_controller.dart';
import 'package:hostel_management_app/fetures/home/controllers/bottomnavbar_controller.dart';
import 'package:hostel_management_app/fetures/residents/controllers/residents_controller.dart';
import 'package:hostel_management_app/fetures/rooms/controllers/rooms_controller.dart';
import 'package:hostel_management_app/fetures/profile/controllers/user_controller.dart';
import 'package:hostel_management_app/fetures/authentication/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCKR17Ctmz3By4mLxirVD62LU_-r2cUX0w",
        appId: "1:964187063799:android:ee63cf615bea9e11091af2",
        messagingSenderId: '964187063799',
        projectId: "hostel-manager-e74af" ,
        storageBucket: "hostel-manager-e74af.firebasestorage.app"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => OnBoardingController(),
        ),
        ChangeNotifierProvider(
          create: (context) => NavBarController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ResidentsController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AccountSetUpScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthenticationRepository(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ForgotPasswordController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashboardController(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserController(),
        ),
        ChangeNotifierProvider(
          create: (context) => RoomsController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingRepository(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingsController(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
