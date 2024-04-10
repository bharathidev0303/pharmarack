import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/profile/presentation/constants/my_profile_constants.dart';
import 'package:pharmarack/view/profile/presentation/cubit/profile_state.dart';
import 'package:pharmarack/view/profile/presentation/demain/model/profile_model.dart';

/// This class [ProfileCubit] is consume by the [ProfilePage]
/// where all state will observed by [ProfilePage]
class ProfileCubit extends Cubit<ProfileState> {
  RetailerInfoEntity retailerInfoEntity = onboardingDI<RetailerInfoEntity>();

  ProfileCubit() : super(ProfileInitialState());

  Future<void> getUserInfo() async {
    emit(ProfileLoadingState());
    String loginId = MyProfileConstants.loginId =
        retailerInfoEntity.userId?.toString() ?? '';
    String businessType = MyProfileConstants.businessType =
        retailerInfoEntity.displayRetailers?.isNotEmpty ?? false
            ? retailerInfoEntity.displayRetailers![0].businessType.toString() ??
                ''
            : '';
    String businessTypeName = MyProfileConstants.businessTypeName =
        retailerInfoEntity.displayRetailers?.isNotEmpty ?? false
            ? retailerInfoEntity.displayRetailers![0].businessTypeName ?? ''
            : '';
    String shopFirmFullName = MyProfileConstants.shopFirmFullName =
        retailerInfoEntity.displayRetailers?.isNotEmpty ?? false
            ? retailerInfoEntity.displayRetailers![0].retailerName ?? ''
            : '';
    String userName = MyProfileConstants.userName =
        retailerInfoEntity.displayRetailers?.isNotEmpty ?? false
            ? retailerInfoEntity.username ?? ''
            : '';
    String firstName = MyProfileConstants.firstName =
        retailerInfoEntity.firstname.toString().isNotEmpty
            ? retailerInfoEntity.firstname ?? ''
            : '';
    String lastName = MyProfileConstants.lastName =
        retailerInfoEntity.lastname.toString().isNotEmpty
            ? retailerInfoEntity.lastname ?? ''
            : '';
    String retailerId = MyProfileConstants.retailerId =
        retailerInfoEntity.displayRetailers?.isNotEmpty ?? false
            ? retailerInfoEntity.displayRetailers![0].retailerId.toString() ??
                ''
            : '';
    String retailerName = MyProfileConstants.retailerName =
        retailerInfoEntity.displayRetailers?.isNotEmpty ?? false
            ? retailerInfoEntity.displayRetailers![0].retailerName ?? ''
            : '';
    String address1 = MyProfileConstants.address1 =
        retailerInfoEntity.displayRetailers?.isNotEmpty ?? false
            ? retailerInfoEntity.userdetail!.address1 ?? ''
            : '';
    String address2 = MyProfileConstants.address2 =
        retailerInfoEntity.displayRetailers?.isNotEmpty ?? false
            ? retailerInfoEntity.userdetail!.address2 ?? ''
            : '';
    int regionId = MyProfileConstants.regionId =
        retailerInfoEntity.displayRetailers?.isNotEmpty ?? false
            ? retailerInfoEntity.displayRetailers![0].regionId ?? 0
            : 0;

    String contactPerson = MyProfileConstants.contactPerson =
        retailerInfoEntity.stores?.isNotEmpty ?? false
            ? retailerInfoEntity.stores![0].contactPerson.toString()
            : retailerInfoEntity.username.toString();
    String shopAddress = MyProfileConstants.shopAddress = retailerInfoEntity
                .userdetail !=
            null
        ? "${retailerInfoEntity.userdetail!.address1 ?? ''}, ${retailerInfoEntity.userdetail!.address2 ?? ''}, ${retailerInfoEntity.userdetail!.city ?? ''}"
        : '';
    String pinCode = MyProfileConstants.pinCode =
        retailerInfoEntity.userdetail?.pincode?.toString() ?? '';
    String city =
        MyProfileConstants.city = retailerInfoEntity.userdetail?.city ?? '';
    String state = MyProfileConstants.state =
        retailerInfoEntity.displayRetailers?.isNotEmpty ?? false
            ? retailerInfoEntity.displayRetailers![0].stateName ?? ''
            : '';
    int stateId = MyProfileConstants.stateId =
        retailerInfoEntity.displayRetailers?.isNotEmpty ?? false
            ? retailerInfoEntity.displayRetailers![0].stateId ?? 0
            : 0;
    String emailId =
        MyProfileConstants.emailId = retailerInfoEntity.email ?? '';
    String mobileNo =
        MyProfileConstants.mobileNo = retailerInfoEntity.mobileNumber ?? '';
    String telephone =
        MyProfileConstants.telephone = retailerInfoEntity.telephone ?? '';
    String drugLicenseNumber = MyProfileConstants.drugLicenseNumber =
        retailerInfoEntity.displayRetailers?.isNotEmpty ?? false
            ? retailerInfoEntity.displayRetailers![0].licenseNumber ?? ''
            : '';
    String drugLicenseNumber2 = MyProfileConstants.drugLicenseNumber2 =
        retailerInfoEntity.displayRetailers?.isNotEmpty ?? false
            ? retailerInfoEntity.displayRetailers![0].secondDlNumber ?? ''
            : '';
    String drugLicenseNumber3 = MyProfileConstants.drugLicenseNumber3 =
        retailerInfoEntity.displayRetailers?.isNotEmpty ?? false
            ? retailerInfoEntity.displayRetailers![0].thirdDlNumber ?? ''
            : '';
    String gstin = MyProfileConstants.gstin =
        retailerInfoEntity.displayRetailers?.isNotEmpty ?? false
            ? retailerInfoEntity.displayRetailers![0].gstinOption ?? ''
            : '';
    String panNumber = MyProfileConstants.panNumber =
        retailerInfoEntity.displayRetailers?.isNotEmpty ?? false
            ? retailerInfoEntity.displayRetailers![0].panNumber ?? ''
            : '';

    String upiId = MyProfileConstants.upiId =
        retailerInfoEntity.retailerPaymentConfig?.isNotEmpty ?? false
            ? retailerInfoEntity.retailerPaymentConfig![0].upiId ?? ''
            : '';
    String bankName = MyProfileConstants.bankName =
        retailerInfoEntity.retailerPaymentConfig?.isNotEmpty ?? false
            ? retailerInfoEntity.retailerPaymentConfig![0].bankName ?? ''
            : '';
    String accountType = MyProfileConstants.accountType =
        retailerInfoEntity.retailerPaymentConfig?.isNotEmpty ?? false
            ? retailerInfoEntity.retailerPaymentConfig![0].bankAccountType ?? ''
            : '';
    String bankAccountNumber = MyProfileConstants.bankAccountNumber =
        retailerInfoEntity.retailerPaymentConfig?.isNotEmpty ?? false
            ? retailerInfoEntity.retailerPaymentConfig![0].bankAcNumber ?? ''
            : '';
    String bankAccountHolderName = MyProfileConstants.bankAccountHolderName =
        retailerInfoEntity.retailerPaymentConfig?.isNotEmpty ?? false
            ? retailerInfoEntity.retailerPaymentConfig![0].bankAcName ?? ''
            : '';
    String ifsc = MyProfileConstants.ifsc =
        retailerInfoEntity.retailerPaymentConfig?.isNotEmpty ?? false
            ? retailerInfoEntity.retailerPaymentConfig![0].ifsc ?? ''
            : '';
    String imageUrl = retailerInfoEntity.displayImages?.isNotEmpty ?? false
        ? retailerInfoEntity.displayImages![0].imageUrl ?? ''
        : '';
    int displayImagesLength = retailerInfoEntity.displayImages?.length ?? 0;

    ProfileModel profileModel = ProfileModel(
      loginId: loginId,
      businessTypeName: businessTypeName,
      shopFirmFullName: shopFirmFullName,
      userFullName: userName,
      shopAddress: shopAddress,
      pinCode: pinCode,
      city: city,
      state: state,
      emailId: emailId,
      mobileNumber: mobileNo,
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
      bankHolderName: bankAccountHolderName,
      ifscCode: ifsc,
      imageUrl: imageUrl,
      firstName: firstName,
      lastName: lastName,
      retailerId: retailerId,
      retailerName: retailerName,
      address1: address1,
      address2: address2,
      regionId: regionId,
      stateId: stateId,
      contactPerson: contactPerson,
      displayImagesLength: displayImagesLength,
      businessType: businessType,
    );
    emit(ProfileDataState(profileModel: profileModel));
  }
}
