part of 'subcategory_bloc.dart';

@immutable
abstract class SubcategoryEvent {}

class PassidEvent extends SubcategoryEvent {
  final String? id;
  PassidEvent(this.id);
}
