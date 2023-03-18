import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_get/blocs/product_bloc.dart';
import 'package:flutter_bloc_get/detail_product.dart';
import 'package:flutter_bloc_get/models/product_model.dart';
import 'package:flutter_bloc_get/repositories/repositories.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(
        RepositoryProvider.of<ProductRepository>(context),
      )..add(ProductLoadingEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Bloc REST Api GET'),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductLoadedState) {
              List<ProductModel> products = state.products;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailProduct(
                                p: products[index],
                              )));
                    },
                    child: Card(
                        child: Row(
                      children: [
                        Image.network(
                          products[index].image,
                          width: 50,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(products[index].title),
                              Text(products[index].description),
                              Text(products[index].price.toString()),
                              Text(products[index].category),
                            ],
                          ),
                        )
                      ],
                    )),
                  );
                },
              );
            }
            if (state is ProductErrorState) {
              String error = state.error;
              return Center(
                child: Text('Error: $error'),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
