import 'package:fast_order/config/index.dart';
import 'package:fast_order/presentation/widgets/index.dart';
import 'package:flutter/material.dart';

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
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
      child: Column( //este column tiene el constraint de la caja de bienvenida.
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Título Guisos del día
          Expanded( //expanded para que tenga el constraint de la caja de bienvenida.
          flex: 5,
            child: Column( 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Flexible(
                  flex: 2,
                  child: ResponsiveText(
                    text:'Guisos',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      height: 0.85,
                      letterSpacing: .5,
                    ),
                    // minFontSize: 8,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: ResponsiveText(
                    text:'del día',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                      color: Colors.black87,
                    ),
                    // minFontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          //* Fecha
          Expanded(
            flex: 2,
            child: CustomDate( width: width, )
            ),
    
          //* Num. Raciones disponibles + Platillos disponibles
          Expanded(//expanded para que tenga el constraint de la caja de bienvenida.
          flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: ResponsiveText(
                    text:'20',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: colorList[0],
                    ),
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 24,
                    maxLines: 1,
                  ),
                ),

                Flexible(
                  flex: 6,
                  child: ResponsiveText(
                    text:'Platillos\ndisponibles',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                      height: 0.95,
                    ),
                    maxFontSize: 12,
                    minFontSize: 10,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}