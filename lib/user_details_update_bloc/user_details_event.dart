part of 'user_details_bloc.dart';

abstract class UserDetailsEvent {}

class UpdateUserDetailsEvent extends UserDetailsEvent {
  final String username;
  final String email;

  UpdateUserDetailsEvent({required this.username, required this.email});
}

class UpdateUserImageEvent extends UserDetailsEvent {
  final File image;

  UpdateUserImageEvent({required this.image});
}
