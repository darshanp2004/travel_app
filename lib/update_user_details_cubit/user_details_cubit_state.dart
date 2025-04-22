import 'dart:io';

class userDetailsState{
  final String username;
  final String email;
  final File? image;

  userDetailsState({
    required this.username,
    required this.email,
    this.image,
  });

  userDetailsState copyWith({
    String? username,
    String? email,
    File? image,
  }) {
    return userDetailsState(
      username: username ?? this.username,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }
}
