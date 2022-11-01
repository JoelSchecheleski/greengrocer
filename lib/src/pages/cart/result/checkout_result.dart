import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_result.freezed.dart';

@freezed
class CheckoutResult<T> with _$CheckoutResult<T> {
  factory CheckoutResult.success(T data) = Success;
  factory CheckoutResult.error(String message) = Error;
}
