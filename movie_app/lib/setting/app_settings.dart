import 'package:flutter/widgets.dart';

class AppSettings {
  final String securityUrl;
  final String experienceUrl;
  final String customerUrl;
  final String shoppingCartUrl;
  final String movieUrl;
  final String wellnessUrl;
  final String s3CloudFrontUrl;

  AppSettings({
    @required this.securityUrl,
    @required this.experienceUrl,
    @required this.customerUrl,
    @required this.shoppingCartUrl,
    @required this.movieUrl,
    @required this.wellnessUrl,
    @required this.s3CloudFrontUrl,
  });
}
