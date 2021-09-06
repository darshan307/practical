import 'dart:convert';
import 'package:astro/domain/model/get_categories.dart';
import 'package:astro/model/food_data_model.dart';
import 'package:astro/model/get_drink_data.dart';
import 'package:astro/model/get_drinks.dart';
import 'package:http/http.dart' show Client;

class ApiProvider {
  Client client = Client();

  final _baseUrl =
      "https://themealdb.com/api/json/v1/1/";

  final _baseUrl2 =
      "https://www.thecocktaildb.com/api/json/v1/1/";

  Future<GetCategories> fetchFoods() async {
    final response = await client.get(Uri.parse('$_baseUrl'+'categories.php')); // Make the network call asynchronously to fetch the London weather data.
    print(response.body.toString());
    if (response.statusCode == 200) {
      return GetCategories.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<GetDrinks> fetchDrinks() async {
    final response = await client.get(Uri.parse('$_baseUrl2'+'list.php?c=list')); // Make the network call asynchronously to fetch the London weather data.
    print(response.body.toString());
    if (response.statusCode == 200) {
      return GetDrinks.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<FoodDataModel> fetchFoodData(String id) async {
    final response = await client.get(Uri.parse('$_baseUrl'+"filter.php?i=$id")); // Make the network call asynchronously to fetch the London weather data.
    print(response.body.toString());
    if (response.statusCode == 200) {
      return FoodDataModel.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<GetDrinkData> fetchDrinkData(String id) async {
    final response = await client.get(Uri.parse('$_baseUrl2'+"filter.php?c=$id")); // Make the network call asynchronously to fetch the London weather data.
    print(response.body.toString());
    if (response.statusCode == 200) {
      return GetDrinkData.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load weather');
    }
  }

}