import 'package:astro/domain/model/food_model.dart';
import 'package:astro/domain/model/get_categories.dart';
import 'package:astro/presentation/themes/text_style_constants.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final Categories categoriesList;
  final GestureTapCallback? onTap;
  const CategoryWidget({Key? key, required this.categoriesList, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
                image: DecorationImage(
                    image: NetworkImage(categoriesList.strCategoryThumb ??
                        'https://googleflutter.com/sample_image.jpg'),
                    fit: BoxFit.cover)),
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 100,
            height: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            categoriesList.strCategory ?? '',
            style: TextStyleConstants.subtitleTextStyle,
          )
        ],
      ),
    );
  }
}
