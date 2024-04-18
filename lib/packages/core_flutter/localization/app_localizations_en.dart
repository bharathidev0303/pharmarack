import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get request => 'Request';

  @override
  String get status => 'Status';

  @override
  String get add => 'Add';

  @override
  String get mapNewDistributors => 'Map New Distributors.';

  @override
  String get searchDistributor => 'Search Distributors';

  @override
  String get storeName => 'Store Name';

  @override
  String get partyCode => 'Party Code';

  @override
  String get optional => 'Optional';

  @override
  String get back => 'Back';

  @override
  String get submitReferral => 'Submit Referral';

  @override
  String get mapping => 'Mapping';

  @override
  String get attention => 'Attention';

  @override
  String get pleaseWaitTitle => 'Please Wait';

  @override
  String get connectingToServerMsg => 'Connecting to Server';

  @override
  String get reject => 'Reject';

  @override
  String get map => 'Map';

  @override
  String get mapped => 'Mapped';

  @override
  String get search => 'Search';

  @override
  String get requestTabTitle => 'REQUEST';

  @override
  String get mappedTabTitle => 'MAPPED';

  @override
  String get nonMappedTabTitle => 'NON-MAPPED';

  @override
  String get referTabTitle => 'REFER';

  @override
  String get settings => 'Settings';

  @override
  String get bounced => 'Bounced: ';

  @override
  String get received => 'Received: ';

  @override
  String get ordered => 'Ordered: ';

  @override
  String get totalAmount => 'Total Amount: ';

  @override
  String rs(Object amount) {
    return 'Rs. $amount';
  }

  @override
  String get view => 'View ';

  @override
  String couldNotLaunchCall(Object phoneNumber) {
    return 'Could not launch Call $phoneNumber';
  }

  @override
  String bouncedQuantity(Object value) {
    return 'Bounced Quantity: $value';
  }

  @override
  String order(Object value) {
    return 'Order: $value';
  }

  @override
  String get orderNo => 'Order No';

  @override
  String get bouncedItems => 'Bounced Items';

  @override
  String get onboardingLoginNewUser => 'New user?';

  @override
  String get onboardingLoginCreateAccount => 'SIGN UP NOW';

  @override
  String get onboardingLoginForgotPassword => 'FORGOT PASSWORD?';

  @override
  String get onboardingLoginLoadingTitle => 'Please wait';

  @override
  String get onboardingLoginLoadingMessage => 'Connecting to Server..';

  @override
  String get onboardingLoginErrorConnection => 'No Internet Connection..';

  @override
  String get onboardingLoginButtonText => 'LOGIN';

  @override
  String get onboardingLoginUsernameHintText => 'Username / Mobile number';

  @override
  String get onboardingLoginUsernameErrorText => 'Invalid username / mobile number';

  @override
  String get onboardingLoginPasswordHintText => 'Password';

  @override
  String get onboardingLoginPasswordErrorText => 'Invalid password';

  @override
  String get noProductFound => 'No Product Found';

  @override
  String get merchandisePage => 'Merchandise Page';

  @override
  String get sponsored => 'Sponsored';

  @override
  String get multipleOffers => '8 Offers';

  @override
  String plusOffers(Object offer) {
    return '+$offer offers';
  }

  @override
  String get cashBack => '10% cashback on orders over ₹499 from SunPharma';

  @override
  String get ptr => 'PTR';

  @override
  String get mrp => 'MRP';

  @override
  String get expiry => 'Expiry';

  @override
  String get gstin => 'GSTIN';

  @override
  String get gst => 'GST';

  @override
  String get margin => 'Margin';

  @override
  String get scheme => 'Scheme';

  @override
  String get pleaseEnterTheQuantity => 'Please enter the quantity';

  @override
  String get zeroQuantity => 'Quantity should be greater than 0.';

  @override
  String get success => 'Success';

  @override
  String get productIsAddedIntoCart => 'Product is added into cart';

  @override
  String get quantity => 'Quantity';

  @override
  String get free => 'Free';

  @override
  String get alert => 'Alert';

  @override
  String get ok => 'Ok';

  @override
  String get addCaps => 'ADD';

  @override
  String get welcomeTo => 'Welcome to';

  @override
  String get price => 'Price';

  @override
  String get lastAdded => 'Last Added';

  @override
  String get viewCart => 'View Cart';

  @override
  String get from => 'FROM';

  @override
  String get to => 'TO';

  @override
  String get date => 'DATE';

  @override
  String get resetFilter => 'RESET FILTER';

  @override
  String get fulfillmentPartnerName => 'Fullfilment Partner Name';

  @override
  String get contactNo => 'Contact no.';

  @override
  String nDistributorSelected(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Distributors selected',
      one: '1 Distributor selected',
      zero: 'No Distributor selected',
    );
    return '$_temp0';
  }

  @override
  String get forgotPasswordOtpScreenLabelText => 'ENTER CODE';

  @override
  String get forgotPasswordOtpScreenHelperText => 'Enter the 6 digit code that you have received on your mobile.';

  @override
  String get forgotPasswordOtpScreenResendButtonText => 'RESEND CODE';

  @override
  String get forgotPasswordOtpScreenResendHelperText => 'Did not receive OTP?';

  @override
  String get deleteAccountOtpScreenLabelText => 'ENTER CODE';

  @override
  String get deleteAccountOtpScreenHelperText => 'Enter the 6 digit code that you have received on your mobile.';

  @override
  String get deleteAccountOtpScreenResendButtonText => 'RESEND CODE';

  @override
  String get deleteAccountOtpScreenResendHelperText => 'Did not receive code?';

  @override
  String get otpScreenLabelText => 'ENTER OTP';

  @override
  String get otpScreenHelperText => 'Enter the number sent to your mobile to verify your number';

  @override
  String get otpScreenResendHelperText => 'Did not receive OTP?';

  @override
  String get otpScreenResendButtonText => 'RESEND OTP';

  @override
  String get otpScreenVerifyButtonText => 'VERIFY';

  @override
  String get forgotPasswordOtpScreenContinueButtonText => 'CONTINUE';

  @override
  String get forgotPasswordOtpScreenResendErrorText => 'Resend otp failed';

  @override
  String get otpVerificationFailedErrorText => 'OTP verification failed. Please enter the right OTP';

  @override
  String get logOutAlertTitle => 'Log Out';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get dialogDeleteText => 'DELETE';

  @override
  String get deleteAlertContentMessage => 'This action can not be undone. Your account and related data will be lost. You will no longer be able to access this account.';

  @override
  String get logOutAlertSubTitle => 'Are you sure you want to Log out?';

  @override
  String get feedbackDialogSuccessHeader => 'Thank you!';

  @override
  String get feedbackDialogSuccessBody => 'We value your feedback. We will get back to you soon.';

  @override
  String get dialogFailureHeader => 'Request Failed!';

  @override
  String get feedbackDialogFailureBody => 'There was a problem recording your feedback, please try again later..';

  @override
  String get dialogActionNoText => 'No';

  @override
  String get dialogActionYesText => 'Yes';

  @override
  String pleaseEnterPartyCodeFor(Object value) {
    return 'Please enter party code for $value';
  }

  @override
  String get forgotPasswordInfoText => 'Enter your mobile number for the verification process. We will be sending you a 6 digit code to your phone';

  @override
  String get forgotPasswordMobileNumberLabelText => 'Mobile number';

  @override
  String get forgotPasswordMobileNumberButtonText => 'SEND';

  @override
  String get somethingWentWrong => 'Oops! Something went wrong';

  @override
  String get changePasswordScreenLabelText => 'RESET PASSWORD';

  @override
  String get changePasswordScreenNewPasswordLabelText => 'Enter New Password';

  @override
  String get changePasswordScreenConfirmNewPasswordLabelText => 'Confirm New Password';

  @override
  String get changePasswordScreenCommonErrorMessage => 'Something went wrong..';

  @override
  String get screenCommonErrorMessage => 'Something went wrong..';

  @override
  String get changePasswordScreenContinueButtonText => 'CONTINUE';

  @override
  String get changePasswordScreenPasswordValidationText => 'Please Enter password Greater than or Equal to 6 Characters';

  @override
  String get feedbackRequestDialogTitle => 'Help Us Improve!';

  @override
  String get feedbackRequestDialogButtonTitle => 'SUBMIT FEEDBACK';

  @override
  String get feedbackRequestDialogHelperText => 'Rate your overall experience using the app!';

  @override
  String get feedbackRequestDialogTextFieldText => 'Tell us more.';

  @override
  String get dialogLogOutText => 'LOG OUT';

  @override
  String get dialogCommonCancelText => 'CANCEL';

  @override
  String get changePasswordScreenPasswordNotMatchingText => 'Passwords does not match';

  @override
  String get changePasswordSuccessDialogLabelText => 'Password Updated';

  @override
  String get changePasswordSuccessHelperText => 'You can login with your updated password now.';

  @override
  String get loginSuccessDialogTitleText => 'You have successfully logged in!';

  @override
  String get loginSuccessDialogSubtitleText => 'Welcome back!\nYou can continue to place your orders with us.';

  @override
  String get addDistributor => 'Add Distributor';

  @override
  String get mappingRequestExceeded => 'Mapping request limit exceeded. Maximum number of mapping request you send to each Store is 3.';

  @override
  String get mappingRequestSent => 'Mapping request sent.';

  @override
  String get pleaseSelectDistributor => 'Please select distributor';

  @override
  String get selectFulfillmentPartner => 'Select Fulfillment Partner';

  @override
  String noResultMatched(Object value) {
    return 'No Result Matched $value';
  }

  @override
  String get allowViewOrderTitle => 'Allow View Orders';

  @override
  String get allowViewOrderContent => 'Fulfillment Partner will be able to only view the Order';

  @override
  String get createOrderTitle => 'Allow Creating Orders';

  @override
  String get createOrderContent => 'Fulfillment Partner will be able to Place Order for you';

  @override
  String get onboardingOtpHintText => 'OTP';

  @override
  String get enterOtp => 'Please enter OTP';

  @override
  String get onboardingOTPLoadErrorText => 'Failed to Load OTP';

  @override
  String get onboardingOTPVerificationFailedText => 'OTP verification failed. Please enter correct OTP';

  @override
  String get enterOtpMessage => 'Please enter the OTP code which has been sent to your Mobile number';

  @override
  String get pleaseWait => 'Please wait';

  @override
  String get connectingToServer => 'Connecting to Server..';

  @override
  String get resendOtp => 'Resend OTP';

  @override
  String get otp => 'OTP';

  @override
  String get save => 'Save';

  @override
  String bottomNavContentTitle(Object value) {
    return '$value @ Pharmarack';
  }

  @override
  String get orderNowMenu => 'Order Now';

  @override
  String get rewards => 'Rewards';

  @override
  String get bestRate => 'Best Rate';

  @override
  String get cartDraft => 'Cart Draft';

  @override
  String get bouncedNav => 'Bounced';

  @override
  String get cashbackDeals => 'Cashback Deals';

  @override
  String get loyaltyPrograms => 'Loyalty Programs';

  @override
  String get productSearch => 'Product Search';

  @override
  String get cart => 'Cart';

  @override
  String get all => 'All';

  @override
  String get serverErrorMessage => 'Something went wrong please try again later';

  @override
  String get stockValue => 'Stock';

  @override
  String get orderNow => 'ORDER NOW';

  @override
  String get total => 'Total';

  @override
  String get items => 'Items';

  @override
  String get quantityShortForm => 'Qty';

  @override
  String get cartValue => 'Cart Value';

  @override
  String get placeOrder => 'Place Order';

  @override
  String offerApplied(Object offer) {
    return '$offer offer applied';
  }

  @override
  String get collapseAll => 'Collapse All';

  @override
  String get expandAll => 'Expand All';

  @override
  String get select => 'Select';

  @override
  String get myOrders => 'My Orders';

  @override
  String get orderNumber => 'Order Number';

  @override
  String get orderPlacedOn => 'Order Placed on';

  @override
  String get orderedItems => 'Ordered Items';

  @override
  String get products => 'Products';

  @override
  String get orderDetails => 'Order Details';

  @override
  String get rateYourExperience => 'Rate your experience';

  @override
  String get totalAmountLabel => 'Total Amount';

  @override
  String get successfulItems => 'Successful Items';

  @override
  String get failedItems => 'Failed Items';

  @override
  String get orderedLabel => 'Ordered';

  @override
  String get byProduct => 'By Product';

  @override
  String get byGeneric => 'By Generic';

  @override
  String get byCompany => 'By Company';

  @override
  String get byDistributor => 'By Distributor';

  @override
  String get payments => 'Payments';

  @override
  String get outstanding => 'Outstanding';

  @override
  String get history => 'History';

  @override
  String get myConnections => 'My Connections';

  @override
  String get distributors => 'Distributors';

  @override
  String get fulfilmentPartners => 'Fulfilment Partners';

  @override
  String get otherFeatures => 'Other Features';

  @override
  String get purchaseReturn => 'Purchase Return';

  @override
  String get myDeliveries => 'My Deliveries';

  @override
  String get trackDeliveries => 'Track Deliveries';

  @override
  String get orderHistory => 'Order History';

  @override
  String get stockistPriority => 'Stockist Priority';

  @override
  String get dealsOfTheDay => 'Deals of the Day';

  @override
  String get home => 'Home';

  @override
  String get createDistributorPrefList => 'Create your distributor preference list';

  @override
  String get mappedDistributor => 'MAPPED DISTRIBUTORS';

  @override
  String get nonMappedDistributorsTitle => 'NON-MAPPED DISTRIBUTORS';

  @override
  String get yourDistributorsTitle => 'YOUR DISTRIBUTORS';

  @override
  String get hintSearchProductsHere => 'Search Products Here';

  @override
  String orderId(Object value) {
    return 'Order Id : $value';
  }

  @override
  String orderIdExpanded(Object value) {
    return 'Order Id : $value ';
  }

  @override
  String get remarks => 'Remarks:';

  @override
  String get deliveryMode => 'Delivery Mode';

  @override
  String get deliveryPriority => 'Delivery Priority';

  @override
  String get createdBy => 'Created By';

  @override
  String get contactDistributor => 'Contact Distributor';

  @override
  String availableAtStores(Object value) {
    return 'Available at $value more stores';
  }

  @override
  String get distributorName => 'Distributor Name';

  @override
  String get contactNumber => 'Contact Number';

  @override
  String get pleaseEnterDistributorName => 'Please enter distributor name';

  @override
  String get pleaseEnterValidContactNumber => 'Please enter valid contact number';

  @override
  String get submit => 'Submit';

  @override
  String get addDistributorSuccessMessage => 'Thank you for your information, we will get back to you once the Distributor is on Pharmarack';

  @override
  String get mobileNo => 'Mobile Number';

  @override
  String get telephoneNo => 'Telephone';

  @override
  String get address => 'Address';

  @override
  String get prioritiesOrderedSuccessMessage => 'Distributor priority updated successfully!';

  @override
  String get prioritiesOrderedFailureMessage => 'Not able to update Distributor priority';

  @override
  String get enterPartyCode => 'Enter Party Code (Optional)';

  @override
  String get sendRequestWithoutPartyCode => 'You can send request without entering the party code.';

  @override
  String get sendRequest => 'Send Request';

  @override
  String get requestSent => 'Request Sent!';

  @override
  String get noDistributorsFound => 'No distributors found';

  @override
  String get remind => 'REMIND';

  @override
  String couldNotLaunchUrl(Object value) {
    return 'Could not launch $value';
  }

  @override
  String get yourDistributor => 'YOUR DISTRIBUTORS';

  @override
  String get distributor => 'Distributor';

  @override
  String get product => 'Product';

  @override
  String get mappedDistributors => 'Mapped Distributors';

  @override
  String get nonMappedDistributors => 'Non-mapped Distributors';

  @override
  String get noDistributorFound => 'No Distributor Found';

  @override
  String get changePassword => 'Change Password';

  @override
  String get cancelChanges => 'CANCEL CHANGES';

  @override
  String get saveChanges => 'SAVE CHANGES';

  @override
  String get updateProfile => 'UPDATE PROFILE';

  @override
  String get enterCurrentPassword => 'Enter Current Password';

  @override
  String get currentPasswordDidNotMatch => 'Current password did not match';

  @override
  String get currentPasswordMatched => 'Current password matched';

  @override
  String get enterNewPassword => 'Enter New Password';

  @override
  String get confirmNewPassword => 'Confirm New Password';

  @override
  String get passwordShouldBeMinOfSixCharacters => 'Password should be min. of 6 characters';

  @override
  String get currentPasswordShouldNotBeEmpty => 'Current password should not be empty';

  @override
  String get newPasswordShouldNotBeEmpty => 'New password should not be empty';

  @override
  String get confirmPasswordShouldNotBeEmpty => 'Confirm password should not be empty';

  @override
  String get myDistributor => 'My Distributors';

  @override
  String get maximumLimitReached => 'Maximum Limit Reached!';

  @override
  String get failedToChangePassword => 'Failed to change password';

  @override
  String get confirmPasswordShouldMatch => 'Confirm password should match';

  @override
  String get myDistributors => 'My Distributors';

  @override
  String get feedback => 'Feedback';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get termsAndConditions => 'Terms & Conditions';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get logout => 'Log out';

  @override
  String get orders => 'Orders';

  @override
  String get profile => 'Profile';

  @override
  String get browse => 'Browse';

  @override
  String get edit => 'EDIT';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get name => 'Name';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get emailId => 'Email';

  @override
  String get downloadInvoice => 'Download Invoice';

  @override
  String get typeOfBusiness => 'Type of Business';

  @override
  String get businessType => 'Business Type';

  @override
  String get nameOfShopFirm => 'Name of the Shop/Firm';

  @override
  String get shopFirmFullName => 'Shop/Firm Full Name';

  @override
  String get nameOfTheOwner => 'Name of the Owner';

  @override
  String get shopAddress => 'Shop Address';

  @override
  String get pinCode => 'Pincode';

  @override
  String get area => 'Area';

  @override
  String get region => 'Region';

  @override
  String get city => 'City';

  @override
  String get state => 'State';

  @override
  String get step1 => 'STEP 1';

  @override
  String get step2 => 'STEP 2';

  @override
  String get step3 => 'STEP 3';

  @override
  String get next => 'Next';

  @override
  String get addressValidationText => 'Please enter a valid address';

  @override
  String get email => 'Email (optional)';

  @override
  String get pharmacistName => 'Pharmacist Name (optional)';

  @override
  String get pharmacistNumber => 'Pharmacist Number (optional)';

  @override
  String get addMorePharmacists => 'add more pharmacists (max 3)';

  @override
  String get drugLicenseNumber => 'Drug License Number';

  @override
  String get drugLicenseInfoText => 'This is required to activate your account';

  @override
  String get uploadDrugLicense => 'Upload Drug License';

  @override
  String get addMoreDrugLicense => 'add more drug License details (max 3)';

  @override
  String get gstinNumber => 'GSTIN Number (optional)';

  @override
  String get gstinNumberInfoText => 'You can enter PAN number if this is not available for you currently';

  @override
  String get panNumber => 'PAN Number';

  @override
  String get register => 'register';

  @override
  String get referralCode => 'Referral Code (optional)';

  @override
  String get termAndConditionCheck => 'By clicking Register, you have read and agreed to the Terms and Conditions and Privacy Policy of Pharmarack';

  @override
  String get whatsappSubscriptionCheck => 'Yes, I would like to receive Transactional and Promotional updates on Whatsapp';

  @override
  String get pharmacistName2 => 'Pharmacist Name 2 (optional)';

  @override
  String get pharmacistNumber2 => 'Pharmacist Number 2 (optional)';

  @override
  String get pharmacistName3 => 'Pharmacist Name 3 (optional)';

  @override
  String get pharmacistNumber3 => 'Pharmacist Number 3 (optional)';

  @override
  String get welcomeToPr => 'Welcome to Pharmarack!';

  @override
  String get welcomeMessage => 'To find your distributors and start ordering, you will have to add your information so that we can validate your store and account. Get started now to begin ordering!';

  @override
  String get businessTypeError => 'Please select value for Business Type';

  @override
  String get shopNameError => 'Please Enter Value For Shop Name';

  @override
  String get shopAddressError => 'Please Enter Shop Address';

  @override
  String get telephoneError => 'Please Enter Telephone Number';

  @override
  String get upiIdError => 'Please Enter Valid UPI Id';

  @override
  String get bankNameError => 'Please Enter Bank Name';

  @override
  String get accountTypeError => 'Please Enter Account Type';

  @override
  String get bankAccountNumberError => 'Please Enter Valid Bank Account Number';

  @override
  String get accountHolderNameError => 'Please Enter Account Holder Name';

  @override
  String get ownerNameError => 'Please Enter Owner Name';

  @override
  String get ifscError => 'Please Enter IFSC';

  @override
  String get addressError => 'Please Enter Valid Address';

  @override
  String get pincodeError => 'Please Enter Valid 6 Digit Pincode';

  @override
  String get areaError => 'Please Enter Valid Area';

  @override
  String get regionError => 'Please Enter Valid Region';

  @override
  String get cityError => 'Please Enter Valid City';

  @override
  String get stateError => 'Please Select Value For State';

  @override
  String get emailError => 'Please Enter Valid Email Address';

  @override
  String get passwordError => 'Please Enter Password Greater Than or Equal to 6 Characters';

  @override
  String get start => 'start';

  @override
  String get mobileNumLengthError => 'Please Enter Valid 10 Digit Mobile Number';

  @override
  String get mobileNumInvalidStartDigit => 'Mobile Number should not start with 1,2,3,4';

  @override
  String get mobileNumberSameDigitError => 'Mobile Number should not be same digit';

  @override
  String get gstError => 'Please Enter Valid GSTIN Number';

  @override
  String get panError => 'Please Enter Valid PAN Number';

  @override
  String get privacyMessage1 => 'By clicking Register, you have read and agreed to the ';

  @override
  String get privacyMessage2 => 'Terms and Conditions';

  @override
  String get privacyMessage3 => ' and ';

  @override
  String get privacyMessage4 => 'Privacy Policy';

  @override
  String get privacyMessage5 => ' of Pharmarack';

  @override
  String get agreementError => 'Please Agree Terms & Conditions';

  @override
  String get whatsappConsentMessage => 'Yes, I would like to receive Transactional and Promotional updates on Whatsapp';

  @override
  String get mobileAlreadyInUse => 'Mobile number already in use.';

  @override
  String get gstAlreadyInUse => 'GSTIN already in use.';

  @override
  String get registrationSuccessful => 'You have signed up successfully!';

  @override
  String get registrationUnderProcessMsg => 'Please note that your registration will undergo a review process, which may take up to 36 hours to complete. You\'ll be notified as soon as your account is approved and ready to use. If you have any questions or need assistance, feel free to contact our support team.';

  @override
  String get processingRequest => 'Processing Request';

  @override
  String get requestFailed => 'Request Failed';

  @override
  String get retry => 'Retry';

  @override
  String get noStoresFound => 'No Stores Found';

  @override
  String get summaryTitle => 'SUMMARY';

  @override
  String get invoicedItemsTitle => 'INVOICED ITEMS';

  @override
  String get bouncedItemsTitle => 'BOUNCED ITEMS';

  @override
  String get acceptedLabel => 'Accepted';

  @override
  String get reOrderItemTitle => 'RE-ORDER';

  @override
  String get qty => 'Qty';

  @override
  String get discountApplied => 'Discount Applied';

  @override
  String get taxes => 'Taxes';

  @override
  String get reorder_confirmation => 'Are you sure to Reorder this order again?';

  @override
  String get confirm => 'Confirm';

  @override
  String get youCanReferANewDistributorHere => 'You can refer a new distributor here';

  @override
  String get notifications => 'Notifications';

  @override
  String get noDataFound => 'No Data Found';

  @override
  String get noNotificationsFound => 'No Notifications found';

  @override
  String get yourDistributors => 'Your Distributors';

  @override
  String get specialOffers => 'Special Offers';

  @override
  String get dealsForYou => 'Deals For You';

  @override
  String get viewAll => 'VIEW ALL';

  @override
  String get viewMore => 'VIEW MORE';

  @override
  String get addDistributorButtonName => 'ADD DISTRIBUTOR';

  @override
  String get offers => 'Offers';

  @override
  String get orderAgain => 'Order Again';

  @override
  String get patshala => 'Patshala';

  @override
  String get selectArea => 'Select Area';

  @override
  String get selectRegion => 'Select Region';

  @override
  String get selectCity => 'Select City';

  @override
  String get cancel => 'Cancel';

  @override
  String get photoGallery => 'Photo Gallery';

  @override
  String get camera => 'Camera';

  @override
  String get drugLicenseError1 => 'Please add first drug license details';

  @override
  String get drugLicenseError2 => 'Please add second drug license details';

  @override
  String get drugLicenseError3 => 'Please add first drug license details';

  @override
  String get drugLicenseNumber2 => 'Drug License Number 2';

  @override
  String get uploadDrugLicense2 => 'Upload Drug License 2';

  @override
  String get drugLicenseNumber3 => 'Drug License Number 3';

  @override
  String get uploadDrugLicense3 => 'Upload Drug License 3';

  @override
  String get drugLicenseNumberError => 'Please Enter Value For DL Number';

  @override
  String get drugLicenseFileError => 'Please Upload Drug License Copy';

  @override
  String get addressLengthError => 'Shop address must include minimum 20 characters';

  @override
  String get filter => 'Filter';

  @override
  String get wordMatch => 'WORD MATCH';

  @override
  String get searchBy => 'SEARCH BY';

  @override
  String get stockAndPriority => 'Both Stock & Priority';

  @override
  String get priority => 'Priority';

  @override
  String get nonMapped => 'Non-Mapped';

  @override
  String get onlyInStock => 'Only in Stock';

  @override
  String get includeOutOfStockProducts => 'Include out of stock products';

  @override
  String get scheme_products_only => 'Scheme products only';

  @override
  String get expiryHidden => 'Expiry hidden';

  @override
  String get expiryVisible => 'Expiry visible';

  @override
  String get resetFilters => 'RESET FILTERS';

  @override
  String get apply => 'APPLY';

  @override
  String get browseCompanies => 'Browse Companies';

  @override
  String get searchByCompany => 'Search by name, brand or therapy';

  @override
  String get sku => 'SKUs';

  @override
  String get brands => 'Brands';

  @override
  String get stock => 'Stock';

  @override
  String get selectDistributor => 'Select Distributor';

  @override
  String get changeDistributor => 'Change Distributor';

  @override
  String get deleteItem => 'Delete Item';

  @override
  String get therapy => 'Therapy';

  @override
  String get painRelief => 'Pain Relief';

  @override
  String get cardio => 'Cardio';

  @override
  String get vitamins => 'Vitamins';

  @override
  String get personalCare => 'Personal Care';

  @override
  String get noDistributorFoundForRequestedProduct => 'No distributors found for requested product';

  @override
  String get clearFilters => 'Clear Filters';

  @override
  String get unfulfilled => 'Unfulfilled';

  @override
  String get firstPharmacistError => 'Please add first Pharmacist Details';

  @override
  String get secondPharmacistError => 'Please add second Pharmacist Details';

  @override
  String get cancelOrder => 'CANCEL ORDER';

  @override
  String get viewOrder => 'VIEW ORDER';

  @override
  String get popularProduct => 'Popular Products';

  @override
  String get placeOrderDescription => 'Thank you for placing your order. You will receive confirmations from distributors upon their acceptance.';

  @override
  String get placedOrders => '# Orders Placed';

  @override
  String get addProduct => 'ADD PRODUCT';

  @override
  String get cancelOrderMsg => 'Are you sure you want to cancel the order ?';

  @override
  String get editPreference => 'Edit Preference';

  @override
  String get loginId => 'Login Id';

  @override
  String get upiId => 'UPI ID';

  @override
  String get bankName => 'Bank Name';

  @override
  String get accountType => 'Account Type';

  @override
  String get bankAccountNumber => 'Bank Account Number';

  @override
  String get accountHolderName => 'Account Holder Name';

  @override
  String get ifsc => 'IFSC Code';

  @override
  String get delete => 'Delete Profile';

  @override
  String get emptyCartStr => 'You don\"t have any product in the cart';

  @override
  String get noProductStr => 'No product found!';

  @override
  String get addNow => 'ADD NOW';

  @override
  String get pack => 'Pack';

  @override
  String get added => 'Added';

  @override
  String get profileDeleted => 'Profile Deleted!';

  @override
  String get profileDeletedSuccesfully => 'Your profile has been deleted succesfully';

  @override
  String get conditionsOfUseDate => 'Last updated: May 8, 2019';

  @override
  String get conditionsOfUse => 'Conditions Of Use';

  @override
  String get condOfUseDesc => 'Please read these Terms and Conditions (`Terms`, `Terms and Conditions`) carefully before using the http://www.pharmarack.com website (the `Service`) operated by Pharmarack (`us`, `we`, or `our`). By installing the Application (as defined below), you agree to be bound by these terms of use (`appterms`). Please review them carefully before installation and/or acceptance. \nYour access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users, and others who access or use the Service. \nBy accessing or using the Service you agree to be bound by these Terms. If you disagree with any part of the terms then you may not access the Service. The `Application` shall mean the software provided by Pharmarack to offer services related to Pharmarack, Pharmarack`s services, and its partners` services, to be used on Apple iOS and Android OS devices and any upgrades from time to time and any other software or documentation which enables the use of the Application. Any personal information you supply to Pharmarack when using the Application will be used by Pharmarack in accordance with its Privacy Policy.';

  @override
  String get accounts => 'Accounts\n';

  @override
  String get accountsDesc => 'The Application allows you to access certain functionality available on the Pharmarack.com website. Such access will be governed by the Pharmarack Website Terms of Use. When you create an account with us, you must provide us information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of your account on our Service. \nYou are responsible for safeguarding the password that you use to access the Service and for any activities or actions under your password, whether your password is with our Service or a third-party service. You agree not to disclose your password to any third party. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account. Proprietary Rights and License. \nAll trademarks, copyright, database rights and other intellectual property rights of any nature in the Application together with the underlying software code are owned either directly by Pharmarack or by Pharmarack`s licensors. Pharmarack hereby grants you a worldwide, non-exclusive, royalty-free revocable license to use the Application for your business and personal use in accordance with these app terms.';

  @override
  String get condOne => 'You will not, nor allow third parties on your behalf to (i) make and distribute copies of the Application (ii) attempt to copy, reproduce, alter, modify, reverse engineer, disassemble, decompile, transfer, exchange, or translate the Application; or (iii) create derivative works of the Application of any kind whatsoever.';

  @override
  String get condTwo => 'The Application is currently made available to you free of charge for your personal, non-commercial use. Pharmarack reserves the right to amend or withdraw the Application, or charge for the application or service provided to you in accordance with these appterms, at any time and for any reason.';

  @override
  String get condThree => 'You acknowledge that the terms of agreement with your respective mobile network provider (Mobile Provider) will continue to apply when using the Application. As a result, you may be charged by the Mobile Provider for access to network connection services for the duration of the connection while accessing the Application or any such third-party charges as may arise. You accept responsibility for any such charges that arise.';

  @override
  String get condFour => 'If you are not the bill payer for the mobile telephone or handheld device being used to access the Application, you will be assumed to have received permission from the bill payer for using the Application.';

  @override
  String get availability => 'Availability';

  @override
  String get availabilityOne => 'This Application is available to handheld mobile devices running Apple iOS and Android OS Operating Systems. Pharmarack will use reasonable efforts to make the Application available at all times. However, you acknowledge the Application is provided over the internet and mobile networks and so the quality and availability of the Application may be affected by factors outside Pharmarack`s reasonable control.';

  @override
  String get availabilityTwo => 'Pharmarack, its group of companies and sub-contractors do not accept any responsibility whatsoever for unavailability of the Application, or any difficulty or inability to download or access content or any other communication system failure which may result in the Application being unavailable.';

  @override
  String get availabilityThree => 'Pharmarack will not be responsible for any support or maintenance for the Application.';

  @override
  String get systemReq => 'System Requirements';

  @override
  String get systemReqOne => 'In order to use the Application, you are required to have a compatible mobile telephone or handheld device, internet access, and the necessary minimum specifications (Software Requirements).';

  @override
  String get systemReqTwo => 'The Software Requirements are as follows: Apple iOS devices running iOS 4 or iOS 5, and Android OS devices running Android OS 2.3 onwards; Language: English.';

  @override
  String get systemReqThree => 'The version of the Application software may be upgraded from time to time to add support for new functions and services.';

  @override
  String get obligation => 'Obligations of Pharmarack';

  @override
  String get obligationOne => 'In the Pharmarack Application, Customer shall mean not only the Distributors but also the Wholesaler, Stockist, C&F or anyone accessing the Pharmarack Distributor Application';

  @override
  String get obligationTwo => 'The Distributors data, which is personal in nature and specially pertaining to the name of the Distributor, its stores, Godowns, Branches and also indicative figures pertaining to the business that such Distributor conducts, shall not be shared with any third party without the permission of the Distributor management.';

  @override
  String get obligationOfCustomer => 'Obligations of Customer (Distributors, C&F, Stockist)';

  @override
  String get obligationOfCustomerOne => 'It will be necessary for the Distributor to give consent on sharing its retailers data, product data, stock data, stock quantity and other data as mutually agreed between Pharmarack and the Distributor. This will enable the Pharmarack Application to work as intended and fulfill the objectives of the Distributor.';

  @override
  String get obligationOfCustomerThree => 'The Pharmarack business methodology and also access to the Pharmarack Website or the Application or any other Pharmarack interface shall not be shared by the Distributor with any third party without taking prior consent from Pharmarack.';

  @override
  String get termination => 'Termination';

  @override
  String get terminationSub => 'Pharmarack may terminate use of the Application and Service at any time by giving notice of termination to you. We may terminate or suspend access immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.';

  @override
  String get terminationDesc => 'All provisions of the Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability. We may terminate or suspend your account immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.\nUpon termination, (a) the rights and licenses granted to you herein shall terminate; (b) you must cease all use of the Software. If you wish to terminate your account, you may simply discontinue using the Service and Application.\nAll provisions of the Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.';

  @override
  String get limitation => 'Limitation of Liability';

  @override
  String get limitationOne => 'In no event will Pharmarack be liable for any direct, indirect, special, punitive, exemplary or consequential losses or damages of whatsoever kind arising out of your use or access to the Application, including loss of profit or the like whether or not in the contemplation of the parties, whether based on breach of contract, tort (including negligence), product liability or otherwise.';

  @override
  String get limitationTwo => 'Pharmarack is not liable to you for any damage or alteration to your equipment including but not limited to computer equipment, handheld device or mobile telephones as a result of the installation or use of the Application.';

  @override
  String get indemnity => 'Indemnity';

  @override
  String get indemnityOne => 'You agree to indemnify, defend and hold harmless Pharmarack and its affiliates, agents, respective employees, directors, officers, agents, managers, vendors and suppliers from and against any liability, losses, claims, damages, demands, investigations, inquiries, suits, costs and expenses (including legal fee and costs incidental thereto) asserted against or incurred, that arise out of or otherwise relating to your use of the Website and Application, including without limitation any obligation to be performed by you pursuant to these Terms. Further, you agree to hold Pharmarack harmless against any claims made by any third party due to, or arising out of or otherwise relating to your use of the Website or Application, any claim arising out of damage caused to third party by you, breach of these Terms by you, or your violation of any rights of another, including any intellectual property rights. Further, you agree to hold Pharmarack harmless against any claims made by any third party due to legal suits regarding the originality, copyright issues, your violation of any third party right, including without limitation any copyright, property, or privacy right. This defense and indemnification obligation will survive these Terms.';

  @override
  String get indemnityTwo => 'Notwithstanding anything to the contrary, our entire liability towards You under these Terms or otherwise shall only be in connection with refund of the money charged from you for any particular product or service, under which the unlikely liability arises.';

  @override
  String get governingLaw => 'Governing Law';

  @override
  String get governingLawDesc => 'These Terms shall be governed and construed in accordance with the laws of India, without regard to its conflict of law provisions.\nOur failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service and Application, and supersede and replace any prior agreements we might have between us regarding the Service and Application.';

  @override
  String get warranties => 'Disclaimer of Warranties';

  @override
  String get warrantiesDesc => 'To the maximum extent permitted by law, and for the avoidance of doubt, save for section 2 of the Supply of Goods and Services Act 1982, Pharmarack hereby disclaims all implied warranties with regard to the Application. The Application and software are provided \"as is\" and \"as available\" without warranty of any kind.';

  @override
  String get linksTNC => 'Links to Other Web Sites';

  @override
  String get linksTNCDesc => 'Our Service may contain links to third-party web sites or services that are not owned or controlled by Pharmarack. Pharmarack has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that Pharmarack shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with the use of or reliance on any such content, goods, or services available on or through any such web sites or services.\nWe strongly advise you to read the terms and conditions and privacy policies of any third-party web sites or services that you visit.\n';

  @override
  String get changes => 'Changes';

  @override
  String get changesDesc => 'We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material we will try to provide at least 15 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.\nBy continuing to access or use our Service after those revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, please stop using the Service.\n';

  @override
  String get contactUsDesc => 'If you have any questions about these Terms, please contact us.\n';

  @override
  String get privancyPolicyDate => 'Last updated: May 17, 2023';

  @override
  String get privancyPolicyDesc => 'PharmaRack (\"us\", \"we\", or \"our\") operates the http://www.pharmarack.com website (the \"Service\"). This privacy policy governs your use of the software application PharmaRack (\"Application\") for mobile devices that was created by PharmaRack.This page informs you of our policies regarding the collection, use and disclosure of Personal Information when you use our Service. Registration with us is mandatory in order to be able to use the basic features of the Application. We will not use or share your information with anyone except as described in this Privacy Policy.We use your Personal Information for providing and improving the Service. By using the Service, you agree to the collection and use of information in accordance with this policy. Unless otherwise definedin this Privacy Policy, terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, accessible at http://www.pharmarack.com.\n';

  @override
  String get ppInfoColl => 'Information Collection and Use';

  @override
  String get ppInfoCollDesc => 'While using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you. Personally identifiable information may include, but is not limited to, your name, phone number, postal address and other information (\"Personal Information\"). When you register with us and use the Application, you generally provide (a) your name, email address, age, user name, password and other registration information; (b) transaction-related information, such as when you make purchases, respond to any offers, or download or use applications from us; (c) information you provide us when you contact us for help; (d) credit card information for purchase and use of the Application, and; (e) information you enter into our system when using the Application, such as contact information and project management information. To verify the business on Pharmarack Technologies, the images of Drug License Copy, profile photo, GST, PAN, etc. are required.\n';

  @override
  String get ppLogData => 'Log Data';

  @override
  String get ppCookies => 'Cookies';

  @override
  String get ppServiceProviders => 'Service Providers';

  @override
  String get ppServiceProvidersDesc => 'We may employ third party companies and individuals to facilitate our Service, to provide the Service on our behalf, to perform Service-related services or to assist us in analyzing how our Service is used. These third parties have access to your Personal Information only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.';

  @override
  String get ppServiceProvidersDescOne => 'Only aggregated, anonymized data is periodically transmitted to external services to help us improve the Application and our service. We will share your information with third parties only in the ways that are described in this privacy statement.';

  @override
  String get ppServiceProvidersDescTwo => 'We may disclose User Provided and Automatically Collected Information:';

  @override
  String get ppServiceProvidersOne => 'as required by law, such as to comply with a subpoena, or similar legal process';

  @override
  String get ppServiceProvidersTwo => 'when we believe in good faith that disclosure is necessary to protect our rights, protect your safety or the safety of others, investigate fraud, or respond to a government request';

  @override
  String get ppServiceProvidersThree => 'with our trusted services providers who work on our behalf, do not have an independent use of the information we disclose to them, and have agreed to adhere to the rules set forth in this privacy statement';

  @override
  String get ppServiceProvidersFour => 'if PharmaRack is involved in a merger, acquisition, or sale of all or a portion of its assets, you will be notified via email and/or a prominent notice on our Web site of any change in ownership or uses of this information, as well as any choices you may have regarding this information';

  @override
  String get ppDataReten => 'Data Retention Policy, Managing Your Information';

  @override
  String get ppDataRetenDesc => 'We will retain User Provided data for as long as you use the Application and for a reasonable time thereafter. We will retain Automatically Collected information for up to 24 months and thereafter may store it in aggregate. If you’d like us to delete User Provided Data that you have provided via the Application, please contact us at info@pharmarack.com and we will respond in a reasonable time. Please note that some or all of the User Provided Data may be required in order for the Application to function properly. You further authorize us to share the secondary sales and stock data with the respective company and on such company making a written request for the said data. The data so disclosed will be at a consolidated level, and shall not personally identify any of your customer.';

  @override
  String get ppLinks => 'Links To Other Sites';

  @override
  String get obligationOfCustomerTwo => 'It is incumbent on the Distributor to give consent and authorize Pharmarack to install its Application at the Distributors server or other relevant accessible Infrastructure / location (with connectivity to server or relevant database or patch required for Pharmarack) to sync relevant data as a prerequisite for using the Pharmarack Application. The Distributor will be required to mandatorily confirm all the fields that can be synced by Pharmarack on regular basis.';

  @override
  String get limitationThree => 'Nothing in these Appterms shall exclude or limit Pharmaracks liability for death or personal injury caused by negligence or for fraud or fraudulent misrepresentation or any other liability which cannot be excluded or limited under applicable law.';

  @override
  String get ppLogDataDesc => 'In addition, the Application may collect certain information automatically, including, but not limited to, the type of mobile device you use, your mobile devices unique device ID, the IP address of your mobile device, your mobile operating system, the type of mobile Internet browsers you use, and information about the way you use the Application. This Application does not collect precise information about the location of your mobile device.';

  @override
  String get ppCookiesDesc => 'Cookies are files with small amount of data, which may include an anonymous unique identifier. Cookies are sent to your browser from a web site and stored on your computers hard drive. We use cookies to collect information. You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our Service.';

  @override
  String get ppLinksDesc => 'Our Service may contain links to other sites that are not operated by us. If you click on a third-party link, you will be directed to that third partys site. We strongly advise you to review the Privacy Policy of every site you visit. We have no control over, and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.';

  @override
  String get ppSecurity => 'Security';

  @override
  String get ppSecurityDesc => 'We are concerned about safeguarding the confidentiality of your information. We provide physical, electronic, and procedural safeguards to protect information we process and maintain. For example, we limit access to this information to authorized employees and contractors who need to know that information in order to operate, develop or improve our Application. Please be aware that, although we endeavor provide reasonable security for information we process and maintain, no security system can prevent all potential security breaches.';

  @override
  String get ppChanges => 'Changes to This Privacy Policy';

  @override
  String get ppChangesDesc => 'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and informing you via email or text message. You are advised to review this Privacy Policy periodically for any changes, as continued use is deemed approval of all changes. Changes to this Privacy Policy are effective when they are posted on this page.';

  @override
  String get ppYourConsent => 'Your Consent';

  @override
  String get ppYourConsentDesc => 'By using the Application, you are consenting to our processing of your information as set forth in this Privacy Policy now and as amended by us. \"Processing,\" means using cookies on a computer/hand held device or using or touching information in any way, including, but not limited to, collecting, storing, deleting, using, combining and disclosing information, all of which activities will take place in India. We shall not disclose the user’s data with any third parties, except to the extent provided under this privacy policy, without your prior written consent.';

  @override
  String get ppContactUs => 'Contact Us';

  @override
  String get ppContactUsDesc => 'If you have any questions regarding privacy while using the Application, or have questions about our practices, please contact us via email at info@pharmarack.com';

  @override
  String get partySoonMsg => 'Dear Retailer, Your party will be locked soon by stockist, Please pay the outstanding balance';

  @override
  String get partyLockedDistributor => 'Dear Retailer, the selected distributor has locked you. We can\'t show any products or deals from this distributor, please select other distributor to continue!';

  @override
  String get failedToPreviouspasswordChanage => 'You have already used this password';

  @override
  String get applicationNotAvailable => 'This application is currently not available in your region. Please download the alternate version of Pharmarack to proceed';

  @override
  String get callUsMsg => 'For help, please \ncall on below number';
}
