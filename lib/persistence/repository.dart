import 'package:astro/domain/model/get_categories.dart';
import 'package:astro/model/food_data_model.dart';
import 'package:astro/model/get_drink_data.dart';
import 'package:astro/model/get_drinks.dart';
import 'api_provider.dart';

class Repository {
  ApiProvider appApiProvider = ApiProvider();

  Future<GetCategories> fetchFoods() => appApiProvider.fetchFoods();
  Future<GetDrinks> fetchDrinks() => appApiProvider.fetchDrinks();
  Future<FoodDataModel> fetchFoodData(String id) => appApiProvider.fetchFoodData(id);
  Future<GetDrinkData> fetchDrinkData(String id) => appApiProvider.fetchDrinkData(id);
}
