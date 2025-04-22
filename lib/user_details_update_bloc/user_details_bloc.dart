import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  String username = '';
  String email = '';
  File? image;

  UserDetailsBloc() : super(UserDetailsInitial()) {
    on<UpdateUserDetailsEvent>(updateUserDetails);
    on<UpdateUserImageEvent>(updateUserImage);
  }

  FutureOr<void> updateUserDetails(
      UpdateUserDetailsEvent event,
      Emitter<UserDetailsState> emit,
      ) {
    username = event.username;
    email = event.email;
    emit(UserDetailsLoadedState(
      username: username,
      email: email,
      image: image,
    ));
  }

  FutureOr<void> updateUserImage(
      UpdateUserImageEvent event,
      Emitter<UserDetailsState> emit,
      ) {
    image = event.image;
    emit(UserDetailsLoadedState(
      username: username,
      email: email,
      image: image,
    ));
  }
}
