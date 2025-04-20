import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebViewScreen(),
    );
  }
}

class WebViewScreen extends StatefulWidget {
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WebView with File Upload")),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("https://your.react.app")),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        androidOnShowFileChooser: (controller, fileChooserParams) async {
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            allowMultiple: false,
            type: FileType.any,
          );

          if (result != null && result.files.single.path != null) {
            return FileChooserResult(
              paths: ['file://${result.files.single.path!}'],
              success: true,
            );
          }
          return FileChooserResult(paths: [], success: false);
        },
      ),
    );
  }
}
