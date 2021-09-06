import 'dart:io';

import 'package:astro/constants/widget_key_constants.dart';
import 'package:astro/domain/model/product_model.dart';
import 'package:astro/model/food_data_model.dart';
import 'package:astro/presentation/food/detail/bloc/detail_bloc.dart';
import 'package:astro/presentation/food/detail/bloc/detail_event.dart';
import 'package:astro/presentation/food/detail/detail_screen.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCounterBloc extends MockBloc<DetailEvent, int> implements DetailBloc {}


void main() {
  late DetailBloc detailBloc;


    setUpAll(() {
      HttpOverrides.global = null;
      registerFallbackValue<DetailEvent>(DetailEvent.add);
      registerFallbackValue<DetailEvent>(DetailEvent.remove);

    detailBloc = MockCounterBloc();
  });

  group('Detail Screen', () {
    testWidgets('renders current CounterCubit state', (tester) async {
      when(() => detailBloc.state).thenReturn(1);
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: detailBloc,
            child: DetailScreen(
              productModel:  Meals(
                  strMealThumb:
                  'https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                  strMeal: 'Dosa',
                  ),
              productDescription: "",
            ),
          ),
        ),
      );

      expect(find.text('1'), findsWidgets);
    });

    testWidgets('tapping increment button invokes increment', (tester) async {
      when(() => detailBloc.state).thenReturn(1);
      when(() => detailBloc.add(DetailEvent.add)).thenReturn(() {});
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: detailBloc,
            child:   DetailScreen(
          productModel:  Meals(
          strMealThumb:
          'https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
              strMeal: 'Dosa'),
              productDescription: "",
        ),
          ),
        ),
      );
      await tester.tap(find.byKey(WidgetKeyConstants.incrementButtonKey));
      verify(() => detailBloc.add(DetailEvent.add)).called(1);
    });

    testWidgets('tapping decrement button invokes decrement', (tester) async {
      when(() => detailBloc.state).thenReturn(1);
      when(() => detailBloc.add(DetailEvent.remove)).thenReturn(() {});
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: detailBloc,
            child:  DetailScreen(
              productModel:  Meals(
                  strMealThumb:
                  'https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                  strMeal: 'Dosa'),
              productDescription: "",
            ),
          ),
        ),
      );
      final decrementFinder = find.byKey(WidgetKeyConstants.decrementButtonKey);
      await tester.ensureVisible(decrementFinder);
      await tester.tap(decrementFinder);
      verify(() => detailBloc.add(DetailEvent.remove)).called(1);
    },skip:true);
  });
}