import 'package:cart_cubit_sat28/cubits/cart_cubit.dart';
import 'package:cart_cubit_sat28/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatelessWidget {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              // if(state is ItemIsAdded) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: badges.Badge(
                  badgeContent: Text(
                    context.read<CartCubit>().listOfCartItem.length.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  showBadge: true,
                  position: badges.BadgePosition.topEnd(top: -5, end: 4),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartScreen()));
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                    ),
                  ),
                ),
              );
              // }
            },
          ),
        ],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: context.watch<CartCubit>().productList.length,
        itemBuilder: (context, index) {
          final productItem = context.watch<CartCubit>().productList[index];

          return ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: productItem.color,
              ),
              height: 40,
              width: 40,
            ),
            title: Text(productItem.name),
            subtitle: Text('\$${productItem.price}'),
            trailing: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return TextButton(
                  onPressed: () {
                    context.read<CartCubit>().addToCart(productItem);
                  },
                  child: productItem.isAdd ? Icon(Icons.add) : Text('Add'),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
