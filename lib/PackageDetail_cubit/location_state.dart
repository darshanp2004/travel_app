import 'package:travel_app/models/location_model.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final List<Location> locations;
  LocationLoaded(this.locations);
}

class LocationError extends LocationState {
  final String message;
  LocationError(this.message);
}
