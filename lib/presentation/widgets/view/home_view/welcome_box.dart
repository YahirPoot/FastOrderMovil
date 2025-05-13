import 'package:fast_order/config/index.dart';
import 'package:fast_order/presentation/bloc/index.dart';
import 'package:fast_order/presentation/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/index.dart';

class WelcomBox extends StatelessWidget {
  const WelcomBox({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    // final mq = MediaQuery.of(context);
    // print('w: ${mq.size.width}, h: ${mq.size.height}, '
    //       'DPR: ${mq.devicePixelRatio}, '
    //       'Scale: ${mq.textScaleFactor}, '
    //       'Diagonal: ${sqrt(mq.size.width * mq.size.width + mq.size.height * mq.size.height)}');
    return BlocSelector<AvailableDishesBloc, AvailableDishesState, int?>(
      selector: (state) {
        if (state.isFetching) return null;
        if (state.availableDishes == null || state.availableDishes!.isEmpty) return 0;
        return state.availableDishes!.length;
      },
      builder: (context, dishesAvailable) {
        return Container(
          width: width,
          height: height,
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* Título Guisos del día
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 2,
                      child: ResponsiveText(
                        textScaleFactor: 1.5,
                        text: 'Guisos',
                        style: TextStyle(
                          fontSize: scaleFont(28, context),
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          height: 0.95,
                          letterSpacing: 1.5,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: ResponsiveText(
                        textScaleFactor: 1.5,
                        text: 'del día',
                        style: TextStyle(
                          fontSize: scaleFont(26, context),
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                          letterSpacing: 1.5,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),

              //* Fecha
              Expanded(
                flex: 2,
                child: CustomDate(width: width),
              ),

              //* Num. Raciones disponibles + Platillos disponibles
              dishesAvailable == null
                  ? ShimmerDishesAvailableText(height: height, width: width)
                  : Expanded(
                      flex: 4,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: ResponsiveText(
                              text: '$dishesAvailable',
                              textScaleFactor: 1.5,
                              style: TextStyle(
                                fontSize: scaleFont(31, context),
                                fontWeight: FontWeight.w800,
                                color: colorList[0],
                                height: 0.8,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              minFontSize: 18,
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: ResponsiveText(
                              textScaleFactor: 1.5,
                              text: dishesAvailable == 1
                                  ? 'Platillo\ndisponible'
                                  : 'Platillos\ndisponibles',
                              style: TextStyle(
                                fontSize: scaleFont(13, context),
                                fontWeight: FontWeight.w800,
                                color: Colors.black87,
                                height: 0.95,
                              ),
                              maxFontSize: 18,
                              minFontSize: 12,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}