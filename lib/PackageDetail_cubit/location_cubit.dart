import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../models/location_model.dart';
import 'location_state.dart';
import 'package:share_plus/share_plus.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  List<Location> locations = [];

  Future<void> fetchLocations() async {
    emit(LocationLoading());
    try {
      final response = await Dio().get('https://jsonplaceholder.typicode.com/users');
      if (response.statusCode == 200) {
        var json = jsonEncode(response.data);
        locations = locationFromJson(json);
        emit(LocationLoaded(locations));
      }
    } catch (e) {
      emit(LocationError("Error : Failed to load Data "));
    }
  }

  void favorite(int index) {
    locations[index].selected = !(locations[index].selected ?? false);
    emit(LocationLoaded(locations));
  }

  void share(int index) {
    Share.share(
      'Username : ${locations[index].username}\n'
      'Name : ${locations[index].name}\n'
      'City : ${locations[index].address.city}',
    );
  }
}
