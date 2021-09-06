import 'package:astro/presentation/food/detail/bloc/detail_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailBloc extends Bloc<DetailEvent, int> {
  DetailBloc() : super(1);

  @override
  Stream<int> mapEventToState(DetailEvent event) async* {
    switch (event) {
      case DetailEvent.remove:
        yield state - 1;
        break;
      case DetailEvent.add:
        yield state + 1;
        break;
    }
  }
}
