
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/dashboard/menu_actions.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/legacy_app_color.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/legacy_app_textstyles.dart';
import 'package:pharmarack/gen/assets.gen.dart';

class LegacyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function onAppBarActionClick;

  const LegacyAppBar(
      {super.key, required this.title, required this.onAppBarActionClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: LegacyAppColor.bottomNavColor,
      height: preferredSize.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () => onAppBarActionClick(MenuActions.userMenuIcon),
            child: AppAssets.png.userIconMenu.image(
              
              width: 25,
              height: 25,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.justify,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: LegacyAppTextStyles.listTitleStyle16W500.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onAppBarActionClick(MenuActions.cartIcon),
            child: const Icon(
              Icons.shopping_bag_outlined,
              size: 25,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          GestureDetector(
            onTap: () => onAppBarActionClick(MenuActions.bellIcon),
            child: const Icon(
              Icons.play_circle,
              size: 25,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          GestureDetector(
            onTap: () => onAppBarActionClick(MenuActions.bellIcon),
            child: const Icon(
              Icons.notifications_none,
              size: 25,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          GestureDetector(
            onTap: () => onAppBarActionClick(MenuActions.openDrawer),
            child: const Icon(
              Icons.menu,
              size: 25,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 8,
          )
          // IconButton(onPressed: onPressed, icon: Icon(Icons.))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(61);
}
