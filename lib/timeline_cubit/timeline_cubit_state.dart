class ShowDetailsState {
  final List<String> subStatus;
  final List<bool> isExpanded;

  ShowDetailsState({
    required this.subStatus,
    required this.isExpanded,
  });

  ShowDetailsState copyWith({
    List<String>? subStatus,
    List<bool>? isExpanded,
  }) {
    return ShowDetailsState(
      subStatus: subStatus ?? this.subStatus,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}
