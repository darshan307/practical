import 'package:astro/constants/list_constants.dart';
import 'package:astro/constants/string_constants.dart';
import 'package:astro/constants/widget_key_constants.dart';
import 'package:astro/domain/model/product_model.dart';
import 'package:astro/model/food_data_model.dart';
import 'package:astro/presentation/food/detail/bloc/detail_bloc.dart';
import 'package:astro/presentation/food/detail/bloc/detail_event.dart';
import 'package:astro/presentation/food/detail/widgets/detail_tile_widget.dart';
import 'package:astro/presentation/themes/color_constants.dart';
import 'package:astro/presentation/themes/text_style_constants.dart';
import 'package:astro/presentation/widgets/components/spacings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatefulWidget {
  final Meals productModel;
  final String productDescription;

  DetailScreen({Key? key, required this.productModel, required this.productDescription}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int servings = 1;

  late DetailBloc detailBloc;
  @override
  void initState() {
    super.initState();
    detailBloc = BlocProvider.of<DetailBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: height * 0.35,
                width: width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            NetworkImage(widget.productModel.strMealThumb ?? ''))),
              ),
              Positioned(top: 30, child: BackButton()),
              Positioned(
                  top: 80,
                  left: 15,
                  child: Row(
                    children: [
                      Icon(Icons.star),
                      Text('4.5')
                    ],
                  )),
              Positioned(
                  bottom: 20,
                  left: 15,
                  child: Container(
                    padding: EdgeInsets.all(Spacings.small),
                    decoration: BoxDecoration(
                        color: ColorConstants.red,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(Icons.play_arrow),
                  )),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: BlocBuilder<DetailBloc, int>(
                  bloc: detailBloc,
                  builder: (context, state) {
                    return Container(
                      padding: EdgeInsets.all(Spacings.medium),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.comment_outlined),
                                  SizedBox(
                                    width: Spacings.small,
                                  ),
                                  Text('350')
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.star_outline),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.bookmark_outline),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.share_outlined),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Spacings.medium,
                          ),
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              itemCount: ListConstants.detailsList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin:
                                      EdgeInsets.only(right: Spacings.medium),
                                  padding: EdgeInsets.all(Spacings.small),
                                  decoration: BoxDecoration(
                                      color: index == 0
                                          ? ColorConstants.red
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                      child: Text(
                                    ListConstants.detailsList[index],
                                    style: index == 0
                                        ? TextStyleConstants.titleWhiteTextStyle
                                        : TextStyleConstants.hintTextStyle,
                                  )),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: Spacings.large,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    StringConstants.labelIngredientsFor,
                                    style: TextStyleConstants.titleTextStyle,
                                  ),
                                  SizedBox(
                                    height: Spacings.small,
                                  ),
                                  Text(
                                    state.toString() +
                                        " " +
                                        StringConstants.labelServings,
                                    style: TextStyleConstants.subtitleTextStyle,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  FloatingActionButton(
                                    key: WidgetKeyConstants.incrementButtonKey,
                                    heroTag: 'add',
                                    onPressed: () {
                                      detailBloc.add(DetailEvent.add);
                                    },
                                    mini: true,
                                    backgroundColor: ColorConstants.red,
                                    child: Icon(Icons.add),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: Spacings.small),
                                    child: Text('$state'),
                                  ),
                                  FloatingActionButton(
                                    key: WidgetKeyConstants.decrementButtonKey,
                                    heroTag: 'remove',
                                    onPressed: () {
                                      if (state > 1) {
                                        detailBloc.add(DetailEvent.remove);
                                      }
                                    },
                                    mini: true,
                                    backgroundColor: ColorConstants.red,
                                    child: Icon(Icons.remove),
                                  ),
                                ],
                              )
                            ],
                          ),
                          DetailTileWidget(
                            title: 'Flatiron steak',
                            value: '${state * 2} pound',
                            imagePath:
                                "https://embed.widencdn.net/img/beef/rnsfu27fjk/480x360px/Flat%20Iron%20Steak.psd?keep=c&u=7fueml",
                          ),
                          DetailTileWidget(
                            title: 'Fresh lemon juice',
                            value: '${state * 2} tablespoon',
                            imagePath:
                                "https://homepuff.com/wp-content/uploads/2019/04/lemon-juice.jpg",
                          ),
                          DetailTileWidget(
                            title: 'Olive oil',
                            value: '${state * 3} tablespoon',
                            imagePath:
                                "https://static.toiimg.com/thumb/74281085.cms?width=680&height=512&imgsize=1402433",
                          ),
                          DetailTileWidget(
                            title: 'Fresh parsley leaves',
                            value: '${state * 5} piece',
                            imagePath:
                                "https://post.psychcentral.com/wp-content/uploads/2020/01/parsley-herb-1200x628-facebook.jpg",
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
