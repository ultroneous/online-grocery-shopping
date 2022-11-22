import 'package:bloc/bloc.dart';
import 'package:ecomm_bloc/api/models/getorder_model.dart';
import 'package:ecomm_bloc/api/repository/cart_repository.dart';
import 'package:meta/meta.dart';

part 'myorder_state.dart';

class MyorderCubit extends Cubit<MyorderState> {
  final CartRepository _cartRepository = CartRepository();
  MyorderCubit() : super(MyorderInitial());
  Future<void> getmyorder() async {
    emit(MyorderInitial());
    try {
      final List<OrderModel> values = await _cartRepository.getmyorder();
      emit(MyorderSuccess(values));
    } on Exception catch (e) {
      emit(MyorderError(e));
    }
  }
}
