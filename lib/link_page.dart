import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LinkPage extends StatefulWidget {
  const LinkPage({super.key});

  @override
  State<LinkPage> createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
  @override
  Widget build(BuildContext context) {
    int loading = 0;
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            loading = progress;
          },
          onPageStarted: (String url) {
            loading = 0;
          },
          onPageFinished: (String url) {
            loading = 100;
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse("https://github.com/Zedem-source/profile"),
      );
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 2),
            child: loading < 100
                ? LinearProgressIndicator(
                    color: Colors.black,
                    value: loading / 100,
                  )
                : const SizedBox()),
        backgroundColor: Colors.amber,
        title: const Text('Zedem-source',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
