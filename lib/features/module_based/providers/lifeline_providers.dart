import 'package:flutter_riverpod/flutter_riverpod.dart';

final lifelineProvider = StateNotifierProvider<LifelineController, int>(
    (ref) => LifelineController(5));

class LifelineController extends StateNotifier<int> {
  LifelineController(super.state);

  void decrease() {
    if (state == 0) return;
    state = state - 1;
  }

  void set() {
    state = 5;
  }

  int available() {
    return state;
  }
}
