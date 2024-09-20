import 'package:bloc_sample_application/api/api_functions.dart';
import 'package:bloc_sample_application/home_bloc/home_state.dart';
import 'package:bloc_sample_application/model/products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(HomeInitialState()){
    emit(HomeProductsLoadingState());
    fetchProducts();
  }

  void fetchProducts()async{
    try{
      // print(await fetchAllProducts());
      List<ProductsModel> allProducts = await fetchAllProducts();
      emit(HomeProductsLoadedState(allProducts: allProducts));
    }catch(e){
      emit(HomeProductsLoadingFailedState(errorMessage: e.toString()));
    }

  }
}