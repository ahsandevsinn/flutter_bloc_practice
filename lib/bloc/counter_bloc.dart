import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice/bloc/counter_event.dart';
import 'package:flutter_bloc_practice/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementEvent>(_increment);
  }
  void _increment(IncrementEvent event, Emitter<CounterState> emit) {
    emit(state.copywith(count: state.count + 1));
  }
}
