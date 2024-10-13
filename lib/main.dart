import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/counter_cubit.dart';
import 'cubit/counter_state.dart';

void main() {
  runApp(const PointsCounter());
}

class PointsCounter extends StatelessWidget {
  const PointsCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {
        // Handle any side effects here if necessary
      },
      builder: (context, state) {
        // Get the current scores based on the state
        int teamAScore = 0;
        int teamBScore = 0;

        if (state is CounterInitialState) {
          teamAScore = state.teamA;
          teamBScore = state.teamB;
        } else if (state is CounterAIncrementState) {
          teamAScore = state.teamA;
          teamBScore = state.teamB;
        } else if (state is CounterBIncrementState) {
          teamAScore = state.teamA;
          teamBScore = state.teamB;
        }

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text('Points Counter'),
          ),
          body: Column(
            children: [
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TeamScoreColumn(
                    teamName: 'A',
                    score: teamAScore,
                    onAdd1Point: () => context.read<CounterCubit>().incrementTeamA(1),
                    onAdd2Points: () => context.read<CounterCubit>().incrementTeamA(2),
                    onAdd3Points: () => context.read<CounterCubit>().incrementTeamA(3),
                  ),
                  const SizedBox(
                    height: 420,
                    child: VerticalDivider(color: Colors.grey, thickness: 1),
                  ),
                  TeamScoreColumn(
                    teamName: 'B',
                    score: teamBScore,
                    onAdd1Point: () => context.read<CounterCubit>().incrementTeamB(1),
                    onAdd2Points: () => context.read<CounterCubit>().incrementTeamB(2),
                    onAdd3Points: () => context.read<CounterCubit>().incrementTeamB(3),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}

class TeamScoreColumn extends StatelessWidget {
  final String teamName;
  final int score;
  final VoidCallback onAdd1Point;
  final VoidCallback onAdd2Points;
  final VoidCallback onAdd3Points;

  const TeamScoreColumn({
    required this.teamName,
    required this.score,
    required this.onAdd1Point,
    required this.onAdd2Points,
    required this.onAdd3Points,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          teamName,
          style: const TextStyle(fontSize: 42),
        ),
        Text(
          '$score',
          style: const TextStyle(fontSize: 100),
        ),
        ElevatedButton(
          onPressed: onAdd1Point,
          child: const Text('Add 1 Point'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: onAdd2Points,
          child: const Text('Add 2 Points'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: onAdd3Points,
          child: const Text('Add 3 Points'),
        ),
      ],
    );
  }
}
