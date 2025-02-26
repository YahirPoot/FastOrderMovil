import 'package:fast_order/config/themes/font/font_styles.dart';
import 'package:fast_order/presentation/widgets/view/custom_container_food.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://www.cocinadelirante.com/sites/default/files/images/2024/05/como-hacer-pescado-empanizado-crujiente-al-horno.jpg',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Guisos del dia',
                      style: titleBlackF24,
                    ),
                    Text('Fecha', style: textOrangeF20),
                    Text(
                      'Raciones Disponibles',
                      style: descriptionBlackF16,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.black26,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Guisos Disponibles', style: titleBlackF24),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.black26,
                  ),
                ),
              ],
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            children: List.generate(
                4,
                (index) => const CustomContainerFood(
                      text: 'Titulo del guisado',
                      imageUrl:
                          'https://www.cocinadelirante.com/sites/default/files/images/2024/05/como-hacer-pescado-empanizado-crujiente-al-horno.jpg',
                    )),
          ),
        ],
      ),
    );
  }
}
