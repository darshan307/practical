import 'dart:async';

import 'package:astro/presentation/food/detail/bloc/detail_bloc.dart';
import 'package:astro/presentation/food/detail/bloc/detail_event.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockDetailBloc extends MockBloc<DetailEvent, int> implements DetailBloc {}

void main() {
  setUpAll(() {
    registerFallbackValue<DetailEvent>(DetailEvent.add);
    registerFallbackValue<DetailEvent>(DetailEvent.remove);
  });

  mainBloc();
}

void mainBloc() {
  group('whenListen', () {
    test("Let's mock the CounterBloc's stream!", () {
      final bloc = MockDetailBloc();

      whenListen(bloc, Stream.fromIterable([0, 1, 2, 3]));

      expectLater(bloc.stream, emitsInOrder(<int>[0, 1, 2, 3]));
    });
  });

  group('Detailbloc', () {
    blocTest<MockDetailBloc, int>(
      'emits [] when nothing is added',
      build: () => MockDetailBloc(),
      expect: () => const <int>[],
    );

    blocTest<MockDetailBloc, int>(
      'emits [1] when CounterEvent.increment is added',
      build: () => MockDetailBloc(),
      act: (bloc) => bloc.add(DetailEvent.add),
      expect: () => const <int>[],
    );
  });
}
