import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/update_user_details_cubit/user_details_cubit.dart';
import 'package:travel_app/update_user_details_cubit/user_details_cubit_state.dart';
import 'package:travel_app/user_details_update_bloc/user_details_bloc.dart';
import 'package:travel_app/utils/string.dart';

class editProfileScreen extends StatefulWidget {
  const editProfileScreen({super.key});

  @override
  State<editProfileScreen> createState() => _editProfileScreenState();
}

class _editProfileScreenState extends State<editProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsCubit, userDetailsState>(
      builder: (context, state) {
        final usernameController = context.read<UserDetailsCubit>().usernameController;
        final emailController = context.read<UserDetailsCubit>().emailController;
        final selectedImage = state.image;

        usernameController.text = state.username;
        emailController.text = state.email;

        //   BlocBuilder<UserDetailsBloc, UserDetailsState>(
        //   builder: (context, state) {
        //     if (state is UserDetailsLoadedState) {
        //       selectedImage = state.image;
        //       usernameController.text = state.username;
        //       emailController.text = state.email;
        //     }
        return Scaffold(
          appBar: AppBar(
            title: Text(editProfile),
            backgroundColor: Colors.blue,
          ),
          body: SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 60),
                        child: CircleAvatar(
                          backgroundImage:
                              selectedImage != null
                                  ? FileImage(selectedImage!)
                                  : null,
                          radius: 80,
                          child:
                              selectedImage == null
                                  ? const Icon(
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
                          onPressed: ()=>context.read<UserDetailsCubit>().pickImageFromGallery(),
                          icon: const Icon(Icons.edit),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: user,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: emailText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      context.read<UserDetailsCubit>().updateDetails(
                        username: usernameController.text,
                        email: emailController.text,
                      );
                      // context.read<UserDetailsBloc>().add(UpdateUserDetailsEvent(
                      //   username: usernameController.text,
                      //   email: emailController.text,
                      // ));
                      Navigator.pop(context);
                    },
                    child: Text(
                      saveChanges,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
