import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/edit_profile_screen.dart';
import 'package:travel_app/login_screen.dart';
import 'package:travel_app/update_user_details_cubit/user_details_cubit.dart';
import 'package:travel_app/update_user_details_cubit/user_details_cubit_state.dart';
import 'package:travel_app/utils/string.dart';
import 'user_details_update_bloc/user_details_bloc.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    print("------------------------------------------------------");
    File? profileImage = context.watch<UserDetailsCubit>().state.image;
    String name =
        context.watch<UserDetailsCubit>().state.username.isNotEmpty
            ? context.watch<UserDetailsCubit>().state.username
            : defaultUser;
    String email =
        context.watch<UserDetailsCubit>().state.email.isNotEmpty
            ? context.watch<UserDetailsCubit>().state.email
            : defaultEmail;

    // BlocBuilder<UserDetailsBloc, UserDetailsState>(
    // builder: (context, state) {
    //   File? profileImage;
    //   String name = defaultUser;
    //   String email = defaultEmail;
    //
    //   if (state is UserDetailsLoadedState) {
    //     profileImage = state.image;
    //     name = state.username.isNotEmpty ? state.username : defaultUser;
    //     email = state.email.isNotEmpty ? state.email : defaultEmail;
    //   }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(profile),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    child: CircleAvatar(
                      backgroundImage:
                          profileImage != null ? FileImage(profileImage) : null,
                      radius: 80,
                      child:
                          profileImage == null
                              ? Icon(
                                Icons.person,
                                size: 80,
                                color: Colors.white,
                              )
                              : null,
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    top: 185,
                    left: 120,
                    child: IconButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => editProfileScreen(),
                          ),
                        );
                      },
                      icon: Icon(Icons.edit),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(name, style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text(email, style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 11,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Card(
                    child: ListTile(
                      title: Text(settings, style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 11,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Card(
                    child: ListTile(
                      title: Text(changePass, style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 11,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () async {
                      var sharedpref = await SharedPreferences.getInstance();
                      sharedpref.clear();
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => loginScreen()),
                        (route) => false,
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(logOut, style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
