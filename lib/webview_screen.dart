import 'dart:developer'; // For proper logging
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WebView")),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse("https://bookmyworkers.com"), // Using Uri instead of WebUri
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onLoadStart: (controller, url) {
          log("Started loading: $url"); // Replacing print with log
        },
        onProgressChanged: (controller, progress) {
          log("Progress: $progress%"); // Replacing print with log
        },
      ),
    );
  }
}
