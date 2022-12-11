import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kadai_info_flutter/presentation/widget/loading_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({
    Key? key,
    required this.link,
  }) : super(key: key);

  final String link;

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  late WebViewController controller;
  bool isFinished = false;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Stack(
        children: [
          WebView(
            initialUrl: widget.link,
            javascriptMode: JavascriptMode.unrestricted,
            gestureNavigationEnabled: true,
            zoomEnabled: false,
            onPageFinished: (_) => setState(() {
              isFinished = true;
            }),
            navigationDelegate: (request) {
              if (request.url.contains('mailto')) {
                launchUrl(Uri(scheme: request.url));
                return NavigationDecision.prevent;
              } else {
                return NavigationDecision.navigate;
              }
            },
            onWebViewCreated: (controller) async {
              this.controller = controller;
            },
          ),
          if (!isFinished) const LoadingIndicator(),
        ],
      ),
    );
  }

  Future<bool> onWillPop() async {
    if (await controller.canGoBack()) {
      controller.goBack();
      return false;
    } else {
      return true;
    }
  }
}
