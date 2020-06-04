class VerifyShoppingCartStatus {
  final _value;

  const VerifyShoppingCartStatus._internal(this._value);

  String toString() => _value;

  static const CUSTOMER_NOT_FOUND =
      VerifyShoppingCartStatus._internal('CUSTOMER_NOT_FOUND');
  static const ERROR_CONSULTING_MICROSERVICE =
      VerifyShoppingCartStatus._internal('ERROR_CONSULTING_MICROSERVICE');
  static const NO_DATA_FOUND =
      VerifyShoppingCartStatus._internal('NO_DATA_FOUND');
  static const SESSION_EXPIRED =
      VerifyShoppingCartStatus._internal('SESSION_EXPIRED');
  static const INTERNAL_ERROR =
      VerifyShoppingCartStatus._internal('INTERNAL_ERROR');
  static const NO_CART_DETAIL_COUPON_FOUND =
      VerifyShoppingCartStatus._internal('NO_CART_DETAIL_COUPON_FOUND');
  static const AMOUNT_IS_MAJOR =
      VerifyShoppingCartStatus._internal('AMOUNT_IS_MAJOR');
  static const EXPERIENCES_NOT_EXIST =
      VerifyShoppingCartStatus._internal('EXPERIENCES_NOT_EXIST');
  static const INSUFFICIENT_COUPON_AMOUNT =
      VerifyShoppingCartStatus._internal('INSUFFICIENT_COUPON_AMOUNT');

  static const VALIDATION_COUPON_AMOUNT =
      VerifyShoppingCartStatus._internal('VALIDATION_COUPON_AMOUNT');

  static const CART_WITHOUT_EXPERIENCES =
      VerifyShoppingCartStatus._internal('CART_WITHOUT_EXPERIENCES');

  static const USER_DOES_NOT_EXIST =
      VerifyShoppingCartStatus._internal('USER_DOES_NOT_EXIST');

  static const WALLET_DOES_NOT_EXIST =
      VerifyShoppingCartStatus._internal('WALLET_DOES_NOT_EXIST');

  static const CART_DOES_NOT_EXIST =
      VerifyShoppingCartStatus._internal('CART_DOES_NOT_EXIST');

  static const CART_OUT_OF_TIME =
      VerifyShoppingCartStatus._internal('CART_OUT_OF_TIME');

  static final _values = <String, VerifyShoppingCartStatus>{
    'CUSTOMER_NOT_FOUND': VerifyShoppingCartStatus.CUSTOMER_NOT_FOUND,
    'ERROR_CONSULTING_MICROSERVICE':
        VerifyShoppingCartStatus.ERROR_CONSULTING_MICROSERVICE,
    'NO_CART_DETAIL_COUPON_FOUND':
        VerifyShoppingCartStatus.NO_CART_DETAIL_COUPON_FOUND,
    'AMOUNT_IS_MAJOR': VerifyShoppingCartStatus.AMOUNT_IS_MAJOR,
    'NO_DATA_FOUND': VerifyShoppingCartStatus.NO_DATA_FOUND,
    'SESSION_EXPIRED': VerifyShoppingCartStatus.SESSION_EXPIRED,
    'INTERNAL_ERROR': VerifyShoppingCartStatus.INTERNAL_ERROR,
    'EXPERIENCES_NOT_EXIST': VerifyShoppingCartStatus.EXPERIENCES_NOT_EXIST,
    'INSUFFICIENT_COUPON_AMOUNT':
        VerifyShoppingCartStatus.INSUFFICIENT_COUPON_AMOUNT,
    'VALIDATION_COUPON_AMOUNT':
        VerifyShoppingCartStatus.VALIDATION_COUPON_AMOUNT,
    'CART_WITHOUT_EXPERIENCES':
        VerifyShoppingCartStatus.CART_WITHOUT_EXPERIENCES,
    'USER_DOES_NOT_EXIST': VerifyShoppingCartStatus.USER_DOES_NOT_EXIST,
    'WALLET_DOES_NOT_EXIST': VerifyShoppingCartStatus.WALLET_DOES_NOT_EXIST,
    'CART_DOES_NOT_EXIST': VerifyShoppingCartStatus.CART_DOES_NOT_EXIST,
    'CART_OUT_OF_TIME': VerifyShoppingCartStatus.CART_OUT_OF_TIME,
  };

  static VerifyShoppingCartStatus getByName(String type) {
    return _values[type];
  }
}
