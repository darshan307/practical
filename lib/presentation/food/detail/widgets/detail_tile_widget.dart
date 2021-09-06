import 'package:astro/presentation/themes/color_constants.dart';
import 'package:astro/presentation/themes/text_style_constants.dart';
import 'package:astro/presentation/widgets/components/spacings.dart';
import 'package:flutter/material.dart';

class DetailTileWidget extends StatefulWidget {
  final String imagePath;
  final String title;
  final String value;
  DetailTileWidget(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.value})
      : super(key: key);

  @override
  _DetailTileWidgetState createState() => _DetailTileWidgetState();
}

class _DetailTileWidgetState extends State<DetailTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacings.medium),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.imagePath,
                cacheHeight: 1024,
                cacheWidth: 1024,
                fit: BoxFit.cover,
              ),
            ),
            decoration: BoxDecoration(
              color: ColorConstants.lightGrey,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(
            width: Spacings.medium,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyleConstants.titleRegularTextStyle,
              ),
              Text(
                widget.value,
                style: TextStyleConstants.subtitleTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
