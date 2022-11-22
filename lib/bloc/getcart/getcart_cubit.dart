import 'package:bloc/bloc.dart';
import 'package:ecomm_bloc/api/models/cart_model.dart';
import 'package:ecomm_bloc/api/repository/cart_repository.dart';
import 'package:meta/meta.dart';

part 'getcart_state.dart';

class GetcartCubit extends Cubit<GetcartState> {
  final CartRepository _cartRepository = CartRepository();
  GetcartCubit() : super(GetcartLoading());
  Future<void> requestCartdata() async {
    // emit(GetcartLoading());
    try {
      final UserValues values = await _cartRepository.requestCart();
      emit(GetcartSuccess(values));
    } on Exception catch (e) {
      emit(GetcartError(e));
    }
  }
}
