import 'package:bloc_sample_application/cart/screen/cart_screen.dart';
import 'package:bloc_sample_application/cart_bloc/cart_state.dart';
import 'package:bloc_sample_application/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart_bloc/cart_bloc.dart';

class FloatingCart extends StatelessWidget {
  const FloatingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
       
        return FittedBox(
          child: Stack(
            alignment: const Alignment(1.4, -1.5),
            children: [
              FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                      return const CartPage();
                    }));
                  },
                  backgroundColor: Color.fromARGB(255, 237, 232, 217),
                  enableFeedback: true,
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text(
                    'Cart',
                    style: MyTextStyle.buttonTextBlack,
                  )),
              state.count>0?Container(
                padding: const EdgeInsets.all(8),
                constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 5,
                        color: Colors.black.withAlpha(50))
                  ],
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(state.count.toString(),
                      style: const TextStyle(color: Colors.white)),
                ),
              ):Container()
            ],
          ),
        );
      },
    );
  }
}
