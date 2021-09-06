/// drinks : [{"strCategory":"Ordinary Drink"},{"strCategory":"Cocktail"},{"strCategory":"Milk / Float / Shake"},{"strCategory":"Other/Unknown"},{"strCategory":"Cocoa"},{"strCategory":"Shot"},{"strCategory":"Coffee / Tea"},{"strCategory":"Homemade Liqueur"},{"strCategory":"Punch / Party Drink"},{"strCategory":"Beer"},{"strCategory":"Soft Drink / Soda"}]

class GetDrinks {
  List<Drinks>? _drinks;

  List<Drinks>? get drinks => _drinks;

  GetDrinks({
      List<Drinks>? drinks}){
    _drinks = drinks;
}

  GetDrinks.fromJson(dynamic json) {
    if (json['drinks'] != null) {
      _drinks = [];
      json['drinks'].forEach((v) {
        _drinks?.add(Drinks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_drinks != null) {
      map['drinks'] = _drinks?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// strCategory : "Ordinary Drink"

class Drinks {
  String? _strCategory;

  String? get strCategory => _strCategory;

  Drinks({
      String? strCategory}){
    _strCategory = strCategory;
}

  Drinks.fromJson(dynamic json) {
    _strCategory = json['strCategory'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['strCategory'] = _strCategory;
    return map;
  }

}