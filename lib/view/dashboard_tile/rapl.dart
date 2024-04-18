import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/loader_dialog.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/no_records_found.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

Future<String?> fetchUrlFromApi() async {
  var retailer = getIt<RetailerInfoEntity>();
  try {
    var params = {
      "Retailerid": retailer.getRetailerId(),
      "domain": retailer.displayRetailers?[0].domainKey,
      "email": "${retailer.getRetailerId()}@pr.com",
      "secret": "a5cbkT5Z7OMvRA9AjFmtV28uQ1TUpMcJRUYRwK0l",
    };

    var dio = Dio();
    final response = await dio.post(
      "https://d2rsandbox.raplqa.com/api/login/generate/token", //https://pharmaracklearn.getrapl.com/api/login/generate/token domain : pharmaracklearn for ragabh i.e. uat and prod
      options: Options(
        headers: {
          'Authorization': 'Bearer a5cbkT5Z7OMvRA9AjFmtV28uQ1TUpMcJRUYRwK0l',
          HttpHeaders.contentTypeHeader: "application/json",
        },
      ),
      data: jsonEncode(params),
    );
    if (response.statusCode == 200)
      return response.data['url'] as String;
    else {
      print('Error fetching URL: ${response.statusCode}');
      return "User not found";
    }
  } catch (e) {
    print('Error fetching URL: $e');
    return e.toString();
  }
}

class Rapl extends StatefulWidget {
  @override
  RaplState createState() => RaplState();
}

WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        return NavigationDecision.navigate;
      },
    ),
  );

class RaplState extends State<Rapl> {
  late Future<String?> _raplUrl;
  String currentUrl = "";

  @override
  void initState() {
    super.initState();
    _initializeRaplUrl();
  }

  Future<void> _initializeRaplUrl() async {
    _raplUrl = fetchUrlFromApi();
    // Make sure the WebView controller is initialized after getting the URL
    _raplUrl.then((url) {
      print("RAPL:${url!}");
      if (url != null && url.startsWith("https://d2rsandbox.raplqa.com")) {
        controller.loadRequest(Uri.parse(url));
      }
      updateUrl(url);
      //updateUrl("https://d2rsandbox.raplqa.com/w/login-url?token=eyJpdiI6InBkR0xQbllrbzc4L2x2VUN0UWRQS1E9PSIsInZhbHVlIjoiQlNrS3R0dUdPNUpjdnlOZ3JaVUVQZEtVU09uT2FVWkhnaTR2T2tFZk0zdk1hazQxRmdHOUpib0p0blRZcWhIMVZXcWZHYUxjUkRJd1gzbm1URk5UZVBlNE5xNWRUK1BvUzNXVDl6NUtIVmlmYzdZck1ueFRxRWdUQ0w5L2ZxMXBaSUJRT0kzdVg0dkNYM1VwOGRaQ2RSeVFFbm5FdFllcnd5L1h4Tm5VdW1BPSIsIm1hYyI6IjA3NjM2N2E1NmY1N2UzMjEyZjlkYTg1NjRlODMwNmJmZGY0NWM0ZjQ1MmUzMDYwMjY4NzMxZmYyMTBjYmIwMmMiLCJ0YWciOiIifQ%3D%3D");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            context.localizedString.patshala,
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: currentUrl.startsWith("https://d2rsandbox.raplqa.com")
            ? WebViewWidget(controller: controller)
            : currentUrl != ""
                ? Container(
                    color: AppColors.white,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: NoRecordsFound(
                          icons: AppAssets.png.callus.image(
                            width: 82,
                            height: 79,
                          ),
                          buttonTitle: "020-67660011",
                          message: context.localizedString.callUsMsg,
                          buttonCallBack: () {
                            launch("tel://020-67660011");
                          },
                        )))
                : LoaderDialog(
                    title: context.localizedString.patshala,
                    subTitle: context.localizedString.pleaseWait));
  }

  void updateUrl(String url) {
    setState(() {
      currentUrl = url; // Update the current URL
    });
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: Rapl(),
//   ));
// }
