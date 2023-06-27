import 'package:flutter/material.dart';
import 'package:shop_app_clean_arch/features/product/domain/entities/product_entitiy.dart';

class ListProductsWidget extends StatelessWidget {
  final List<ProductEntity> products;
  const ListProductsWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return _productItem(model: products);
      },
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(thickness: 1),
    );
  }
}

Widget _productItem({required var model}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: Colors.grey.withOpacity(0.2),
    ),
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.network(
            model.image!,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          model.name!,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              overflow: TextOverflow.ellipsis),
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "${model.price!} \$",
                        style:const TextStyle(fontSize: 13),
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "${model.oldPrice!} \$",
                      style:const TextStyle(
                          color: Colors.grey,
                          fontSize: 12.5,
                          decoration: TextDecoration.lineThrough),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              child: const Icon(
                Icons.shopping_basket,
                size: 20,
                //  color: cubit.favoritesID.contains(model.id.toString())? Colors.red : Colors.grey,
              ),
              onTap: () {
                // Add | remove product favorites
                //        cubit.addOrRemoveFromFavorites(productID: model.id.toString());
              },
            )
          ],
        )
      ],
    ),
  );
}
