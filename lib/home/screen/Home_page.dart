import 'package:bloc_sample_application/cart_bloc/cart_state.dart';
import 'package:bloc_sample_application/cart_bloc/cart_bloc.dart';
import 'package:bloc_sample_application/home/widget/floating_cart.dart';
import 'package:bloc_sample_application/home_bloc/home_cubit.dart';
import 'package:bloc_sample_application/home_bloc/home_state.dart';
import 'package:bloc_sample_application/login/login_screen.dart';
import 'package:bloc_sample_application/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../cart_bloc/cart_events.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            leading: IconButton(
                onPressed: () async {
                  await logOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: ((context) => LoginScreen())));
                },
                icon: const Icon(Icons.logout)),
            centerTitle: true,
            backgroundColor: Colors.black,
            title: const Text(
              'Home',
              style: MyTextStyle.buttonText,
            ),
          ),
          body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeProductsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeProductsLoadedState) {
                return GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(state.allProducts.length, (index) {
                    final data = state.allProducts[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.network(
                          data.image,
                          height: 70,
                          width: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: SizedBox(
                            height: 40,
                            child: Text(data.title)),
                        ),
                        Text(
                          '₹${data.price}',
                          style: MyTextStyle.buttonTextBlack,
                        ),
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            return CupertinoButton.filled(
                                                            
                                child: const Text('Add'),
                                onPressed: () {
                                  BlocProvider.of<CartBloc>(context).add(
                                      CartIncrementEvent(
                                          title: data.title,
                                          image: data.image,
                                          price: data.price));
                                }
                                );
                          },
                        ),
                      ],
                    );
                  }),
                );
              } else {
                return const Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Unknown Error Occured',
                      style: MyTextStyle.errorText,
                    ),
                  ],
                ));
              }
            },
          ),
          floatingActionButton: const FloatingCart()),
    );
  }

  Future<void> logOut() async {
    final shared = await SharedPreferences.getInstance();
    shared.setBool('Login', false);
  }
}
