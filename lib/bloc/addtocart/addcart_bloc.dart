import 'package:ecomm_bloc/api/models/cart_model.dart';
import 'package:ecomm_bloc/api/repository/cart_repository.dart';
import 'package:ecomm_bloc/exception/app_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

part 'addcart_event.dart';
part 'addcart_state.dart';

class AddcartBloc extends Bloc<AddcartEvent, AddcartState> {
  final CartRepository _cartRepository = CartRepository();
  AddcartBloc() : super(AddcartInitial()) {
    on<AddtoCartEvent>((event, emit) async {
      emit(AddCartLoading());
      try {
        final uservalues =
            await _cartRepository.requestAddtocart(event.id, event.status);
        emit(AddCartSuccess(uservalues));
      } on AppException catch (e) {
        emit(AddCartError(e));
        // Fluttertoast.showToast(msg: "unssudfgdf");
      }
    });
    on<ItemRemove>((event, emit) async {
      emit(AddCartLoading());
      try {
        final uservalues = await _cartRepository.itemremov(event.id);
        emit(AddCartSuccess(uservalues));
      } on AppException catch (e) {
        emit(AddCartError(e));
      }
    });
  }
}
