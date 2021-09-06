import 'package:astro/domain/model/get_categories.dart';
import 'package:astro/model/food_data_model.dart';
import 'package:astro/model/get_drink_data.dart';
import 'package:astro/model/get_drinks.dart';
import 'package:astro/persistence/repository.dart';
import 'package:rxdart/subjects.dart';

class CategoriesBloc {
  Repository _repository = Repository();

  final _foodFetcher = PublishSubject<GetCategories>();
  final _foodDataFetcher = PublishSubject<FoodDataModel>();
  final _drinksFetcher = PublishSubject<GetDrinks>();
  final _drinkDataFetcher = PublishSubject<GetDrinkData>();

  Stream<GetCategories> get food => _foodFetcher.stream;
  Stream<FoodDataModel> get foodData => _foodDataFetcher.stream;
  Stream<GetDrinks> get drink => _drinksFetcher.stream;
  Stream<GetDrinkData> get drinkData => _drinkDataFetcher.stream;

  fetchCategories() async {
    GetCategories foodDataResponse = await _repository.fetchFoods();
    _foodFetcher.sink.add(foodDataResponse);
  }

  fetchFoodData(String id) async {
    print(id);
    FoodDataModel weatherResponse = await _repository.fetchFoodData(id);
    _foodDataFetcher.sink.add(weatherResponse);
  }

  fetchDrinks() async {
    GetDrinks weatherResponse = await _repository.fetchDrinks();
    _drinksFetcher.sink.add(weatherResponse);
  }

  fetchDrinkData(String id) async {
    print(id);
    GetDrinkData weatherResponse = await _repository.fetchDrinkData(id);
    _drinkDataFetcher.sink.add(weatherResponse);
  }

  dispose() {
    //Close the weather fetcher
    _foodFetcher.close();
    _drinksFetcher.close();
    _foodDataFetcher.close();
    _drinkDataFetcher.close();
  }
}

final weatherBloc = CategoriesBloc();
