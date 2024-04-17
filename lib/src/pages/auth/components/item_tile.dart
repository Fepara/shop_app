import 'package:flutter/material.dart';
import 'package:shop_app/src/models/item_model.dart';
import 'package:shop_app/src/pages/auth/home/product/product_screen.dart';
import 'package:shop_app/src/services/utils_services.dart';

// ignore: must_be_immutable
class ItemTile extends StatelessWidget {
  final ItemModel item;

  ItemTile({Key? key, required this.item}) : super(key: key);

  UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Conteúdo
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (c) {
                return ProductScreen(
                  item: item,
                );
              }),
            );
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Imagem
                  Expanded(
                    child: Hero(
                      tag: item.imgUrl,
                      child: Image.asset(item.imgUrl),
                    ),
                  ),

                  // Nome
                  Text(
                    item.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Preço
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(item.price),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.green),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        //Botão de adicionar ao carrinho
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 35,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
