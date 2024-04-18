import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/view/dashboard_tile/merchandise_widgets/feature/topbar/domain/topbar_model.dart';

class DashboardTile extends StatelessWidget {
  final Function(int)? onTap;

  const DashboardTile({super.key, this.onTap});

  Future<CrmBarModel> _loadTopbarData() async {
    try {
      const String jsonPath = 'assets/mockData/topbar.json';
      String jsonString = await rootBundle.loadString(jsonPath);

      Map<String, dynamic> jsonData = json.decode(jsonString);
      return CrmBarModel.fromJson(jsonData);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadTopbarData(),
      builder: (context, AsyncSnapshot<CrmBarModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          CrmBarModel crmBarModel = snapshot.requireData;
          debugPrint('LENGTH: ${crmBarModel.crmBars.length}');
          return SizedBox(
            height: 74,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: crmBarModel.crmBars.asMap().entries.map((entry) {
                int index = entry.key;
                CrmBar crmBarItem = entry.value;
                return InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    onTap?.call(index);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 75,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Stack(
                          children: [
                            SvgPicture.asset(
                              crmBarItem.background,
                              width: 75,
                              height: 74,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                crmBarItem.assetUrl,
                                width: 75,
                                height: 74,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        crmBarItem.title,
                        style: AppTextStyles.dashboardTileStyle12W400,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
