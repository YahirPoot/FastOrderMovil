import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/index.dart';
import '../../../../domain/index.dart';
import '../../../bloc/index.dart';
import '../../../utils/index.dart';

class DishesListView extends StatelessWidget {
  const DishesListView({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final ResponsiveTextGroup priceGroup = ResponsiveTextGroup();
    return BlocBuilder<AvailableDishesBloc, AvailableDishesState>(
      builder: (context, state) {
        if (state.isFetching) {
          // Mostrar shimmer mientras se cargan los datos
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const ShimmerSlideDish(),
              childCount: 5, // Número de elementos en el shimmer
            ),
          );
        }
        
        if (state.errorMessage.isNotEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: ResponsiveText(
                text: state.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        }
        
        final dishes = state.availableDishes ?? [];
    
        if (dishes.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: ResponsiveText(
                text: 'No hay platillos disponibles',
                style: textBlack.copyWith(
                  fontSize: scaleFont(16, context),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        }
        
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final dish = dishes[index];
              return _SlideDish(
                dish: dish,
                priceGroup: priceGroup,
              );
            },
            childCount: dishes.length,
          ),
        );
      },
    );
  }
}

class _SlideDish extends StatelessWidget {
  const _SlideDish({
    required this.dish,
    required this.priceGroup,
  });

  final Dish dish;
  final ResponsiveTextGroup priceGroup;

  @override
  Widget build(BuildContext context) {

    void goToCreateOrder(BuildContext context, {String? initialOrderQuantity}) {
      context.push(
        '/create_order?dishId=${dish.id}&orderQuantity=$initialOrderQuantity'
      );
    }

    return GestureDetector(
      onTap: () => goToCreateOrder(context), // Tap en cualquier parte de contenedor / card
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        height: 155,
        child: Card(
          color: Colors.white,
          elevation: 6,
          margin: const EdgeInsets.only(top: 4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 2, 0, 2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    dish.imageUrl ?? 'https://via.placeholder.com/100',
                    width: 155,
                    height: 155,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          
              const SizedBox(width: 16),
          
              Expanded(
                child: Column( //Quiero que este column ocupe toda la altura de la card para poder hacer un spaceAround
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveText(
                      text: '${dish.name[0].toUpperCase()}${dish.name.substring(1)}',
                      style: textBlack.copyWith(
                        fontSize: scaleFont(18, context),
                        fontWeight: FontWeight.w800,
                      ),
                      maxLines: 1,
                    ),
                    ResponsiveText(
                      text: _formatAvailableServings(dish.availableServings),
                      style: textBlack.copyWith(
                        fontSize: scaleFont(18, context),
                      ),
                      maxLines: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: GestureDetector(
                            onTap: () => goToCreateOrder(context, initialOrderQuantity: '1'),
                            behavior: HitTestBehavior.translucent,
                            child: ResponsiveText(
                              text: 'R:\$${dish.pricePerServing.toStringAsFixed(0)}',
                              style: textOrangeApp.copyWith(
                                fontSize: scaleFont(16, context),
                                fontWeight: FontWeight.w800,
                              ),
                              group: priceGroup,
                            ),
                          ),
                        ),
                          
                        ResponsiveText(text: ' | ' , 
                          style: TextStyle(
                            color: Colors.grey
                          )),
                          
                        Flexible(
                          child: GestureDetector(
                            onTap: () => goToCreateOrder(context, initialOrderQuantity: '0.5'),
                            behavior: HitTestBehavior.translucent,
                            child: ResponsiveText(
                              text: 'M:\$${dish.pricePerHalfServing.toStringAsFixed(0)}',
                              style: textOrange400.copyWith(
                                fontSize: scaleFont(16, context),
                                fontWeight: FontWeight.w800,
                              ),
                              group: priceGroup,
                            ),
                          ),
                        ),
                          
                      ],
                    ),
                  ],
                ),
              ),
              
              IconButton(
                onPressed: null,
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined, // Ícono de carrito de compras
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerSlideDish extends StatelessWidget {
  const ShimmerSlideDish({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      height: 155,
      child: Card(
        color: Colors.white,
        elevation: 6,
        margin: const EdgeInsets.only(top: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            // Imagen shimmer
            Padding(
              padding: const EdgeInsets.fromLTRB(2, 2, 0, 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ShimmerAdapter.createShimmer(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 155,
                    height: 155,
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Contenido shimmer
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título shimmer
                  ShimmerAdapter.createShimmer(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 16,
                      width: double.infinity,
                      color: Colors.grey[300],
                    ),
                  ),
                  // Subtítulo shimmer
                  ShimmerAdapter.createShimmer(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 14,
                      width: 150,
                      color: Colors.grey[300],
                    ),
                  ),
                  // Precios shimmer
                  Row(
                    children: [
                      Expanded(
                        child: ShimmerAdapter.createShimmer(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 14,
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ResponsiveText(text: ' | ' , 
                        style: TextStyle(
                          color: Colors.grey
                        )),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ShimmerAdapter.createShimmer(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 14,
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _formatAvailableServings(double availableServings) {
  if (availableServings == 1) {
    return '1 racion disponible';
  } else if (availableServings == 1.5) {
    return '1 racion y\n media disponible';
  } else if (availableServings % 1 == 0.5) {
    return '${availableServings.floor()} raciones y\n media disponibles';
  } else if (availableServings == 0) {
    return 'No hay raciones disponibles';
  } else {
    return '${availableServings.toInt()} raciones \ndisponibles';
  }
}