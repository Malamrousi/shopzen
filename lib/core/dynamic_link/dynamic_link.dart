import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shopzen/core/di/di.dart';
import 'package:shopzen/core/routes/route_name.dart';

class DynamicLink {
  DynamicLink._();
  factory DynamicLink() {
    return _instance;
  }
  static final DynamicLink _instance = DynamicLink._();

  final link = dotenv.env['DYNAMIC_LINK'] ?? "";

  Future<String> getDynamicLink({
    required int productId,
    required String productTitle,
    required String productImage,
    required String productDescription,
  }) async {
    final dynamicLinkParams = await DynamicLinkParameters(
        link: Uri.parse("$link/$productId"),
        uriPrefix: link,
        androidParameters: const AndroidParameters(
          packageName: 'com.shopzen.app',
          minimumVersion: 1,
        ),
        iosParameters: IOSParameters(
          bundleId: 'com.shopzen.app',
          minimumVersion: '1',
        ),
        socialMetaTagParameters: SocialMetaTagParameters(
            title: productTitle,
            imageUrl: Uri.parse(productImage),
            description: productDescription));

    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);

    return dynamicLink.shortUrl.toString();
  }

  Future<void> initDynamicLink() async {
    final initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
    if (initialLink != null) {
      Future.delayed(const Duration(seconds: 1), () {
        openDynamicLink(initialLink.link.path);
      });
    }
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      //Foreground
      final path = dynamicLinkData.link.path;
      Future.delayed(const Duration(seconds: 1), () {
        openDynamicLink(path);
      });
      print(path);
    }).onError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> openDynamicLink(String path) async {
    final splitLink = path.split('/');
    getIt.get<GlobalKey<NavigatorState>>().currentState!.pushNamed(
          RouteName.productDetails,
          arguments: int.parse(splitLink[1]),
        );
  }
}
