import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/dashboard/menu_actions.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/profile_expandable_menu.dart';
import 'package:pharmarack/packages/core_flutter/constants/app_urls.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/drawer_router_paths.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/core_flutter/utils/url_launcher_utils.dart';
import 'package:pharmarack/packages/utils/retailer_app_constants.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/pages/order_history_page.dart';
import 'package:pharmarack/view/features/common/cubit/bottom_navigation_cubit.dart';
import 'package:pharmarack/view/features/profile/presentation/constants/my_profile_constants.dart';
import 'package:pharmarack/view/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:pharmarack/view/features/profile/presentation/cubit/profile_state.dart';
import 'package:pharmarack/view/features/profile/presentation/pages/edit_profile_dialog_screen.dart';
import 'package:pharmarack/view/features/profile/presentation/pages/edit_profile_screen.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';

/// This class [ProfilePageMobileView] which specifically used to render Mobile UI
class ProfilePageMobileView extends StatefulWidget {
  const ProfilePageMobileView({super.key});

  @override
  State<ProfilePageMobileView> createState() => _ProfilePageMobileViewState();
}

class _ProfilePageMobileViewState extends State<ProfilePageMobileView> {
  @override
  void initState() {
    initProfileCubit();
    getIt.get<ProfileCubit>().getUserInfo();
    super.initState();
  }

  @override
  void dispose() {
    clearProfileCubit();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
        bloc: getIt.get<ProfileCubit>(),
        builder: (BuildContext ctx, ProfileState state) {
          if (state is ProfileLoadingState) {
            return const Center(
              child: SpinKitFadingCircle(
                color: AppColors.blueButtonColor,
                size: 50.0,
              ),
            );
          } else if (state is ProfileEmptyState) {
            return Center(
              child: AppAssets.png.noRecordsFound.image(),
            );
          } else if (state is ProfileDataState) {
            return Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 20, bottom: 5),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${MyProfileConstants.firstName} ${MyProfileConstants.lastName}',
                                    style: AppTextStyles.style16W700Black(),
                                  ),
                                  InkWell(
                                      child: Text(context.localizedString.edit,
                                          style:
                                              AppTextStyles.blueLinkTextStyle),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const EditProfileScreen()));
                                      }),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('+91 ${MyProfileConstants.mobileNo}',
                                      style: AppTextStyles.textStyleBlack15w400(
                                              AppColors.primaryTextColor)
                                          .copyWith(fontSize: 12)),
                                  const SizedBox(width: 20),
                                  Text(MyProfileConstants.emailId,
                                      style: AppTextStyles.textStyleBlack15w400(
                                              AppColors.primaryTextColor)
                                          .copyWith(fontSize: 12)),
                                ],
                              ),
                              const SizedBox(height: 15),
                            ],
                          )),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                          child: ProfileExpandableMenu((selectedMenu) {
                            handleProfileMenuClick(context, selectedMenu,
                                getIt.get<DrawerRouterPaths>());
                          }, MyProfileConstants.getProfileMenu(context)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
          return Container();
        });
  }
}

void openEditProfileDialog(
    BuildContext context,
    String loginId,
    String businessTypeName,
    String shopFirmFullName,
    String shopAddress,
    String pinCode,
    String city,
    String state,
    int stateId,
    String telephone,
    String drugLicenseNumber,
    String drugLicenseNumber2,
    String drugLicenseNumber3,
    String gstin,
    String panNumber,
    String upiId,
    String bankName,
    String accountType,
    String bankAccountNumber,
    String bankHolderName,
    String ifscCode,
    String userFullName,
    String emailId,
    String mobileNumber,
    String imageUrl,
    int displayImagesLength) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EditProfileDialogScreen(
        loginId: loginId,
        businessTypeName: businessTypeName,
        shopFirmFullName: shopFirmFullName,
        shopAddress: shopAddress,
        pinCode: pinCode,
        city: city,
        stateName: state,
        stateId: stateId,
        telephone: telephone,
        drugLicenseNumber: drugLicenseNumber,
        drugLicenseNumber2: drugLicenseNumber2,
        drugLicenseNumber3: drugLicenseNumber3,
        gstin: gstin,
        panNumber: panNumber,
        upiId: upiId,
        bankName: bankName,
        accountType: accountType,
        bankAccountNumber: bankAccountNumber,
        bankHolderName: bankHolderName,
        ifscCode: ifscCode,
        userFullName: userFullName,
        emailId: emailId,
        mobileNumber: mobileNumber,
        imageUrl: imageUrl,
        displayImagesLength: displayImagesLength,
      ),
    ),
  );
}

void handleProfileMenuClick(
    BuildContext context, String action, DrawerRouterPaths drawerRouterPaths) {
  if (action.isEmpty) {
    return;
  }

  if (action == drawerRouterPaths.getLoginScreenPath()) {
    showAlertDialog(context, action, false);
  }

  if (action == drawerRouterPaths.getOrderHistoryPath()) {
    // getIt<BottomNavigationCubit>().updateBottomNavigationIndex(2);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OrderHistoryPage(
                  onPressBackButton: () {
                    Navigator.pop(context);
                  },
                )));
  }
  if (action == drawerRouterPaths.getFeedbackRequestDialogPath()) {
    Navigator.pushNamed(
        context, drawerRouterPaths.getFeedbackRequestDialogPath());
  }
  if (action == MenuActions.cartIcon) {
    /// Open cart action
  } else if (action == MenuActions.openDrawer) {
  }
  // else if (action ==
  //     drawerRouterPaths.getMyConnectionsFulfillmentPartners()) {
  //   Navigator.pushNamed(
  //       context, drawerRouterPaths.getMyConnectionsFulfillmentPartners());
  // }
  // else if (action == drawerRouterPaths.getOrderNowBounced()) {
  //   Navigator.pushNamed(context, drawerRouterPaths.getOrderNowBounced());
  // }
  else if (action == drawerRouterPaths.getMyConnectionsDistributors()) {
    Navigator.pushNamed(context, RoutePaths.distributorConnection);
  }
  // else if (action == drawerRouterPaths.getOtherFeaturesCart()) {
  //   Navigator.pushNamed(context, drawerRouterPaths.getOtherFeaturesCart());
  // }
  else if (action == drawerRouterPaths.getEmailUs()) {
    launchSupportEmail(context, RetailerAppConstants.supportEmail);
  } else if (action == drawerRouterPaths.getCallUs()) {
    launchMobileNumber(RetailerAppConstants.customerCareNumber);
  } else if (action == drawerRouterPaths.getPrivacyPolicy()) {
    launchGenericUrl(context, RetailerAppConstants.privacyPolicy);
  }
  // else if (action == drawerRouterPaths.getSearchProductPath()) {
  //   Navigator.pushNamed(context, drawerRouterPaths.getSearchProductPath());
  // }
  else if (action == AppUrls.termsAndConditionsUrl) {
    urlLauncher(AppUrls.termsAndConditionsUrl);
  } else if (action == drawerRouterPaths.getChangePassword()) {
    Navigator.pushNamed(context, drawerRouterPaths.getChangePassword());
  } else if (action == drawerRouterPaths.getOrderNowStockistPriority()) {
    Navigator.pushNamed(
        context, drawerRouterPaths.getOrderNowStockistPriority());
  }
  // else if (action == drawerRouterPaths.getOrderNowCashbackDeals()) {
  //   Navigator.pushNamed(context, drawerRouterPaths.getOrderHistoryPath());
  // }
  else if (action == drawerRouterPaths.getRewardsPath()) {
    // Navigator.pushNamed(context, drawerRouterPaths.getRewardsPath());
  }
}
