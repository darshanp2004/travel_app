import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/food_order_screen.dart';
import 'package:travel_app/login_screen.dart';
import 'package:travel_app/utils/string.dart';
import 'package:travel_app/profile_screen.dart';
import 'package:travel_app/home_screen.dart';
import 'package:travel_app/explore_screen.dart';
import 'package:travel_app/travel_screen.dart';
import 'signup_screen.dart';

class bottomNavigationbarScreen extends StatefulWidget{

  @override
  State<bottomNavigationbarScreen> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigationbarScreen> {

  List<Widget> screen = [
    homeScreen(),
    exploreScreen(),
    travelScreen(),
    profileScreen()
  ];
  int myIndex = 0;

  onTapped(index){
    setState(() {
      myIndex=index;
    });
  }
  static DateTime?lastBackPressed;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop,result){
        final now=DateTime.now();
        if(lastBackPressed==null||now.difference(lastBackPressed!)>Duration(seconds: 2)){
          lastBackPressed=now;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(exit),
          duration: Duration(seconds: 2),));
          return; // do not Exit.
        }
        SystemNavigator.pop();
        return; // exit.
      },
      child: Scaffold(
        appBar:myIndex==1||myIndex==2||myIndex==3?null: AppBar(
          backgroundColor: Colors.blue,
          title: Text(welcomeText),
          actions: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodOrderScreen()));
              }, icon: Icon(Icons.ac_unit))
          ],
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.blue,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.lightBlueAccent),
                child: Text(header,style: TextStyle(fontSize: 30),),
              ),
              ListTile(
                title: const Text(home),
                onTap: (){
                  onTapped(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(explore),
                onTap: (){
                  onTapped(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(travel),
                onTap: (){
                  onTapped(2);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(profile),
                onTap: (){
                  onTapped(3);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        body: Center(child: screen[myIndex]),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: home),
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: explore),
            BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: travel),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: profile),
          ],
        ),
      ),
    );
  }
}