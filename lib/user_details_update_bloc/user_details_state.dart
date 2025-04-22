part of 'user_details_bloc.dart';

abstract class UserDetailsState {}

final class UserDetailsInitial extends UserDetailsState {}

class UserDetailsLoadedState extends UserDetailsState {
  final String username;
  final String email;
  final File? image;

  UserDetailsLoadedState({
    required this.username,
    required this.email,
    required this.image,
  });
}
