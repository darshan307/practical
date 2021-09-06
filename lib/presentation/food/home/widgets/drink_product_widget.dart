import 'package:astro/domain/model/product_model.dart';
import 'package:astro/model/food_data_model.dart';
import 'package:astro/model/get_drink_data.dart';
import 'package:astro/presentation/themes/color_constants.dart';
import 'package:astro/presentation/themes/text_style_constants.dart';
import 'package:astro/presentation/widgets/components/spacings.dart';
import 'package:flutter/material.dart';

class DrinkProductWidget extends StatelessWidget {
  final Drinks productModel;

  final GestureTapCallback? onTap;
  const DrinkProductWidget({Key? key, required this.productModel, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(productModel.strDrinkThumb ??
                        'https://googleflutter.com/sample_image.jpg'),
                    fit: BoxFit.cover)),
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 8),
            width: double.infinity,
            height: height * .35,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(Spacings.small, 3, 0, 0),
            child: Text(
              productModel.strDrink ?? '',
              style: TextStyleConstants.titleTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 4, 0, Spacings.small),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  color: ColorConstants.red,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  '4.6',
                  style: TextStyleConstants.titleTextStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
