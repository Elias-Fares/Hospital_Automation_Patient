class BookAppointmentState {
  final String selectedProcedure;

  BookAppointmentState({required this.selectedProcedure});

  BookAppointmentState copyWith({
    String? selectedProcedure,
  }) {
    return BookAppointmentState(
      selectedProcedure: selectedProcedure ?? this.selectedProcedure,
    );
  }
}
