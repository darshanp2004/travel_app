import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/timeline_cubit/timeline_cubit_state.dart';

class ShowDetailsCubit extends Cubit<ShowDetailsState> {
  ShowDetailsCubit()
    : super(
        ShowDetailsState(
          subStatus: [
            "Order placed at 3:00 PM",
            "Expected delivery by 5:00 PM",
          ],
          isExpanded: [false, false],
        ),
      );

  void showSubStatus(int index) {
    final updated = List<bool>.from(state.isExpanded);
    updated[index] = !updated[index];
    emit(state.copyWith(isExpanded: updated));
  }
}
