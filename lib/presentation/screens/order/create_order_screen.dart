import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/index.dart';
import '../../utils/index.dart';

class CreateOrderScreen extends StatelessWidget {
  const CreateOrderScreen({
    super.key,
    this.dishId,
    this.initialOrderQuantity,
  });

  final String? dishId;
  final String? initialOrderQuantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorList[0],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
          onPressed: () => context.pop(),
        ),
        automaticallyImplyLeading: false,
        title: ResponsiveText(
          textScaleFactor: 1.5,
          text: 'Crear orden',
          style: textWhite.copyWith(
            fontSize: scaleFont(16, context),
            fontWeight: FontWeight.w800,
          ),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BoxSelectionOption()
            ],
          ),
        ),
      ),
    );
  }
}

class BoxSelectionOption extends StatelessWidget { //todo: pasar a create-orden-screen widgets.
  const BoxSelectionOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: double.infinity,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Flexible(
            child: ResponsiveText(
              text: 'Tipo de pedido', //Para el constructor.
              style: TextStyle(
                fontSize: scaleFont(20, context),
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, //para el constructor.
            children: [ //pasar una lista de SelectableOption en el constructor.

              SelectableOption(
                size: size,
                isSelected: false, //bloc.state.orderType != Envio ? false : true,
                text: 'Envio',
                onTap: () {
                  // bloc.add(const ChangeOrderType(OrderType.envio));
                },
              ),
              
              SelectableOption(
                size: size,
                isSelected: true,
                text: 'Presencial',
              ),
              
            ],
          ),
            
          Divider(
            height: 10,
            color: Colors.grey[400],
          ),
            
        ],
      ),
    );
  }
}

class SelectableOption extends StatelessWidget { //todo: pasar a shared widgets
  const SelectableOption({
    super.key,
    required this.size, 
    required this.isSelected,
    required this.text,
    this.onTap,
  });

  final Size size;
  final bool isSelected;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: size.width * 0.28,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? colorList[0] : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? colorList[0] : Colors.grey[300]!,
            width: 1.2,
            //cambiar tambien el borde
          ),
        ),
        alignment: Alignment.center,
        child: ResponsiveText(
          text: text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[400],
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}