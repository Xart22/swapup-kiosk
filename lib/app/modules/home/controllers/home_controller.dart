import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeController extends GetxController {
  var controllerWebView = Rx<WebViewController?>(null);

  @override
  void onInit() {
    controllerWebView.value = (WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {
            print("error HTTP : ${error}");
          },
          onWebResourceError: (WebResourceError error) {
            print("error WEB : ${error.description}");
          },
          // onNavigationRequest: (NavigationRequest request) {
          //   if (request.url.startsWith('http://192.168.1.4:5173/sign-doc')) {
          //     return NavigationDecision.prevent;
          //   }
          //   return NavigationDecision.navigate;
          // },
        ),
      )
      ..loadRequest(Uri.parse('http://192.168.1.4:5173/kiosk')));

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
