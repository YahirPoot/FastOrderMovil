import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/index.dart';
import '../../../../domain/index.dart';
import '../../../bloc/index.dart';

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
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        }
        
        final dishes = state.availableDishes ?? [];
    
        if (dishes.isEmpty) {
          return SliverToBoxAdapter(
            child: const Center(
              child: Text(
                'No hay platillos disponibles',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    maxLines: 1,
                    maxFontSize: 16,
                  ),
                  ResponsiveText(
                    text: _formatAvailableServings(dish.availableServings),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ResponsiveText(
                          text: 'R:\$${dish.pricePerServing.toStringAsFixed(0)}',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: colorList[0],
                          ),
                          group: priceGroup,
                        ),
                      ),
                        
                      ResponsiveText(text: ' | ' , 
                        style: TextStyle(
                          color: Colors.grey
                        )),
                        
                      Expanded(
                        child: ResponsiveText(
                          text: 'M:\$${dish.pricePerHalfServing.toStringAsFixed(0)}',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.orange[400],
                          ),
                          group: priceGroup,
                        ),
                      ),
                        
                    ],
                  ),
                ],
              ),
            ),
            
            IconButton(
              onPressed: () {
                // Acción al presionar el ícono
              },
              icon: const Icon(
                Icons.arrow_forward_ios_outlined, // Ícono de carrito de compras
                color: Colors.grey,
              ),
            ),
          ],
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