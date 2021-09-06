import 'package:astro/domain/model/food_model.dart';
import 'package:astro/presentation/themes/color_constants.dart';
import 'package:astro/presentation/themes/text_style_constants.dart';
import 'package:flutter/material.dart';

class FoodTileWidget extends StatelessWidget {
  final FoodModel foodModel;
  final GestureTapCallback? onTap;
  const FoodTileWidget({Key? key, required this.foodModel, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Container(
          margin: EdgeInsets.only(left: 12),
          width: width * .90,
          height: 100,
          alignment: Alignment.topLeft,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Positioned(
                left: 30,
                child: Container(
                  padding: EdgeInsets.only(left: 65, top: 15, bottom: 15),
                  width: width * .75,
                  height: 80,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 2.0,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(150.0),
                      bottomLeft: Radius.circular(150.0),
                      topRight: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        foodModel.foodName ?? '',
                        style: TextStyleConstants.titleTextStyle,
                      ),
                      Text(
                        '${foodModel.totalItems ?? ''} items',
                        style: TextStyleConstants.subtitleTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 5,
                left: 0,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(foodModel.foodImage ??
                            'https://googleflutter.com/sample_image.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    decoration: new BoxDecoration(
                      color: ColorConstants.lightGrey,
                      borderRadius: new BorderRadius.circular(40.0),
                    ),
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                        ),
                        onPressed: () {}),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
