import 'package:astro/domain/model/food_model.dart';
import 'package:astro/domain/model/product_model.dart';

class ListConstants {
  static const List<String> locationList = <String>[
    'Current Location',
    'Ahmedabad',
    'Surat',
    'Baroda',
    'Rajkot'
  ];

  static List<FoodModel> foodModelList = [
    FoodModel(
      foodName: 'Food',
      totalItems: 5,
      foodImage:
          'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    ),
    FoodModel(
      foodName: 'Beverages',
      totalItems: 8,
      foodImage:
          'https://images.pexels.com/photos/1260968/pexels-photo-1260968.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    )
  ];

  static List<ProductModel> productModelList = [
    ProductModel(
        foodImage:
            'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
        foodName: 'Minute by tuk tuk',
        starRating: 3.5),
    ProductModel(
        foodImage:
            'https://images.pexels.com/photos/1260968/pexels-photo-1260968.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
        foodName: 'Pizza',
        starRating: 4.5),
    ProductModel(
        foodImage:
            'https://images.pexels.com/photos/5560763/pexels-photo-5560763.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
        foodName: 'Dosa',
        starRating: 5.0),
  ];

  static List<String> detailsList = ["Ingredients","Steps","Nutrition"];
}
