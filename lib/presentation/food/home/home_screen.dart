import 'package:astro/bloc/categoryBloc.dart';
import 'package:astro/constants/list_constants.dart';
import 'package:astro/constants/string_constants.dart';
import 'package:astro/domain/model/food_model.dart';
import 'package:astro/domain/model/get_categories.dart';
import 'package:astro/model/food_data_model.dart';
import 'package:astro/model/get_drink_data.dart';
import 'package:astro/model/get_drinks.dart';
import 'package:astro/presentation/food/detail/bloc/detail_bloc.dart';
import 'package:astro/presentation/food/detail/detail_screen.dart';
import 'package:astro/presentation/food/detail/drink_detail_screen.dart';
import 'package:astro/presentation/food/home/widgets/category_widget.dart';
import 'package:astro/presentation/food/home/widgets/drink_category_widget.dart';
import 'package:astro/presentation/food/home/widgets/drink_product_widget.dart';
import 'package:astro/presentation/food/home/widgets/product_widget.dart';
import 'package:astro/presentation/navigation/app_navigator.dart';
import 'package:astro/presentation/themes/color_constants.dart';
import 'package:astro/presentation/themes/text_style_constants.dart';
import 'package:astro/presentation/widgets/components/custom_text_field.dart';
import 'package:astro/presentation/widgets/components/spacings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as drop;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final FoodModel foodModel;

  const HomeScreen({Key? key, required this.foodModel}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double height, width;

  final categoriesBloc = CategoriesBloc();

  String? dropdownValue;
  TextEditingController searchFoodController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.foodModel.foodName == 'Food')
      categoriesBloc.fetchCategories();
    else
      categoriesBloc.fetchDrinks();
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            StringConstants.labelGoodMorningHello,
            style: TextStyleConstants.titleTextStyle,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: ColorConstants.black,
                ))
          ],
          backgroundColor: ColorConstants.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: Spacings.medium,
                  top: 10,
                ),
                child: Text(
                  StringConstants.labelDeliveringTo,
                  style: TextStyleConstants.subtitleTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: Spacings.medium,
                ),
                child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                    iconSize: 24,
                    hint: Text(
                      StringConstants.labelCurrentLocation,
                      style: TextStyleConstants.titleTextStyle,
                    ),
                    elevation: 16,
                    style: TextStyleConstants.titleTextStyle,
                    underline: Container(
                      height: 2,
                      color: Colors.transparent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: ListConstants.locationList
                        .map<drop.DropdownMenuItem<String>>((String value) {
                      return drop.DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: Spacings.medium,
                    bottom: Spacings.medium,
                    left: Spacings.medium,
                    right: Spacings.medium),
                child: CustomTextField(
                  textEditingController: searchFoodController,
                  hintText: StringConstants.labelSearchFood,
                  prefixWidget: Icon(
                    Icons.search,
                    color: ColorConstants.black,
                  ),
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 150,
                  margin: EdgeInsets.only(
                      top: Spacings.medium, left: Spacings.medium),
                  child: this.widget.foodModel.foodName == "Food"
                      ? StreamBuilder(
                          stream: categoriesBloc.food,
                          builder:
                              (context, AsyncSnapshot<GetCategories> snapshot) {
                            if (snapshot.hasData) {
                              this.description = snapshot.data!.categories![0].strCategoryDescription!;
                                categoriesBloc.fetchFoodData(
                                  snapshot.data!.categories![0].strCategory!);
                              return _buildHorizontalFoodView(snapshot.data!);
                            } else if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                            }
                            return Center(child: CircularProgressIndicator());
                          })
                      : StreamBuilder(
                          stream: categoriesBloc.drink,
                          builder:
                              (context, AsyncSnapshot<GetDrinks> snapshot) {
                            if (snapshot.hasData) {
                              categoriesBloc.fetchDrinkData(snapshot.data!.drinks![0].strCategory!);
                              return _buildHorizontalDrinkView(snapshot.data!);
                            } else if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                            }
                            return Center(child: CircularProgressIndicator());
                          })),
              Padding(
                padding: const EdgeInsets.only(left: Spacings.medium),
                child: Text(
                  StringConstants.labelPopularFood,
                  style: TextStyleConstants.titleTextStyle,
                ),
              ),
              SizedBox(
                height: Spacings.medium,
              ),
              _loadFoodData(this.widget.foodModel.foodName!),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalFoodView(GetCategories data) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.categories!.length,
      itemBuilder: (BuildContext context, int index) {
        return CategoryWidget(
          categoriesList: data.categories![index],
          onTap: () => {
            this.description = data.categories![index].strCategoryDescription!,
            categoriesBloc.fetchFoodData(data.categories![index].strCategory!),
          },
        );
      },
    );
  }

  var description = "";

  Widget _buildHorizontalDrinkView(GetDrinks data) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.drinks!.length,
      itemBuilder: (BuildContext context, int index) {
        return DrinkCategoryWidget(
          categoriesList: data.drinks![index],
          onTap: () =>
              categoriesBloc.fetchDrinkData(data.drinks![index].strCategory!),
        );
      },
    );
  }

  _loadFoodData(String foodName) {
    return foodName == "Food"
        ? StreamBuilder<FoodDataModel>(
            stream: categoriesBloc.foodData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.meals == null
                      ? 0
                      : snapshot.data!.meals!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return snapshot.data!.meals == null
                        ? Container()
                        : ProductWidget(
                            productModel: snapshot.data!.meals![index],
                            onTap: () {
                              AppNavigator.navigateTo(
                                  context: context,
                                  widget: BlocProvider(
                                    create: (_) => DetailBloc(),
                                    child: DetailScreen(
                                        productModel:
                                            snapshot.data!.meals![index], productDescription : description),
                                  ));
                            },
                          );
                  },
                );
                ;
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            })
        : StreamBuilder<GetDrinkData>(
        stream: categoriesBloc.drinkData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.drinks == null
                  ? 0
                  : snapshot.data!.drinks!.length,
              itemBuilder: (BuildContext context, int index) {
                return snapshot.data!.drinks == null
                    ? Container()
                    : DrinkProductWidget(
                  productModel: snapshot.data!.drinks![index],
                  onTap: () {
                    AppNavigator.navigateTo(
                        context: context,
                        widget: BlocProvider(
                          create: (_) => DetailBloc(),
                          child: DrinkDetailScreen(
                              productModel:
                              snapshot.data!.drinks![index], productDescription : description),
                        ));
                  },
                );
              },
            );
            ;
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
