import 'package:bloc/bloc.dart';
import 'package:ecomm_bloc/api/models/placeorder_model.dart';
import 'package:ecomm_bloc/api/repository/cart_repository.dart';
import 'package:ecomm_bloc/exception/app_exception.dart';
import 'package:meta/meta.dart';

part 'placeorder_event.dart';
part 'placeorder_state.dart';

class PlaceorderBloc extends Bloc<PlaceorderEvent, PlaceorderState> {
  final CartRepository _cartRepository = CartRepository();
  PlaceorderBloc() : super(PlaceorderInitial()) {
    on<OrderplaceEvent>((event, emit) async {
      emit(OrderPlaceLoading());
      try {
        final placeoredr = await _cartRepository.placeorder(event.orderedItems,
            event.userId, event.quantity, event.totalOrderPrice);
        emit(OrderPlaceSuccess(placeoredr));
      } on AppException catch (e) {
        emit(OrdePlaceError(e));
      }
    });
  }
}
