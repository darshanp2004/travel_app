import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/update_user_details_cubit/user_details_cubit_state.dart';


class UserDetailsCubit extends Cubit<userDetailsState> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  File? selectedImage;

  UserDetailsCubit()
      : super(userDetailsState(username: '', email: '', image: null));

  void updateImage(File image) {
    emit(state.copyWith(image: image));
  }

  Future pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (returnedImage != null) {
      selectedImage = File(returnedImage.path);
      updateImage(selectedImage!);
    }
  }

  void updateDetails({required String username, required String email}) {
    emit(state.copyWith(username: username, email: email));
  }
}