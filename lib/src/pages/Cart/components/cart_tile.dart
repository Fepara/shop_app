import 'package:flutter/material.dart';
import 'package:shop_app/src/models/cart_item_model.dart';
import 'package:shop_app/src/services/utils_services.dart';
import '../../common_widget/quantity_widget.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;

  const CartTile({
    Key? key,
    required this.cartItem,
    required this.remove,
  }) : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        // Imagem
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),

        // Titulo
        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),

        // Total
        subtitle: Text(
          utilsServices.priceToCurrency(widget.cartItem.totalPrice()),
          style:
              const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),

        // Quantidade
        trailing: QuantityWidget(
          suffixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          result: (quantity) {
            setState(
              () {
                widget.cartItem.quantity = quantity;

                if (quantity == 0) {
                  // Remover item do carrinho
                  widget.remove(widget.cartItem);
                }
              },
            );
          },
          isRemovable: true,
        ),
      ),
    );
  }
}
