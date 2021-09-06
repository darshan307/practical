import 'package:astro/constants/list_constants.dart';
import 'package:astro/constants/string_constants.dart';
import 'package:astro/presentation/food/home/home_screen.dart';
import 'package:astro/presentation/food/menu/widgets/food_tile_widget.dart';
import 'package:astro/presentation/navigation/app_navigator.dart';
import 'package:astro/presentation/themes/color_constants.dart';
import 'package:astro/presentation/themes/text_style_constants.dart';
import 'package:astro/presentation/widgets/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  TextEditingController searchController = TextEditingController();

  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.white,
        appBar: AppBar(
          title: Text(
            StringConstants.labelMenu,
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
        body: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              width: width * .3,
              height: height * .65,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16, bottom: 16, left: 24, right: 24),
                      child: CustomTextField(
                        textEditingController: searchController,
                        hintText: StringConstants.labelSearchFood,
                        prefixWidget: Icon(
                          Icons.search,
                          color: ColorConstants.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: ListConstants.foodModelList
                          .map(
                            (foodModel) => FoodTileWidget(
                          foodModel: foodModel,
                          onTap: () {
                            AppNavigator.navigateTo(
                                context: context, widget: HomeScreen(foodModel: foodModel));
                          },
                        ),
                      )
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
