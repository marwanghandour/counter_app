abstract class CounterState {}

class CounterInitialState extends CounterState {
  final int teamA;
  final int teamB;

  CounterInitialState({this.teamA = 0, this.teamB = 0});
}

class CounterAIncrementState extends CounterState {
  final int teamA;
  final int teamB;

  CounterAIncrementState({required this.teamA, required this.teamB});
}

class CounterBIncrementState extends CounterState {
  final int teamA;
  final int teamB;

  CounterBIncrementState({required this.teamA, required this.teamB});
}
