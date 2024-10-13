import 'package:bloc/bloc.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int teamA = 0;
  int teamB = 0;

  CounterCubit() : super(CounterInitialState());

  void incrementTeamA(int points) {
    teamA += points;
    emit(CounterAIncrementState(teamA: teamA, teamB: teamB));
  }

  void incrementTeamB(int points) {
    teamB += points;
    emit(CounterBIncrementState(teamA: teamA, teamB: teamB));
  }
}
