import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webviews extends StatefulWidget {
  Webviews({Key? key, required this.url}) : super(key: key);
  String url;
  @override
  State<Webviews> createState() => _WebviewsState();
}

class _WebviewsState extends State<Webviews> {

  WebViewController controller = WebViewController();

  @override
  void initState() {
    // TODO: implement initState
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },

        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WebViewWidget(controller: controller));
  }
}
