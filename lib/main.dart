import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'package:travel_app/bottom_navigation_screen.dart';
import 'package:travel_app/demo_screen.dart';
import 'package:travel_app/explore_screen.dart';
import 'package:travel_app/food_order_screen.dart';
import 'package:travel_app/home_screen.dart';
import 'package:travel_app/login_screen.dart';
import 'package:travel_app/package_details_screen.dart';
import 'package:travel_app/signup_screen.dart';
import 'package:travel_app/timeline_cubit/timeline_cubit.dart';
import 'package:travel_app/update_user_details_cubit/user_details_cubit.dart';
import 'package:travel_app/utils/imageResources.dart';
import 'package:travel_app/utils/string.dart';
import 'user_details_update_bloc/user_details_bloc.dart';
import 'splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserDetailsBloc()),
        BlocProvider(create: (context) => UserDetailsCubit()),
        BlocProvider(create: (context) => ShowDetailsCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        title: title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: FoodOrderScreen(
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(appBarText),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Container(),
    );
  }
}
