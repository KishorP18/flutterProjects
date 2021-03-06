import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingCart/blocs/product_bloc/products_bloc.dart';
import 'package:shoppingCart/widgets/pdt_item.dart';

class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
      if (state is ProductsLoading) {
        return CircularProgressIndicator();
      }
      if (state is ProductsLoaded) {
        return GridView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.product.items.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext ctx, int i) {
            //value: state.product.items[i]
            return PdtItem(
                id: state.product.items[i].id,
                name: state.product.items[i].name,
                imageUrl: state.product.items[i].imgUrl,
                items: state.product.items[i],
                category: state.product.items[i].category,
                price: state.product.items[i].price,
                description: state.product.items[i].description);
          },
        );
      }
      return CircularProgressIndicator();
    });
  }
}
