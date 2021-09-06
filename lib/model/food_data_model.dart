/// meals : [{"strMeal":"Beef and Mustard Pie","strMealThumb":"https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg","idMeal":"52874"},{"strMeal":"Beef and Oyster pie","strMealThumb":"https://www.themealdb.com/images/media/meals/wrssvt1511556563.jpg","idMeal":"52878"},{"strMeal":"Beef Dumpling Stew","strMealThumb":"https://www.themealdb.com/images/media/meals/uyqrrv1511553350.jpg","idMeal":"52873"},{"strMeal":"Beef Lo Mein","strMealThumb":"https://www.themealdb.com/images/media/meals/1529444830.jpg","idMeal":"52952"},{"strMeal":"Beef Rendang","strMealThumb":"https://www.themealdb.com/images/media/meals/bc8v651619789840.jpg","idMeal":"53053"},{"strMeal":"Beef Sunday Roast","strMealThumb":"https://www.themealdb.com/images/media/meals/ssrrrs1503664277.jpg","idMeal":"52824"},{"strMeal":"Bitterballen (Dutch meatballs)","strMealThumb":"https://www.themealdb.com/images/media/meals/lhqev81565090111.jpg","idMeal":"52979"},{"strMeal":"Braised Beef Chilli","strMealThumb":"https://www.themealdb.com/images/media/meals/uuqvwu1504629254.jpg","idMeal":"52826"},{"strMeal":"Egyptian Fatteh","strMealThumb":"https://www.themealdb.com/images/media/meals/rlwcc51598734603.jpg","idMeal":"53031"},{"strMeal":"Massaman Beef curry","strMealThumb":"https://www.themealdb.com/images/media/meals/tvttqv1504640475.jpg","idMeal":"52827"},{"strMeal":"Moussaka","strMealThumb":"https://www.themealdb.com/images/media/meals/ctg8jd1585563097.jpg","idMeal":"53006"},{"strMeal":"Mulukhiyah","strMealThumb":"https://www.themealdb.com/images/media/meals/x372ug1598733932.jpg","idMeal":"53029"},{"strMeal":"Red Peas Soup","strMealThumb":"https://www.themealdb.com/images/media/meals/sqpqtp1515365614.jpg","idMeal":"52941"},{"strMeal":"Steak and Kidney Pie","strMealThumb":"https://www.themealdb.com/images/media/meals/qysyss1511558054.jpg","idMeal":"52881"},{"strMeal":"Szechuan Beef","strMealThumb":"https://www.themealdb.com/images/media/meals/1529443236.jpg","idMeal":"52950"},{"strMeal":"Traditional Croatian Goulash","strMealThumb":"https://www.themealdb.com/images/media/meals/n1hcou1628770088.jpg","idMeal":"53057"}]

class FoodDataModel {
  List<Meals>? _meals;

  List<Meals>? get meals => _meals;

  FoodDataModel({
      List<Meals>? meals}){
    _meals = meals;
}

  FoodDataModel.fromJson(dynamic json) {
    if (json['meals'] != null) {
      _meals = [];
      json['meals'].forEach((v) {
        _meals?.add(Meals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_meals != null) {
      map['meals'] = _meals?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// strMeal : "Beef and Mustard Pie"
/// strMealThumb : "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg"
/// idMeal : "52874"

class Meals {
  String? _strMeal;
  String? _strMealThumb;
  String? _idMeal;

  String? get strMeal => _strMeal;
  String? get strMealThumb => _strMealThumb;
  String? get idMeal => _idMeal;

  Meals({
      String? strMeal, 
      String? strMealThumb, 
      String? idMeal}){
    _strMeal = strMeal;
    _strMealThumb = strMealThumb;
    _idMeal = idMeal;
}

  Meals.fromJson(dynamic json) {
    _strMeal = json['strMeal'];
    _strMealThumb = json['strMealThumb'];
    _idMeal = json['idMeal'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['strMeal'] = _strMeal;
    map['strMealThumb'] = _strMealThumb;
    map['idMeal'] = _idMeal;
    return map;
  }

}