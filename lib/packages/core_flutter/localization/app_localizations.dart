import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @request.
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get request;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @mapNewDistributors.
  ///
  /// In en, this message translates to:
  /// **'Map New Distributors.'**
  String get mapNewDistributors;

  /// No description provided for @searchDistributor.
  ///
  /// In en, this message translates to:
  /// **'Search Distributors'**
  String get searchDistributor;

  /// No description provided for @storeName.
  ///
  /// In en, this message translates to:
  /// **'Store Name'**
  String get storeName;

  /// No description provided for @partyCode.
  ///
  /// In en, this message translates to:
  /// **'Party Code'**
  String get partyCode;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @submitReferral.
  ///
  /// In en, this message translates to:
  /// **'Submit Referral'**
  String get submitReferral;

  /// No description provided for @mapping.
  ///
  /// In en, this message translates to:
  /// **'Mapping'**
  String get mapping;

  /// No description provided for @attention.
  ///
  /// In en, this message translates to:
  /// **'Attention'**
  String get attention;

  /// No description provided for @pleaseWaitTitle.
  ///
  /// In en, this message translates to:
  /// **'Please Wait'**
  String get pleaseWaitTitle;

  /// No description provided for @connectingToServerMsg.
  ///
  /// In en, this message translates to:
  /// **'Connecting to Server'**
  String get connectingToServerMsg;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// No description provided for @map.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// No description provided for @mapped.
  ///
  /// In en, this message translates to:
  /// **'Mapped'**
  String get mapped;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @requestTabTitle.
  ///
  /// In en, this message translates to:
  /// **'REQUEST'**
  String get requestTabTitle;

  /// No description provided for @mappedTabTitle.
  ///
  /// In en, this message translates to:
  /// **'MAPPED'**
  String get mappedTabTitle;

  /// No description provided for @nonMappedTabTitle.
  ///
  /// In en, this message translates to:
  /// **'NON-MAPPED'**
  String get nonMappedTabTitle;

  /// No description provided for @referTabTitle.
  ///
  /// In en, this message translates to:
  /// **'REFER'**
  String get referTabTitle;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @bounced.
  ///
  /// In en, this message translates to:
  /// **'Bounced: '**
  String get bounced;

  /// No description provided for @received.
  ///
  /// In en, this message translates to:
  /// **'Received: '**
  String get received;

  /// No description provided for @ordered.
  ///
  /// In en, this message translates to:
  /// **'Ordered: '**
  String get ordered;

  /// No description provided for @totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount: '**
  String get totalAmount;

  /// No description provided for @rs.
  ///
  /// In en, this message translates to:
  /// **'Rs. {amount}'**
  String rs(Object amount);

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View '**
  String get view;

  /// No description provided for @couldNotLaunchCall.
  ///
  /// In en, this message translates to:
  /// **'Could not launch Call {phoneNumber}'**
  String couldNotLaunchCall(Object phoneNumber);

  /// No description provided for @bouncedQuantity.
  ///
  /// In en, this message translates to:
  /// **'Bounced Quantity: {value}'**
  String bouncedQuantity(Object value);

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Order: {value}'**
  String order(Object value);

  /// No description provided for @orderNo.
  ///
  /// In en, this message translates to:
  /// **'Order No'**
  String get orderNo;

  /// No description provided for @bouncedItems.
  ///
  /// In en, this message translates to:
  /// **'Bounced Items'**
  String get bouncedItems;

  /// No description provided for @onboardingLoginNewUser.
  ///
  /// In en, this message translates to:
  /// **'New user?'**
  String get onboardingLoginNewUser;

  /// No description provided for @onboardingLoginCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'SIGN UP NOW'**
  String get onboardingLoginCreateAccount;

  /// No description provided for @onboardingLoginForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'FORGOT PASSWORD?'**
  String get onboardingLoginForgotPassword;

  /// No description provided for @onboardingLoginLoadingTitle.
  ///
  /// In en, this message translates to:
  /// **'Please wait'**
  String get onboardingLoginLoadingTitle;

  /// No description provided for @onboardingLoginLoadingMessage.
  ///
  /// In en, this message translates to:
  /// **'Connecting to Server..'**
  String get onboardingLoginLoadingMessage;

  /// No description provided for @onboardingLoginErrorConnection.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection..'**
  String get onboardingLoginErrorConnection;

  /// No description provided for @onboardingLoginButtonText.
  ///
  /// In en, this message translates to:
  /// **'LOGIN'**
  String get onboardingLoginButtonText;

  /// No description provided for @onboardingLoginUsernameHintText.
  ///
  /// In en, this message translates to:
  /// **'Username / Mobile number'**
  String get onboardingLoginUsernameHintText;

  /// No description provided for @onboardingLoginUsernameErrorText.
  ///
  /// In en, this message translates to:
  /// **'Invalid username / mobile number'**
  String get onboardingLoginUsernameErrorText;

  /// No description provided for @onboardingLoginPasswordHintText.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get onboardingLoginPasswordHintText;

  /// No description provided for @onboardingLoginPasswordErrorText.
  ///
  /// In en, this message translates to:
  /// **'Invalid password'**
  String get onboardingLoginPasswordErrorText;

  /// No description provided for @noProductFound.
  ///
  /// In en, this message translates to:
  /// **'No Product Found'**
  String get noProductFound;

  /// No description provided for @merchandisePage.
  ///
  /// In en, this message translates to:
  /// **'Merchandise Page'**
  String get merchandisePage;

  /// No description provided for @sponsored.
  ///
  /// In en, this message translates to:
  /// **'Sponsored'**
  String get sponsored;

  /// No description provided for @multipleOffers.
  ///
  /// In en, this message translates to:
  /// **'8 Offers'**
  String get multipleOffers;

  /// No description provided for @plusOffers.
  ///
  /// In en, this message translates to:
  /// **'+{offer} offers'**
  String plusOffers(Object offer);

  /// No description provided for @cashBack.
  ///
  /// In en, this message translates to:
  /// **'10% cashback on orders over ₹499 from SunPharma'**
  String get cashBack;

  /// No description provided for @ptr.
  ///
  /// In en, this message translates to:
  /// **'PTR'**
  String get ptr;

  /// No description provided for @mrp.
  ///
  /// In en, this message translates to:
  /// **'MRP'**
  String get mrp;

  /// No description provided for @expiry.
  ///
  /// In en, this message translates to:
  /// **'Expiry'**
  String get expiry;

  /// No description provided for @gstin.
  ///
  /// In en, this message translates to:
  /// **'GSTIN'**
  String get gstin;

  /// No description provided for @gst.
  ///
  /// In en, this message translates to:
  /// **'GST'**
  String get gst;

  /// No description provided for @margin.
  ///
  /// In en, this message translates to:
  /// **'Margin'**
  String get margin;

  /// No description provided for @scheme.
  ///
  /// In en, this message translates to:
  /// **'Scheme'**
  String get scheme;

  /// No description provided for @pleaseEnterTheQuantity.
  ///
  /// In en, this message translates to:
  /// **'Please enter the quantity'**
  String get pleaseEnterTheQuantity;

  /// No description provided for @zeroQuantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity should be greater than 0.'**
  String get zeroQuantity;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @productIsAddedIntoCart.
  ///
  /// In en, this message translates to:
  /// **'Product is added into cart'**
  String get productIsAddedIntoCart;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @free.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get free;

  /// No description provided for @alert.
  ///
  /// In en, this message translates to:
  /// **'Alert'**
  String get alert;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @addCaps.
  ///
  /// In en, this message translates to:
  /// **'ADD'**
  String get addCaps;

  /// No description provided for @welcomeTo.
  ///
  /// In en, this message translates to:
  /// **'Welcome to'**
  String get welcomeTo;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @lastAdded.
  ///
  /// In en, this message translates to:
  /// **'Last Added'**
  String get lastAdded;

  /// No description provided for @viewCart.
  ///
  /// In en, this message translates to:
  /// **'View Cart'**
  String get viewCart;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'FROM'**
  String get from;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'TO'**
  String get to;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'DATE'**
  String get date;

  /// No description provided for @resetFilter.
  ///
  /// In en, this message translates to:
  /// **'RESET FILTER'**
  String get resetFilter;

  /// No description provided for @fulfillmentPartnerName.
  ///
  /// In en, this message translates to:
  /// **'Fullfilment Partner Name'**
  String get fulfillmentPartnerName;

  /// No description provided for @contactNo.
  ///
  /// In en, this message translates to:
  /// **'Contact no.'**
  String get contactNo;

  /// A plural message for number of distributors selected
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No Distributor selected} =1{1 Distributor selected} other{{count} Distributors selected}}'**
  String nDistributorSelected(num count);

  /// No description provided for @forgotPasswordOtpScreenLabelText.
  ///
  /// In en, this message translates to:
  /// **'ENTER CODE'**
  String get forgotPasswordOtpScreenLabelText;

  /// No description provided for @forgotPasswordOtpScreenHelperText.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6 digit code that you have received on your mobile.'**
  String get forgotPasswordOtpScreenHelperText;

  /// No description provided for @forgotPasswordOtpScreenResendButtonText.
  ///
  /// In en, this message translates to:
  /// **'RESEND CODE'**
  String get forgotPasswordOtpScreenResendButtonText;

  /// No description provided for @forgotPasswordOtpScreenResendHelperText.
  ///
  /// In en, this message translates to:
  /// **'Did not receive OTP?'**
  String get forgotPasswordOtpScreenResendHelperText;

  /// No description provided for @deleteAccountOtpScreenLabelText.
  ///
  /// In en, this message translates to:
  /// **'ENTER CODE'**
  String get deleteAccountOtpScreenLabelText;

  /// No description provided for @deleteAccountOtpScreenHelperText.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6 digit code that you have received on your mobile.'**
  String get deleteAccountOtpScreenHelperText;

  /// No description provided for @deleteAccountOtpScreenResendButtonText.
  ///
  /// In en, this message translates to:
  /// **'RESEND CODE'**
  String get deleteAccountOtpScreenResendButtonText;

  /// No description provided for @deleteAccountOtpScreenResendHelperText.
  ///
  /// In en, this message translates to:
  /// **'Did not receive code?'**
  String get deleteAccountOtpScreenResendHelperText;

  /// No description provided for @otpScreenLabelText.
  ///
  /// In en, this message translates to:
  /// **'ENTER OTP'**
  String get otpScreenLabelText;

  /// No description provided for @otpScreenHelperText.
  ///
  /// In en, this message translates to:
  /// **'Enter the number sent to your mobile to verify your number'**
  String get otpScreenHelperText;

  /// No description provided for @otpScreenResendHelperText.
  ///
  /// In en, this message translates to:
  /// **'Did not receive OTP?'**
  String get otpScreenResendHelperText;

  /// No description provided for @otpScreenResendButtonText.
  ///
  /// In en, this message translates to:
  /// **'RESEND OTP'**
  String get otpScreenResendButtonText;

  /// No description provided for @otpScreenVerifyButtonText.
  ///
  /// In en, this message translates to:
  /// **'VERIFY'**
  String get otpScreenVerifyButtonText;

  /// No description provided for @forgotPasswordOtpScreenContinueButtonText.
  ///
  /// In en, this message translates to:
  /// **'CONTINUE'**
  String get forgotPasswordOtpScreenContinueButtonText;

  /// No description provided for @forgotPasswordOtpScreenResendErrorText.
  ///
  /// In en, this message translates to:
  /// **'Resend otp failed'**
  String get forgotPasswordOtpScreenResendErrorText;

  /// No description provided for @otpVerificationFailedErrorText.
  ///
  /// In en, this message translates to:
  /// **'OTP verification failed. Please enter the right OTP'**
  String get otpVerificationFailedErrorText;

  /// No description provided for @logOutAlertTitle.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOutAlertTitle;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @dialogDeleteText.
  ///
  /// In en, this message translates to:
  /// **'DELETE'**
  String get dialogDeleteText;

  /// No description provided for @deleteAlertContentMessage.
  ///
  /// In en, this message translates to:
  /// **'This action can not be undone. Your account and related data will be lost. You will no longer be able to access this account.'**
  String get deleteAlertContentMessage;

  /// No description provided for @logOutAlertSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to Log out?'**
  String get logOutAlertSubTitle;

  /// No description provided for @feedbackDialogSuccessHeader.
  ///
  /// In en, this message translates to:
  /// **'Thank you!'**
  String get feedbackDialogSuccessHeader;

  /// No description provided for @feedbackDialogSuccessBody.
  ///
  /// In en, this message translates to:
  /// **'We value your feedback. We will get back to you soon.'**
  String get feedbackDialogSuccessBody;

  /// No description provided for @dialogFailureHeader.
  ///
  /// In en, this message translates to:
  /// **'Request Failed!'**
  String get dialogFailureHeader;

  /// No description provided for @feedbackDialogFailureBody.
  ///
  /// In en, this message translates to:
  /// **'There was a problem recording your feedback, please try again later..'**
  String get feedbackDialogFailureBody;

  /// No description provided for @dialogActionNoText.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get dialogActionNoText;

  /// No description provided for @dialogActionYesText.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get dialogActionYesText;

  /// No description provided for @pleaseEnterPartyCodeFor.
  ///
  /// In en, this message translates to:
  /// **'Please enter party code for {value}'**
  String pleaseEnterPartyCodeFor(Object value);

  /// No description provided for @forgotPasswordInfoText.
  ///
  /// In en, this message translates to:
  /// **'Enter your mobile number for the verification process. We will be sending you a 6 digit code to your phone'**
  String get forgotPasswordInfoText;

  /// No description provided for @forgotPasswordMobileNumberLabelText.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get forgotPasswordMobileNumberLabelText;

  /// No description provided for @forgotPasswordMobileNumberButtonText.
  ///
  /// In en, this message translates to:
  /// **'SEND'**
  String get forgotPasswordMobileNumberButtonText;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Oops! Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @changePasswordScreenLabelText.
  ///
  /// In en, this message translates to:
  /// **'RESET PASSWORD'**
  String get changePasswordScreenLabelText;

  /// No description provided for @changePasswordScreenNewPasswordLabelText.
  ///
  /// In en, this message translates to:
  /// **'Enter New Password'**
  String get changePasswordScreenNewPasswordLabelText;

  /// No description provided for @changePasswordScreenConfirmNewPasswordLabelText.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get changePasswordScreenConfirmNewPasswordLabelText;

  /// No description provided for @changePasswordScreenCommonErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong..'**
  String get changePasswordScreenCommonErrorMessage;

  /// No description provided for @screenCommonErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong..'**
  String get screenCommonErrorMessage;

  /// No description provided for @changePasswordScreenContinueButtonText.
  ///
  /// In en, this message translates to:
  /// **'CONTINUE'**
  String get changePasswordScreenContinueButtonText;

  /// No description provided for @changePasswordScreenPasswordValidationText.
  ///
  /// In en, this message translates to:
  /// **'Please Enter password Greater than or Equal to 6 Characters'**
  String get changePasswordScreenPasswordValidationText;

  /// No description provided for @feedbackRequestDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Help Us Improve!'**
  String get feedbackRequestDialogTitle;

  /// No description provided for @feedbackRequestDialogButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'SUBMIT FEEDBACK'**
  String get feedbackRequestDialogButtonTitle;

  /// No description provided for @feedbackRequestDialogHelperText.
  ///
  /// In en, this message translates to:
  /// **'Rate your overall experience using the app!'**
  String get feedbackRequestDialogHelperText;

  /// No description provided for @feedbackRequestDialogTextFieldText.
  ///
  /// In en, this message translates to:
  /// **'Tell us more.'**
  String get feedbackRequestDialogTextFieldText;

  /// No description provided for @dialogLogOutText.
  ///
  /// In en, this message translates to:
  /// **'LOG OUT'**
  String get dialogLogOutText;

  /// No description provided for @dialogCommonCancelText.
  ///
  /// In en, this message translates to:
  /// **'CANCEL'**
  String get dialogCommonCancelText;

  /// No description provided for @changePasswordScreenPasswordNotMatchingText.
  ///
  /// In en, this message translates to:
  /// **'Passwords does not match'**
  String get changePasswordScreenPasswordNotMatchingText;

  /// No description provided for @changePasswordSuccessDialogLabelText.
  ///
  /// In en, this message translates to:
  /// **'Password Updated'**
  String get changePasswordSuccessDialogLabelText;

  /// No description provided for @changePasswordSuccessHelperText.
  ///
  /// In en, this message translates to:
  /// **'You can login with your updated password now.'**
  String get changePasswordSuccessHelperText;

  /// No description provided for @loginSuccessDialogTitleText.
  ///
  /// In en, this message translates to:
  /// **'You have successfully logged in!'**
  String get loginSuccessDialogTitleText;

  /// No description provided for @loginSuccessDialogSubtitleText.
  ///
  /// In en, this message translates to:
  /// **'Welcome back!\nYou can continue to place your orders with us.'**
  String get loginSuccessDialogSubtitleText;

  /// No description provided for @addDistributor.
  ///
  /// In en, this message translates to:
  /// **'Add Distributor'**
  String get addDistributor;

  /// No description provided for @mappingRequestExceeded.
  ///
  /// In en, this message translates to:
  /// **'Mapping request limit exceeded. Maximum number of mapping request you send to each Store is 3.'**
  String get mappingRequestExceeded;

  /// No description provided for @mappingRequestSent.
  ///
  /// In en, this message translates to:
  /// **'Mapping request sent.'**
  String get mappingRequestSent;

  /// No description provided for @pleaseSelectDistributor.
  ///
  /// In en, this message translates to:
  /// **'Please select distributor'**
  String get pleaseSelectDistributor;

  /// No description provided for @selectFulfillmentPartner.
  ///
  /// In en, this message translates to:
  /// **'Select Fulfillment Partner'**
  String get selectFulfillmentPartner;

  /// No description provided for @noResultMatched.
  ///
  /// In en, this message translates to:
  /// **'No Result Matched {value}'**
  String noResultMatched(Object value);

  /// No description provided for @allowViewOrderTitle.
  ///
  /// In en, this message translates to:
  /// **'Allow View Orders'**
  String get allowViewOrderTitle;

  /// No description provided for @allowViewOrderContent.
  ///
  /// In en, this message translates to:
  /// **'Fulfillment Partner will be able to only view the Order'**
  String get allowViewOrderContent;

  /// No description provided for @createOrderTitle.
  ///
  /// In en, this message translates to:
  /// **'Allow Creating Orders'**
  String get createOrderTitle;

  /// No description provided for @createOrderContent.
  ///
  /// In en, this message translates to:
  /// **'Fulfillment Partner will be able to Place Order for you'**
  String get createOrderContent;

  /// No description provided for @onboardingOtpHintText.
  ///
  /// In en, this message translates to:
  /// **'OTP'**
  String get onboardingOtpHintText;

  /// No description provided for @enterOtp.
  ///
  /// In en, this message translates to:
  /// **'Please enter OTP'**
  String get enterOtp;

  /// No description provided for @onboardingOTPLoadErrorText.
  ///
  /// In en, this message translates to:
  /// **'Failed to Load OTP'**
  String get onboardingOTPLoadErrorText;

  /// No description provided for @onboardingOTPVerificationFailedText.
  ///
  /// In en, this message translates to:
  /// **'OTP verification failed. Please enter correct OTP'**
  String get onboardingOTPVerificationFailedText;

  /// No description provided for @enterOtpMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter the OTP code which has been sent to your Mobile number'**
  String get enterOtpMessage;

  /// No description provided for @pleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Please wait'**
  String get pleaseWait;

  /// No description provided for @connectingToServer.
  ///
  /// In en, this message translates to:
  /// **'Connecting to Server..'**
  String get connectingToServer;

  /// No description provided for @resendOtp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get resendOtp;

  /// No description provided for @otp.
  ///
  /// In en, this message translates to:
  /// **'OTP'**
  String get otp;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @bottomNavContentTitle.
  ///
  /// In en, this message translates to:
  /// **'{value} @ Pharmarack'**
  String bottomNavContentTitle(Object value);

  /// No description provided for @orderNowMenu.
  ///
  /// In en, this message translates to:
  /// **'Order Now'**
  String get orderNowMenu;

  /// No description provided for @rewards.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get rewards;

  /// No description provided for @bestRate.
  ///
  /// In en, this message translates to:
  /// **'Best Rate'**
  String get bestRate;

  /// No description provided for @cartDraft.
  ///
  /// In en, this message translates to:
  /// **'Cart Draft'**
  String get cartDraft;

  /// No description provided for @bouncedNav.
  ///
  /// In en, this message translates to:
  /// **'Bounced'**
  String get bouncedNav;

  /// No description provided for @cashbackDeals.
  ///
  /// In en, this message translates to:
  /// **'Cashback Deals'**
  String get cashbackDeals;

  /// No description provided for @loyaltyPrograms.
  ///
  /// In en, this message translates to:
  /// **'Loyalty Programs'**
  String get loyaltyPrograms;

  /// No description provided for @productSearch.
  ///
  /// In en, this message translates to:
  /// **'Product Search'**
  String get productSearch;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @serverErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong please try again later'**
  String get serverErrorMessage;

  /// No description provided for @stockValue.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get stockValue;

  /// No description provided for @orderNow.
  ///
  /// In en, this message translates to:
  /// **'ORDER NOW'**
  String get orderNow;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get items;

  /// No description provided for @quantityShortForm.
  ///
  /// In en, this message translates to:
  /// **'Qty'**
  String get quantityShortForm;

  /// No description provided for @cartValue.
  ///
  /// In en, this message translates to:
  /// **'Cart Value'**
  String get cartValue;

  /// No description provided for @placeOrder.
  ///
  /// In en, this message translates to:
  /// **'Place Order'**
  String get placeOrder;

  /// No description provided for @offerApplied.
  ///
  /// In en, this message translates to:
  /// **'{offer} offer applied'**
  String offerApplied(Object offer);

  /// No description provided for @collapseAll.
  ///
  /// In en, this message translates to:
  /// **'Collapse All'**
  String get collapseAll;

  /// No description provided for @expandAll.
  ///
  /// In en, this message translates to:
  /// **'Expand All'**
  String get expandAll;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @orderNumber.
  ///
  /// In en, this message translates to:
  /// **'Order Number'**
  String get orderNumber;

  /// No description provided for @orderPlacedOn.
  ///
  /// In en, this message translates to:
  /// **'Order Placed on'**
  String get orderPlacedOn;

  /// No description provided for @orderedItems.
  ///
  /// In en, this message translates to:
  /// **'Ordered Items'**
  String get orderedItems;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get orderDetails;

  /// No description provided for @rateYourExperience.
  ///
  /// In en, this message translates to:
  /// **'Rate your experience'**
  String get rateYourExperience;

  /// No description provided for @totalAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get totalAmountLabel;

  /// No description provided for @successfulItems.
  ///
  /// In en, this message translates to:
  /// **'Successful Items'**
  String get successfulItems;

  /// No description provided for @failedItems.
  ///
  /// In en, this message translates to:
  /// **'Failed Items'**
  String get failedItems;

  /// No description provided for @orderedLabel.
  ///
  /// In en, this message translates to:
  /// **'Ordered'**
  String get orderedLabel;

  /// No description provided for @byProduct.
  ///
  /// In en, this message translates to:
  /// **'By Product'**
  String get byProduct;

  /// No description provided for @byGeneric.
  ///
  /// In en, this message translates to:
  /// **'By Generic'**
  String get byGeneric;

  /// No description provided for @byCompany.
  ///
  /// In en, this message translates to:
  /// **'By Company'**
  String get byCompany;

  /// No description provided for @byDistributor.
  ///
  /// In en, this message translates to:
  /// **'By Distributor'**
  String get byDistributor;

  /// No description provided for @payments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get payments;

  /// No description provided for @outstanding.
  ///
  /// In en, this message translates to:
  /// **'Outstanding'**
  String get outstanding;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @myConnections.
  ///
  /// In en, this message translates to:
  /// **'My Connections'**
  String get myConnections;

  /// No description provided for @distributors.
  ///
  /// In en, this message translates to:
  /// **'Distributors'**
  String get distributors;

  /// No description provided for @fulfilmentPartners.
  ///
  /// In en, this message translates to:
  /// **'Fulfilment Partners'**
  String get fulfilmentPartners;

  /// No description provided for @otherFeatures.
  ///
  /// In en, this message translates to:
  /// **'Other Features'**
  String get otherFeatures;

  /// No description provided for @purchaseReturn.
  ///
  /// In en, this message translates to:
  /// **'Purchase Return'**
  String get purchaseReturn;

  /// No description provided for @myDeliveries.
  ///
  /// In en, this message translates to:
  /// **'My Deliveries'**
  String get myDeliveries;

  /// No description provided for @trackDeliveries.
  ///
  /// In en, this message translates to:
  /// **'Track Deliveries'**
  String get trackDeliveries;

  /// No description provided for @orderHistory.
  ///
  /// In en, this message translates to:
  /// **'Order History'**
  String get orderHistory;

  /// No description provided for @stockistPriority.
  ///
  /// In en, this message translates to:
  /// **'Stockist Priority'**
  String get stockistPriority;

  /// No description provided for @dealsOfTheDay.
  ///
  /// In en, this message translates to:
  /// **'Deals of the Day'**
  String get dealsOfTheDay;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @createDistributorPrefList.
  ///
  /// In en, this message translates to:
  /// **'Create your distributor preference list'**
  String get createDistributorPrefList;

  /// No description provided for @mappedDistributor.
  ///
  /// In en, this message translates to:
  /// **'MAPPED DISTRIBUTORS'**
  String get mappedDistributor;

  /// No description provided for @nonMappedDistributorsTitle.
  ///
  /// In en, this message translates to:
  /// **'NON-MAPPED DISTRIBUTORS'**
  String get nonMappedDistributorsTitle;

  /// No description provided for @yourDistributorsTitle.
  ///
  /// In en, this message translates to:
  /// **'YOUR DISTRIBUTORS'**
  String get yourDistributorsTitle;

  /// No description provided for @hintSearchProductsHere.
  ///
  /// In en, this message translates to:
  /// **'Search Products Here'**
  String get hintSearchProductsHere;

  /// No description provided for @orderId.
  ///
  /// In en, this message translates to:
  /// **'Order Id : {value}'**
  String orderId(Object value);

  /// No description provided for @orderIdExpanded.
  ///
  /// In en, this message translates to:
  /// **'Order Id : {value} '**
  String orderIdExpanded(Object value);

  /// No description provided for @remarks.
  ///
  /// In en, this message translates to:
  /// **'Remarks:'**
  String get remarks;

  /// No description provided for @deliveryMode.
  ///
  /// In en, this message translates to:
  /// **'Delivery Mode'**
  String get deliveryMode;

  /// No description provided for @deliveryPriority.
  ///
  /// In en, this message translates to:
  /// **'Delivery Priority'**
  String get deliveryPriority;

  /// No description provided for @createdBy.
  ///
  /// In en, this message translates to:
  /// **'Created By'**
  String get createdBy;

  /// No description provided for @contactDistributor.
  ///
  /// In en, this message translates to:
  /// **'Contact Distributor'**
  String get contactDistributor;

  /// No description provided for @availableAtStores.
  ///
  /// In en, this message translates to:
  /// **'Available at {value} more stores'**
  String availableAtStores(Object value);

  /// No description provided for @distributorName.
  ///
  /// In en, this message translates to:
  /// **'Distributor Name'**
  String get distributorName;

  /// No description provided for @contactNumber.
  ///
  /// In en, this message translates to:
  /// **'Contact Number'**
  String get contactNumber;

  /// No description provided for @pleaseEnterDistributorName.
  ///
  /// In en, this message translates to:
  /// **'Please enter distributor name'**
  String get pleaseEnterDistributorName;

  /// No description provided for @pleaseEnterValidContactNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid contact number'**
  String get pleaseEnterValidContactNumber;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @addDistributorSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your information, we will get back to you once the Distributor is on Pharmarack'**
  String get addDistributorSuccessMessage;

  /// No description provided for @mobileNo.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNo;

  /// No description provided for @telephoneNo.
  ///
  /// In en, this message translates to:
  /// **'Telephone'**
  String get telephoneNo;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @prioritiesOrderedSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Distributor priority updated successfully!'**
  String get prioritiesOrderedSuccessMessage;

  /// No description provided for @prioritiesOrderedFailureMessage.
  ///
  /// In en, this message translates to:
  /// **'Not able to update Distributor priority'**
  String get prioritiesOrderedFailureMessage;

  /// No description provided for @enterPartyCode.
  ///
  /// In en, this message translates to:
  /// **'Enter Party Code (Optional)'**
  String get enterPartyCode;

  /// No description provided for @sendRequestWithoutPartyCode.
  ///
  /// In en, this message translates to:
  /// **'You can send request without entering the party code.'**
  String get sendRequestWithoutPartyCode;

  /// No description provided for @sendRequest.
  ///
  /// In en, this message translates to:
  /// **'Send Request'**
  String get sendRequest;

  /// No description provided for @requestSent.
  ///
  /// In en, this message translates to:
  /// **'Request Sent!'**
  String get requestSent;

  /// No description provided for @noDistributorsFound.
  ///
  /// In en, this message translates to:
  /// **'No distributors found'**
  String get noDistributorsFound;

  /// No description provided for @remind.
  ///
  /// In en, this message translates to:
  /// **'REMIND'**
  String get remind;

  /// No description provided for @couldNotLaunchUrl.
  ///
  /// In en, this message translates to:
  /// **'Could not launch {value}'**
  String couldNotLaunchUrl(Object value);

  /// No description provided for @yourDistributor.
  ///
  /// In en, this message translates to:
  /// **'YOUR DISTRIBUTORS'**
  String get yourDistributor;

  /// No description provided for @distributor.
  ///
  /// In en, this message translates to:
  /// **'Distributor'**
  String get distributor;

  /// No description provided for @product.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get product;

  /// No description provided for @mappedDistributors.
  ///
  /// In en, this message translates to:
  /// **'Mapped Distributors'**
  String get mappedDistributors;

  /// No description provided for @nonMappedDistributors.
  ///
  /// In en, this message translates to:
  /// **'Non-mapped Distributors'**
  String get nonMappedDistributors;

  /// No description provided for @noDistributorFound.
  ///
  /// In en, this message translates to:
  /// **'No Distributor Found'**
  String get noDistributorFound;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @cancelChanges.
  ///
  /// In en, this message translates to:
  /// **'CANCEL CHANGES'**
  String get cancelChanges;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'SAVE CHANGES'**
  String get saveChanges;

  /// No description provided for @updateProfile.
  ///
  /// In en, this message translates to:
  /// **'UPDATE PROFILE'**
  String get updateProfile;

  /// No description provided for @enterCurrentPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter Current Password'**
  String get enterCurrentPassword;

  /// No description provided for @currentPasswordDidNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Current password did not match'**
  String get currentPasswordDidNotMatch;

  /// No description provided for @currentPasswordMatched.
  ///
  /// In en, this message translates to:
  /// **'Current password matched'**
  String get currentPasswordMatched;

  /// No description provided for @enterNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter New Password'**
  String get enterNewPassword;

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmNewPassword;

  /// No description provided for @passwordShouldBeMinOfSixCharacters.
  ///
  /// In en, this message translates to:
  /// **'Password should be min. of 6 characters'**
  String get passwordShouldBeMinOfSixCharacters;

  /// No description provided for @currentPasswordShouldNotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Current password should not be empty'**
  String get currentPasswordShouldNotBeEmpty;

  /// No description provided for @newPasswordShouldNotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'New password should not be empty'**
  String get newPasswordShouldNotBeEmpty;

  /// No description provided for @confirmPasswordShouldNotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Confirm password should not be empty'**
  String get confirmPasswordShouldNotBeEmpty;

  /// No description provided for @myDistributor.
  ///
  /// In en, this message translates to:
  /// **'My Distributors'**
  String get myDistributor;

  /// No description provided for @maximumLimitReached.
  ///
  /// In en, this message translates to:
  /// **'Maximum Limit Reached!'**
  String get maximumLimitReached;

  /// No description provided for @failedToChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Failed to change password'**
  String get failedToChangePassword;

  /// No description provided for @confirmPasswordShouldMatch.
  ///
  /// In en, this message translates to:
  /// **'Confirm password should match'**
  String get confirmPasswordShouldMatch;

  /// No description provided for @myDistributors.
  ///
  /// In en, this message translates to:
  /// **'My Distributors'**
  String get myDistributors;

  /// No description provided for @feedback.
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get feedback;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsAndConditions;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @browse.
  ///
  /// In en, this message translates to:
  /// **'Browse'**
  String get browse;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'EDIT'**
  String get edit;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @emailId.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailId;

  /// No description provided for @downloadInvoice.
  ///
  /// In en, this message translates to:
  /// **'Download Invoice'**
  String get downloadInvoice;

  /// No description provided for @typeOfBusiness.
  ///
  /// In en, this message translates to:
  /// **'Type of Business'**
  String get typeOfBusiness;

  /// No description provided for @businessType.
  ///
  /// In en, this message translates to:
  /// **'Business Type'**
  String get businessType;

  /// No description provided for @nameOfShopFirm.
  ///
  /// In en, this message translates to:
  /// **'Name of the Shop/Firm'**
  String get nameOfShopFirm;

  /// No description provided for @shopFirmFullName.
  ///
  /// In en, this message translates to:
  /// **'Shop/Firm Full Name'**
  String get shopFirmFullName;

  /// No description provided for @nameOfTheOwner.
  ///
  /// In en, this message translates to:
  /// **'Name of the Owner'**
  String get nameOfTheOwner;

  /// No description provided for @shopAddress.
  ///
  /// In en, this message translates to:
  /// **'Shop Address'**
  String get shopAddress;

  /// No description provided for @pinCode.
  ///
  /// In en, this message translates to:
  /// **'Pincode'**
  String get pinCode;

  /// No description provided for @area.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get area;

  /// No description provided for @region.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get region;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @step1.
  ///
  /// In en, this message translates to:
  /// **'STEP 1'**
  String get step1;

  /// No description provided for @step2.
  ///
  /// In en, this message translates to:
  /// **'STEP 2'**
  String get step2;

  /// No description provided for @step3.
  ///
  /// In en, this message translates to:
  /// **'STEP 3'**
  String get step3;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @addressValidationText.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid address'**
  String get addressValidationText;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email (optional)'**
  String get email;

  /// No description provided for @pharmacistName.
  ///
  /// In en, this message translates to:
  /// **'Pharmacist Name (optional)'**
  String get pharmacistName;

  /// No description provided for @pharmacistNumber.
  ///
  /// In en, this message translates to:
  /// **'Pharmacist Number (optional)'**
  String get pharmacistNumber;

  /// No description provided for @addMorePharmacists.
  ///
  /// In en, this message translates to:
  /// **'add more pharmacists (max 3)'**
  String get addMorePharmacists;

  /// No description provided for @drugLicenseNumber.
  ///
  /// In en, this message translates to:
  /// **'Drug License Number'**
  String get drugLicenseNumber;

  /// No description provided for @drugLicenseInfoText.
  ///
  /// In en, this message translates to:
  /// **'This is required to activate your account'**
  String get drugLicenseInfoText;

  /// No description provided for @uploadDrugLicense.
  ///
  /// In en, this message translates to:
  /// **'Upload Drug License'**
  String get uploadDrugLicense;

  /// No description provided for @addMoreDrugLicense.
  ///
  /// In en, this message translates to:
  /// **'add more drug License details (max 3)'**
  String get addMoreDrugLicense;

  /// No description provided for @gstinNumber.
  ///
  /// In en, this message translates to:
  /// **'GSTIN Number (optional)'**
  String get gstinNumber;

  /// No description provided for @gstinNumberInfoText.
  ///
  /// In en, this message translates to:
  /// **'You can enter PAN number if this is not available for you currently'**
  String get gstinNumberInfoText;

  /// No description provided for @panNumber.
  ///
  /// In en, this message translates to:
  /// **'PAN Number'**
  String get panNumber;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'register'**
  String get register;

  /// No description provided for @referralCode.
  ///
  /// In en, this message translates to:
  /// **'Referral Code (optional)'**
  String get referralCode;

  /// No description provided for @termAndConditionCheck.
  ///
  /// In en, this message translates to:
  /// **'By clicking Register, you have read and agreed to the Terms and Conditions and Privacy Policy of Pharmarack'**
  String get termAndConditionCheck;

  /// No description provided for @whatsappSubscriptionCheck.
  ///
  /// In en, this message translates to:
  /// **'Yes, I would like to receive Transactional and Promotional updates on Whatsapp'**
  String get whatsappSubscriptionCheck;

  /// No description provided for @pharmacistName2.
  ///
  /// In en, this message translates to:
  /// **'Pharmacist Name 2 (optional)'**
  String get pharmacistName2;

  /// No description provided for @pharmacistNumber2.
  ///
  /// In en, this message translates to:
  /// **'Pharmacist Number 2 (optional)'**
  String get pharmacistNumber2;

  /// No description provided for @pharmacistName3.
  ///
  /// In en, this message translates to:
  /// **'Pharmacist Name 3 (optional)'**
  String get pharmacistName3;

  /// No description provided for @pharmacistNumber3.
  ///
  /// In en, this message translates to:
  /// **'Pharmacist Number 3 (optional)'**
  String get pharmacistNumber3;

  /// No description provided for @welcomeToPr.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Pharmarack!'**
  String get welcomeToPr;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'To find your distributors and start ordering, you will have to add your information so that we can validate your store and account. Get started now to begin ordering!'**
  String get welcomeMessage;

  /// No description provided for @businessTypeError.
  ///
  /// In en, this message translates to:
  /// **'Please select value for Business Type'**
  String get businessTypeError;

  /// No description provided for @shopNameError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Value For Shop Name'**
  String get shopNameError;

  /// No description provided for @shopAddressError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Shop Address'**
  String get shopAddressError;

  /// No description provided for @telephoneError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Telephone Number'**
  String get telephoneError;

  /// No description provided for @upiIdError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Valid UPI Id'**
  String get upiIdError;

  /// No description provided for @bankNameError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Bank Name'**
  String get bankNameError;

  /// No description provided for @accountTypeError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Account Type'**
  String get accountTypeError;

  /// No description provided for @bankAccountNumberError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Valid Bank Account Number'**
  String get bankAccountNumberError;

  /// No description provided for @accountHolderNameError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Account Holder Name'**
  String get accountHolderNameError;

  /// No description provided for @ownerNameError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Owner Name'**
  String get ownerNameError;

  /// No description provided for @ifscError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter IFSC'**
  String get ifscError;

  /// No description provided for @addressError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Valid Address'**
  String get addressError;

  /// No description provided for @pincodeError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Valid 6 Digit Pincode'**
  String get pincodeError;

  /// No description provided for @areaError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Valid Area'**
  String get areaError;

  /// No description provided for @regionError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Valid Region'**
  String get regionError;

  /// No description provided for @cityError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Valid City'**
  String get cityError;

  /// No description provided for @stateError.
  ///
  /// In en, this message translates to:
  /// **'Please Select Value For State'**
  String get stateError;

  /// No description provided for @emailError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Valid Email Address'**
  String get emailError;

  /// No description provided for @passwordError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Password Greater Than or Equal to 6 Characters'**
  String get passwordError;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'start'**
  String get start;

  /// No description provided for @mobileNumLengthError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Valid 10 Digit Mobile Number'**
  String get mobileNumLengthError;

  /// No description provided for @mobileNumInvalidStartDigit.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number should not start with 1,2,3,4'**
  String get mobileNumInvalidStartDigit;

  /// No description provided for @mobileNumberSameDigitError.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number should not be same digit'**
  String get mobileNumberSameDigitError;

  /// No description provided for @gstError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Valid GSTIN Number'**
  String get gstError;

  /// No description provided for @panError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Valid PAN Number'**
  String get panError;

  /// No description provided for @privacyMessage1.
  ///
  /// In en, this message translates to:
  /// **'By clicking Register, you have read and agreed to the '**
  String get privacyMessage1;

  /// No description provided for @privacyMessage2.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions'**
  String get privacyMessage2;

  /// No description provided for @privacyMessage3.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get privacyMessage3;

  /// No description provided for @privacyMessage4.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyMessage4;

  /// No description provided for @privacyMessage5.
  ///
  /// In en, this message translates to:
  /// **' of Pharmarack'**
  String get privacyMessage5;

  /// No description provided for @agreementError.
  ///
  /// In en, this message translates to:
  /// **'Please Agree Terms & Conditions'**
  String get agreementError;

  /// No description provided for @whatsappConsentMessage.
  ///
  /// In en, this message translates to:
  /// **'Yes, I would like to receive Transactional and Promotional updates on Whatsapp'**
  String get whatsappConsentMessage;

  /// No description provided for @mobileAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'Mobile number already in use.'**
  String get mobileAlreadyInUse;

  /// No description provided for @gstAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'GSTIN already in use.'**
  String get gstAlreadyInUse;

  /// No description provided for @registrationSuccessful.
  ///
  /// In en, this message translates to:
  /// **'You have signed up successfully!'**
  String get registrationSuccessful;

  /// No description provided for @registrationUnderProcessMsg.
  ///
  /// In en, this message translates to:
  /// **'Please note that your registration will undergo a review process, which may take up to 36 hours to complete. You\'\'ll be notified as soon as your account is approved and ready to use. If you have any questions or need assistance, feel free to contact our support team.'**
  String get registrationUnderProcessMsg;

  /// No description provided for @processingRequest.
  ///
  /// In en, this message translates to:
  /// **'Processing Request'**
  String get processingRequest;

  /// No description provided for @requestFailed.
  ///
  /// In en, this message translates to:
  /// **'Request Failed'**
  String get requestFailed;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @noStoresFound.
  ///
  /// In en, this message translates to:
  /// **'No Stores Found'**
  String get noStoresFound;

  /// No description provided for @summaryTitle.
  ///
  /// In en, this message translates to:
  /// **'SUMMARY'**
  String get summaryTitle;

  /// No description provided for @invoicedItemsTitle.
  ///
  /// In en, this message translates to:
  /// **'INVOICED ITEMS'**
  String get invoicedItemsTitle;

  /// No description provided for @bouncedItemsTitle.
  ///
  /// In en, this message translates to:
  /// **'BOUNCED ITEMS'**
  String get bouncedItemsTitle;

  /// No description provided for @acceptedLabel.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get acceptedLabel;

  /// No description provided for @reOrderItemTitle.
  ///
  /// In en, this message translates to:
  /// **'RE-ORDER'**
  String get reOrderItemTitle;

  /// No description provided for @qty.
  ///
  /// In en, this message translates to:
  /// **'Qty'**
  String get qty;

  /// No description provided for @discountApplied.
  ///
  /// In en, this message translates to:
  /// **'Discount Applied'**
  String get discountApplied;

  /// No description provided for @taxes.
  ///
  /// In en, this message translates to:
  /// **'Taxes'**
  String get taxes;

  /// No description provided for @reorder_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure to Reorder this order again?'**
  String get reorder_confirmation;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @youCanReferANewDistributorHere.
  ///
  /// In en, this message translates to:
  /// **'You can refer a new distributor here'**
  String get youCanReferANewDistributorHere;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @noDataFound.
  ///
  /// In en, this message translates to:
  /// **'No Data Found'**
  String get noDataFound;

  /// No description provided for @noNotificationsFound.
  ///
  /// In en, this message translates to:
  /// **'No Notifications found'**
  String get noNotificationsFound;

  /// No description provided for @yourDistributors.
  ///
  /// In en, this message translates to:
  /// **'Your Distributors'**
  String get yourDistributors;

  /// No description provided for @specialOffers.
  ///
  /// In en, this message translates to:
  /// **'Special Offers'**
  String get specialOffers;

  /// No description provided for @dealsForYou.
  ///
  /// In en, this message translates to:
  /// **'Deals For You'**
  String get dealsForYou;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'VIEW ALL'**
  String get viewAll;

  /// No description provided for @viewMore.
  ///
  /// In en, this message translates to:
  /// **'VIEW MORE'**
  String get viewMore;

  /// No description provided for @addDistributorButtonName.
  ///
  /// In en, this message translates to:
  /// **'ADD DISTRIBUTOR'**
  String get addDistributorButtonName;

  /// No description provided for @offers.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get offers;

  /// No description provided for @orderAgain.
  ///
  /// In en, this message translates to:
  /// **'Order Again'**
  String get orderAgain;

  /// No description provided for @patshala.
  ///
  /// In en, this message translates to:
  /// **'Patshala'**
  String get patshala;

  /// No description provided for @selectArea.
  ///
  /// In en, this message translates to:
  /// **'Select Area'**
  String get selectArea;

  /// No description provided for @selectRegion.
  ///
  /// In en, this message translates to:
  /// **'Select Region'**
  String get selectRegion;

  /// No description provided for @selectCity.
  ///
  /// In en, this message translates to:
  /// **'Select City'**
  String get selectCity;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @photoGallery.
  ///
  /// In en, this message translates to:
  /// **'Photo Gallery'**
  String get photoGallery;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @drugLicenseError1.
  ///
  /// In en, this message translates to:
  /// **'Please add first drug license details'**
  String get drugLicenseError1;

  /// No description provided for @drugLicenseError2.
  ///
  /// In en, this message translates to:
  /// **'Please add second drug license details'**
  String get drugLicenseError2;

  /// No description provided for @drugLicenseError3.
  ///
  /// In en, this message translates to:
  /// **'Please add first drug license details'**
  String get drugLicenseError3;

  /// No description provided for @drugLicenseNumber2.
  ///
  /// In en, this message translates to:
  /// **'Drug License Number 2'**
  String get drugLicenseNumber2;

  /// No description provided for @uploadDrugLicense2.
  ///
  /// In en, this message translates to:
  /// **'Upload Drug License 2'**
  String get uploadDrugLicense2;

  /// No description provided for @drugLicenseNumber3.
  ///
  /// In en, this message translates to:
  /// **'Drug License Number 3'**
  String get drugLicenseNumber3;

  /// No description provided for @uploadDrugLicense3.
  ///
  /// In en, this message translates to:
  /// **'Upload Drug License 3'**
  String get uploadDrugLicense3;

  /// No description provided for @drugLicenseNumberError.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Value For DL Number'**
  String get drugLicenseNumberError;

  /// No description provided for @drugLicenseFileError.
  ///
  /// In en, this message translates to:
  /// **'Please Upload Drug License Copy'**
  String get drugLicenseFileError;

  /// No description provided for @addressLengthError.
  ///
  /// In en, this message translates to:
  /// **'Shop address must include minimum 20 characters'**
  String get addressLengthError;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @wordMatch.
  ///
  /// In en, this message translates to:
  /// **'WORD MATCH'**
  String get wordMatch;

  /// No description provided for @searchBy.
  ///
  /// In en, this message translates to:
  /// **'SEARCH BY'**
  String get searchBy;

  /// No description provided for @stockAndPriority.
  ///
  /// In en, this message translates to:
  /// **'Both Stock & Priority'**
  String get stockAndPriority;

  /// No description provided for @priority.
  ///
  /// In en, this message translates to:
  /// **'Priority'**
  String get priority;

  /// No description provided for @nonMapped.
  ///
  /// In en, this message translates to:
  /// **'Non-Mapped'**
  String get nonMapped;

  /// No description provided for @onlyInStock.
  ///
  /// In en, this message translates to:
  /// **'Only in Stock'**
  String get onlyInStock;

  /// No description provided for @includeOutOfStockProducts.
  ///
  /// In en, this message translates to:
  /// **'Include out of stock products'**
  String get includeOutOfStockProducts;

  /// No description provided for @scheme_products_only.
  ///
  /// In en, this message translates to:
  /// **'Scheme products only'**
  String get scheme_products_only;

  /// No description provided for @expiryHidden.
  ///
  /// In en, this message translates to:
  /// **'Expiry hidden'**
  String get expiryHidden;

  /// No description provided for @expiryVisible.
  ///
  /// In en, this message translates to:
  /// **'Expiry visible'**
  String get expiryVisible;

  /// No description provided for @resetFilters.
  ///
  /// In en, this message translates to:
  /// **'RESET FILTERS'**
  String get resetFilters;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'APPLY'**
  String get apply;

  /// No description provided for @browseCompanies.
  ///
  /// In en, this message translates to:
  /// **'Browse Companies'**
  String get browseCompanies;

  /// No description provided for @searchByCompany.
  ///
  /// In en, this message translates to:
  /// **'Search by name, brand or therapy'**
  String get searchByCompany;

  /// No description provided for @sku.
  ///
  /// In en, this message translates to:
  /// **'SKUs'**
  String get sku;

  /// No description provided for @brands.
  ///
  /// In en, this message translates to:
  /// **'Brands'**
  String get brands;

  /// No description provided for @stock.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get stock;

  /// No description provided for @selectDistributor.
  ///
  /// In en, this message translates to:
  /// **'Select Distributor'**
  String get selectDistributor;

  /// No description provided for @changeDistributor.
  ///
  /// In en, this message translates to:
  /// **'Change Distributor'**
  String get changeDistributor;

  /// No description provided for @deleteItem.
  ///
  /// In en, this message translates to:
  /// **'Delete Item'**
  String get deleteItem;

  /// No description provided for @therapy.
  ///
  /// In en, this message translates to:
  /// **'Therapy'**
  String get therapy;

  /// No description provided for @painRelief.
  ///
  /// In en, this message translates to:
  /// **'Pain Relief'**
  String get painRelief;

  /// No description provided for @cardio.
  ///
  /// In en, this message translates to:
  /// **'Cardio'**
  String get cardio;

  /// No description provided for @vitamins.
  ///
  /// In en, this message translates to:
  /// **'Vitamins'**
  String get vitamins;

  /// No description provided for @personalCare.
  ///
  /// In en, this message translates to:
  /// **'Personal Care'**
  String get personalCare;

  /// No description provided for @noDistributorFoundForRequestedProduct.
  ///
  /// In en, this message translates to:
  /// **'No distributors found for requested product'**
  String get noDistributorFoundForRequestedProduct;

  /// No description provided for @clearFilters.
  ///
  /// In en, this message translates to:
  /// **'Clear Filters'**
  String get clearFilters;

  /// No description provided for @unfulfilled.
  ///
  /// In en, this message translates to:
  /// **'Unfulfilled'**
  String get unfulfilled;

  /// No description provided for @firstPharmacistError.
  ///
  /// In en, this message translates to:
  /// **'Please add first Pharmacist Details'**
  String get firstPharmacistError;

  /// No description provided for @secondPharmacistError.
  ///
  /// In en, this message translates to:
  /// **'Please add second Pharmacist Details'**
  String get secondPharmacistError;

  /// No description provided for @cancelOrder.
  ///
  /// In en, this message translates to:
  /// **'CANCEL ORDER'**
  String get cancelOrder;

  /// No description provided for @viewOrder.
  ///
  /// In en, this message translates to:
  /// **'VIEW ORDER'**
  String get viewOrder;

  /// No description provided for @popularProduct.
  ///
  /// In en, this message translates to:
  /// **'Popular Products'**
  String get popularProduct;

  /// No description provided for @placeOrderDescription.
  ///
  /// In en, this message translates to:
  /// **'Thank you for placing your order. You will receive confirmations from distributors upon their acceptance.'**
  String get placeOrderDescription;

  /// No description provided for @placedOrders.
  ///
  /// In en, this message translates to:
  /// **'# Orders Placed'**
  String get placedOrders;

  /// No description provided for @addProduct.
  ///
  /// In en, this message translates to:
  /// **'ADD PRODUCT'**
  String get addProduct;

  /// No description provided for @cancelOrderMsg.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel the order ?'**
  String get cancelOrderMsg;

  /// No description provided for @editPreference.
  ///
  /// In en, this message translates to:
  /// **'Edit Preference'**
  String get editPreference;

  /// No description provided for @loginId.
  ///
  /// In en, this message translates to:
  /// **'Login Id'**
  String get loginId;

  /// No description provided for @upiId.
  ///
  /// In en, this message translates to:
  /// **'UPI ID'**
  String get upiId;

  /// No description provided for @bankName.
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get bankName;

  /// No description provided for @accountType.
  ///
  /// In en, this message translates to:
  /// **'Account Type'**
  String get accountType;

  /// No description provided for @bankAccountNumber.
  ///
  /// In en, this message translates to:
  /// **'Bank Account Number'**
  String get bankAccountNumber;

  /// No description provided for @accountHolderName.
  ///
  /// In en, this message translates to:
  /// **'Account Holder Name'**
  String get accountHolderName;

  /// No description provided for @ifsc.
  ///
  /// In en, this message translates to:
  /// **'IFSC Code'**
  String get ifsc;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete Profile'**
  String get delete;

  /// No description provided for @emptyCartStr.
  ///
  /// In en, this message translates to:
  /// **'You don\"t have any product in the cart'**
  String get emptyCartStr;

  /// No description provided for @noProductStr.
  ///
  /// In en, this message translates to:
  /// **'No product found!'**
  String get noProductStr;

  /// No description provided for @addNow.
  ///
  /// In en, this message translates to:
  /// **'ADD NOW'**
  String get addNow;

  /// No description provided for @pack.
  ///
  /// In en, this message translates to:
  /// **'Pack'**
  String get pack;

  /// No description provided for @added.
  ///
  /// In en, this message translates to:
  /// **'Added'**
  String get added;

  /// No description provided for @profileDeleted.
  ///
  /// In en, this message translates to:
  /// **'Profile Deleted!'**
  String get profileDeleted;

  /// No description provided for @profileDeletedSuccesfully.
  ///
  /// In en, this message translates to:
  /// **'Your profile has been deleted succesfully'**
  String get profileDeletedSuccesfully;

  /// No description provided for @conditionsOfUseDate.
  ///
  /// In en, this message translates to:
  /// **'Last updated: May 8, 2019'**
  String get conditionsOfUseDate;

  /// No description provided for @conditionsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Conditions Of Use'**
  String get conditionsOfUse;

  /// No description provided for @condOfUseDesc.
  ///
  /// In en, this message translates to:
  /// **'Please read these Terms and Conditions (`Terms`, `Terms and Conditions`) carefully before using the http://www.pharmarack.com website (the `Service`) operated by Pharmarack (`us`, `we`, or `our`). By installing the Application (as defined below), you agree to be bound by these terms of use (`appterms`). Please review them carefully before installation and/or acceptance. \nYour access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users, and others who access or use the Service. \nBy accessing or using the Service you agree to be bound by these Terms. If you disagree with any part of the terms then you may not access the Service. The `Application` shall mean the software provided by Pharmarack to offer services related to Pharmarack, Pharmarack`s services, and its partners` services, to be used on Apple iOS and Android OS devices and any upgrades from time to time and any other software or documentation which enables the use of the Application. Any personal information you supply to Pharmarack when using the Application will be used by Pharmarack in accordance with its Privacy Policy.'**
  String get condOfUseDesc;

  /// No description provided for @accounts.
  ///
  /// In en, this message translates to:
  /// **'Accounts\n'**
  String get accounts;

  /// No description provided for @accountsDesc.
  ///
  /// In en, this message translates to:
  /// **'The Application allows you to access certain functionality available on the Pharmarack.com website. Such access will be governed by the Pharmarack Website Terms of Use. When you create an account with us, you must provide us information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of your account on our Service. \nYou are responsible for safeguarding the password that you use to access the Service and for any activities or actions under your password, whether your password is with our Service or a third-party service. You agree not to disclose your password to any third party. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account. Proprietary Rights and License. \nAll trademarks, copyright, database rights and other intellectual property rights of any nature in the Application together with the underlying software code are owned either directly by Pharmarack or by Pharmarack`s licensors. Pharmarack hereby grants you a worldwide, non-exclusive, royalty-free revocable license to use the Application for your business and personal use in accordance with these app terms.'**
  String get accountsDesc;

  /// No description provided for @condOne.
  ///
  /// In en, this message translates to:
  /// **'You will not, nor allow third parties on your behalf to (i) make and distribute copies of the Application (ii) attempt to copy, reproduce, alter, modify, reverse engineer, disassemble, decompile, transfer, exchange, or translate the Application; or (iii) create derivative works of the Application of any kind whatsoever.'**
  String get condOne;

  /// No description provided for @condTwo.
  ///
  /// In en, this message translates to:
  /// **'The Application is currently made available to you free of charge for your personal, non-commercial use. Pharmarack reserves the right to amend or withdraw the Application, or charge for the application or service provided to you in accordance with these appterms, at any time and for any reason.'**
  String get condTwo;

  /// No description provided for @condThree.
  ///
  /// In en, this message translates to:
  /// **'You acknowledge that the terms of agreement with your respective mobile network provider (Mobile Provider) will continue to apply when using the Application. As a result, you may be charged by the Mobile Provider for access to network connection services for the duration of the connection while accessing the Application or any such third-party charges as may arise. You accept responsibility for any such charges that arise.'**
  String get condThree;

  /// No description provided for @condFour.
  ///
  /// In en, this message translates to:
  /// **'If you are not the bill payer for the mobile telephone or handheld device being used to access the Application, you will be assumed to have received permission from the bill payer for using the Application.'**
  String get condFour;

  /// No description provided for @availability.
  ///
  /// In en, this message translates to:
  /// **'Availability'**
  String get availability;

  /// No description provided for @availabilityOne.
  ///
  /// In en, this message translates to:
  /// **'This Application is available to handheld mobile devices running Apple iOS and Android OS Operating Systems. Pharmarack will use reasonable efforts to make the Application available at all times. However, you acknowledge the Application is provided over the internet and mobile networks and so the quality and availability of the Application may be affected by factors outside Pharmarack`s reasonable control.'**
  String get availabilityOne;

  /// No description provided for @availabilityTwo.
  ///
  /// In en, this message translates to:
  /// **'Pharmarack, its group of companies and sub-contractors do not accept any responsibility whatsoever for unavailability of the Application, or any difficulty or inability to download or access content or any other communication system failure which may result in the Application being unavailable.'**
  String get availabilityTwo;

  /// No description provided for @availabilityThree.
  ///
  /// In en, this message translates to:
  /// **'Pharmarack will not be responsible for any support or maintenance for the Application.'**
  String get availabilityThree;

  /// No description provided for @systemReq.
  ///
  /// In en, this message translates to:
  /// **'System Requirements'**
  String get systemReq;

  /// No description provided for @systemReqOne.
  ///
  /// In en, this message translates to:
  /// **'In order to use the Application, you are required to have a compatible mobile telephone or handheld device, internet access, and the necessary minimum specifications (Software Requirements).'**
  String get systemReqOne;

  /// No description provided for @systemReqTwo.
  ///
  /// In en, this message translates to:
  /// **'The Software Requirements are as follows: Apple iOS devices running iOS 4 or iOS 5, and Android OS devices running Android OS 2.3 onwards; Language: English.'**
  String get systemReqTwo;

  /// No description provided for @systemReqThree.
  ///
  /// In en, this message translates to:
  /// **'The version of the Application software may be upgraded from time to time to add support for new functions and services.'**
  String get systemReqThree;

  /// No description provided for @obligation.
  ///
  /// In en, this message translates to:
  /// **'Obligations of Pharmarack'**
  String get obligation;

  /// No description provided for @obligationOne.
  ///
  /// In en, this message translates to:
  /// **'In the Pharmarack Application, Customer shall mean not only the Distributors but also the Wholesaler, Stockist, C&F or anyone accessing the Pharmarack Distributor Application'**
  String get obligationOne;

  /// No description provided for @obligationTwo.
  ///
  /// In en, this message translates to:
  /// **'The Distributors data, which is personal in nature and specially pertaining to the name of the Distributor, its stores, Godowns, Branches and also indicative figures pertaining to the business that such Distributor conducts, shall not be shared with any third party without the permission of the Distributor management.'**
  String get obligationTwo;

  /// No description provided for @obligationOfCustomer.
  ///
  /// In en, this message translates to:
  /// **'Obligations of Customer (Distributors, C&F, Stockist)'**
  String get obligationOfCustomer;

  /// No description provided for @obligationOfCustomerOne.
  ///
  /// In en, this message translates to:
  /// **'It will be necessary for the Distributor to give consent on sharing its retailers data, product data, stock data, stock quantity and other data as mutually agreed between Pharmarack and the Distributor. This will enable the Pharmarack Application to work as intended and fulfill the objectives of the Distributor.'**
  String get obligationOfCustomerOne;

  /// No description provided for @obligationOfCustomerThree.
  ///
  /// In en, this message translates to:
  /// **'The Pharmarack business methodology and also access to the Pharmarack Website or the Application or any other Pharmarack interface shall not be shared by the Distributor with any third party without taking prior consent from Pharmarack.'**
  String get obligationOfCustomerThree;

  /// No description provided for @termination.
  ///
  /// In en, this message translates to:
  /// **'Termination'**
  String get termination;

  /// No description provided for @terminationSub.
  ///
  /// In en, this message translates to:
  /// **'Pharmarack may terminate use of the Application and Service at any time by giving notice of termination to you. We may terminate or suspend access immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.'**
  String get terminationSub;

  /// No description provided for @terminationDesc.
  ///
  /// In en, this message translates to:
  /// **'All provisions of the Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability. We may terminate or suspend your account immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.\nUpon termination, (a) the rights and licenses granted to you herein shall terminate; (b) you must cease all use of the Software. If you wish to terminate your account, you may simply discontinue using the Service and Application.\nAll provisions of the Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.'**
  String get terminationDesc;

  /// No description provided for @limitation.
  ///
  /// In en, this message translates to:
  /// **'Limitation of Liability'**
  String get limitation;

  /// No description provided for @limitationOne.
  ///
  /// In en, this message translates to:
  /// **'In no event will Pharmarack be liable for any direct, indirect, special, punitive, exemplary or consequential losses or damages of whatsoever kind arising out of your use or access to the Application, including loss of profit or the like whether or not in the contemplation of the parties, whether based on breach of contract, tort (including negligence), product liability or otherwise.'**
  String get limitationOne;

  /// No description provided for @limitationTwo.
  ///
  /// In en, this message translates to:
  /// **'Pharmarack is not liable to you for any damage or alteration to your equipment including but not limited to computer equipment, handheld device or mobile telephones as a result of the installation or use of the Application.'**
  String get limitationTwo;

  /// No description provided for @indemnity.
  ///
  /// In en, this message translates to:
  /// **'Indemnity'**
  String get indemnity;

  /// No description provided for @indemnityOne.
  ///
  /// In en, this message translates to:
  /// **'You agree to indemnify, defend and hold harmless Pharmarack and its affiliates, agents, respective employees, directors, officers, agents, managers, vendors and suppliers from and against any liability, losses, claims, damages, demands, investigations, inquiries, suits, costs and expenses (including legal fee and costs incidental thereto) asserted against or incurred, that arise out of or otherwise relating to your use of the Website and Application, including without limitation any obligation to be performed by you pursuant to these Terms. Further, you agree to hold Pharmarack harmless against any claims made by any third party due to, or arising out of or otherwise relating to your use of the Website or Application, any claim arising out of damage caused to third party by you, breach of these Terms by you, or your violation of any rights of another, including any intellectual property rights. Further, you agree to hold Pharmarack harmless against any claims made by any third party due to legal suits regarding the originality, copyright issues, your violation of any third party right, including without limitation any copyright, property, or privacy right. This defense and indemnification obligation will survive these Terms.'**
  String get indemnityOne;

  /// No description provided for @indemnityTwo.
  ///
  /// In en, this message translates to:
  /// **'Notwithstanding anything to the contrary, our entire liability towards You under these Terms or otherwise shall only be in connection with refund of the money charged from you for any particular product or service, under which the unlikely liability arises.'**
  String get indemnityTwo;

  /// No description provided for @governingLaw.
  ///
  /// In en, this message translates to:
  /// **'Governing Law'**
  String get governingLaw;

  /// No description provided for @governingLawDesc.
  ///
  /// In en, this message translates to:
  /// **'These Terms shall be governed and construed in accordance with the laws of India, without regard to its conflict of law provisions.\nOur failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service and Application, and supersede and replace any prior agreements we might have between us regarding the Service and Application.'**
  String get governingLawDesc;

  /// No description provided for @warranties.
  ///
  /// In en, this message translates to:
  /// **'Disclaimer of Warranties'**
  String get warranties;

  /// No description provided for @warrantiesDesc.
  ///
  /// In en, this message translates to:
  /// **'To the maximum extent permitted by law, and for the avoidance of doubt, save for section 2 of the Supply of Goods and Services Act 1982, Pharmarack hereby disclaims all implied warranties with regard to the Application. The Application and software are provided \"as is\" and \"as available\" without warranty of any kind.'**
  String get warrantiesDesc;

  /// No description provided for @linksTNC.
  ///
  /// In en, this message translates to:
  /// **'Links to Other Web Sites'**
  String get linksTNC;

  /// No description provided for @linksTNCDesc.
  ///
  /// In en, this message translates to:
  /// **'Our Service may contain links to third-party web sites or services that are not owned or controlled by Pharmarack. Pharmarack has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that Pharmarack shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with the use of or reliance on any such content, goods, or services available on or through any such web sites or services.\nWe strongly advise you to read the terms and conditions and privacy policies of any third-party web sites or services that you visit.\n'**
  String get linksTNCDesc;

  /// No description provided for @changes.
  ///
  /// In en, this message translates to:
  /// **'Changes'**
  String get changes;

  /// No description provided for @changesDesc.
  ///
  /// In en, this message translates to:
  /// **'We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material we will try to provide at least 15 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.\nBy continuing to access or use our Service after those revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, please stop using the Service.\n'**
  String get changesDesc;

  /// No description provided for @contactUsDesc.
  ///
  /// In en, this message translates to:
  /// **'If you have any questions about these Terms, please contact us.\n'**
  String get contactUsDesc;

  /// No description provided for @privancyPolicyDate.
  ///
  /// In en, this message translates to:
  /// **'Last updated: May 17, 2023'**
  String get privancyPolicyDate;

  /// No description provided for @privancyPolicyDesc.
  ///
  /// In en, this message translates to:
  /// **'PharmaRack (\"us\", \"we\", or \"our\") operates the http://www.pharmarack.com website (the \"Service\"). This privacy policy governs your use of the software application PharmaRack (\"Application\") for mobile devices that was created by PharmaRack.This page informs you of our policies regarding the collection, use and disclosure of Personal Information when you use our Service. Registration with us is mandatory in order to be able to use the basic features of the Application. We will not use or share your information with anyone except as described in this Privacy Policy.We use your Personal Information for providing and improving the Service. By using the Service, you agree to the collection and use of information in accordance with this policy. Unless otherwise definedin this Privacy Policy, terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, accessible at http://www.pharmarack.com.\n'**
  String get privancyPolicyDesc;

  /// No description provided for @ppInfoColl.
  ///
  /// In en, this message translates to:
  /// **'Information Collection and Use'**
  String get ppInfoColl;

  /// No description provided for @ppInfoCollDesc.
  ///
  /// In en, this message translates to:
  /// **'While using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you. Personally identifiable information may include, but is not limited to, your name, phone number, postal address and other information (\"Personal Information\"). When you register with us and use the Application, you generally provide (a) your name, email address, age, user name, password and other registration information; (b) transaction-related information, such as when you make purchases, respond to any offers, or download or use applications from us; (c) information you provide us when you contact us for help; (d) credit card information for purchase and use of the Application, and; (e) information you enter into our system when using the Application, such as contact information and project management information. To verify the business on Pharmarack Technologies, the images of Drug License Copy, profile photo, GST, PAN, etc. are required.\n'**
  String get ppInfoCollDesc;

  /// No description provided for @ppLogData.
  ///
  /// In en, this message translates to:
  /// **'Log Data'**
  String get ppLogData;

  /// No description provided for @ppCookies.
  ///
  /// In en, this message translates to:
  /// **'Cookies'**
  String get ppCookies;

  /// No description provided for @ppServiceProviders.
  ///
  /// In en, this message translates to:
  /// **'Service Providers'**
  String get ppServiceProviders;

  /// No description provided for @ppServiceProvidersDesc.
  ///
  /// In en, this message translates to:
  /// **'We may employ third party companies and individuals to facilitate our Service, to provide the Service on our behalf, to perform Service-related services or to assist us in analyzing how our Service is used. These third parties have access to your Personal Information only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.'**
  String get ppServiceProvidersDesc;

  /// No description provided for @ppServiceProvidersDescOne.
  ///
  /// In en, this message translates to:
  /// **'Only aggregated, anonymized data is periodically transmitted to external services to help us improve the Application and our service. We will share your information with third parties only in the ways that are described in this privacy statement.'**
  String get ppServiceProvidersDescOne;

  /// No description provided for @ppServiceProvidersDescTwo.
  ///
  /// In en, this message translates to:
  /// **'We may disclose User Provided and Automatically Collected Information:'**
  String get ppServiceProvidersDescTwo;

  /// No description provided for @ppServiceProvidersOne.
  ///
  /// In en, this message translates to:
  /// **'as required by law, such as to comply with a subpoena, or similar legal process'**
  String get ppServiceProvidersOne;

  /// No description provided for @ppServiceProvidersTwo.
  ///
  /// In en, this message translates to:
  /// **'when we believe in good faith that disclosure is necessary to protect our rights, protect your safety or the safety of others, investigate fraud, or respond to a government request'**
  String get ppServiceProvidersTwo;

  /// No description provided for @ppServiceProvidersThree.
  ///
  /// In en, this message translates to:
  /// **'with our trusted services providers who work on our behalf, do not have an independent use of the information we disclose to them, and have agreed to adhere to the rules set forth in this privacy statement'**
  String get ppServiceProvidersThree;

  /// No description provided for @ppServiceProvidersFour.
  ///
  /// In en, this message translates to:
  /// **'if PharmaRack is involved in a merger, acquisition, or sale of all or a portion of its assets, you will be notified via email and/or a prominent notice on our Web site of any change in ownership or uses of this information, as well as any choices you may have regarding this information'**
  String get ppServiceProvidersFour;

  /// No description provided for @ppDataReten.
  ///
  /// In en, this message translates to:
  /// **'Data Retention Policy, Managing Your Information'**
  String get ppDataReten;

  /// No description provided for @ppDataRetenDesc.
  ///
  /// In en, this message translates to:
  /// **'We will retain User Provided data for as long as you use the Application and for a reasonable time thereafter. We will retain Automatically Collected information for up to 24 months and thereafter may store it in aggregate. If you’d like us to delete User Provided Data that you have provided via the Application, please contact us at info@pharmarack.com and we will respond in a reasonable time. Please note that some or all of the User Provided Data may be required in order for the Application to function properly. You further authorize us to share the secondary sales and stock data with the respective company and on such company making a written request for the said data. The data so disclosed will be at a consolidated level, and shall not personally identify any of your customer.'**
  String get ppDataRetenDesc;

  /// No description provided for @ppLinks.
  ///
  /// In en, this message translates to:
  /// **'Links To Other Sites'**
  String get ppLinks;

  /// No description provided for @obligationOfCustomerTwo.
  ///
  /// In en, this message translates to:
  /// **'It is incumbent on the Distributor to give consent and authorize Pharmarack to install its Application at the Distributors server or other relevant accessible Infrastructure / location (with connectivity to server or relevant database or patch required for Pharmarack) to sync relevant data as a prerequisite for using the Pharmarack Application. The Distributor will be required to mandatorily confirm all the fields that can be synced by Pharmarack on regular basis.'**
  String get obligationOfCustomerTwo;

  /// No description provided for @limitationThree.
  ///
  /// In en, this message translates to:
  /// **'Nothing in these Appterms shall exclude or limit Pharmaracks liability for death or personal injury caused by negligence or for fraud or fraudulent misrepresentation or any other liability which cannot be excluded or limited under applicable law.'**
  String get limitationThree;

  /// No description provided for @ppLogDataDesc.
  ///
  /// In en, this message translates to:
  /// **'In addition, the Application may collect certain information automatically, including, but not limited to, the type of mobile device you use, your mobile devices unique device ID, the IP address of your mobile device, your mobile operating system, the type of mobile Internet browsers you use, and information about the way you use the Application. This Application does not collect precise information about the location of your mobile device.'**
  String get ppLogDataDesc;

  /// No description provided for @ppCookiesDesc.
  ///
  /// In en, this message translates to:
  /// **'Cookies are files with small amount of data, which may include an anonymous unique identifier. Cookies are sent to your browser from a web site and stored on your computers hard drive. We use cookies to collect information. You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our Service.'**
  String get ppCookiesDesc;

  /// No description provided for @ppLinksDesc.
  ///
  /// In en, this message translates to:
  /// **'Our Service may contain links to other sites that are not operated by us. If you click on a third-party link, you will be directed to that third partys site. We strongly advise you to review the Privacy Policy of every site you visit. We have no control over, and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.'**
  String get ppLinksDesc;

  /// No description provided for @ppSecurity.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get ppSecurity;

  /// No description provided for @ppSecurityDesc.
  ///
  /// In en, this message translates to:
  /// **'We are concerned about safeguarding the confidentiality of your information. We provide physical, electronic, and procedural safeguards to protect information we process and maintain. For example, we limit access to this information to authorized employees and contractors who need to know that information in order to operate, develop or improve our Application. Please be aware that, although we endeavor provide reasonable security for information we process and maintain, no security system can prevent all potential security breaches.'**
  String get ppSecurityDesc;

  /// No description provided for @ppChanges.
  ///
  /// In en, this message translates to:
  /// **'Changes to This Privacy Policy'**
  String get ppChanges;

  /// No description provided for @ppChangesDesc.
  ///
  /// In en, this message translates to:
  /// **'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and informing you via email or text message. You are advised to review this Privacy Policy periodically for any changes, as continued use is deemed approval of all changes. Changes to this Privacy Policy are effective when they are posted on this page.'**
  String get ppChangesDesc;

  /// No description provided for @ppYourConsent.
  ///
  /// In en, this message translates to:
  /// **'Your Consent'**
  String get ppYourConsent;

  /// No description provided for @ppYourConsentDesc.
  ///
  /// In en, this message translates to:
  /// **'By using the Application, you are consenting to our processing of your information as set forth in this Privacy Policy now and as amended by us. \"Processing,\" means using cookies on a computer/hand held device or using or touching information in any way, including, but not limited to, collecting, storing, deleting, using, combining and disclosing information, all of which activities will take place in India. We shall not disclose the user’s data with any third parties, except to the extent provided under this privacy policy, without your prior written consent.'**
  String get ppYourConsentDesc;

  /// No description provided for @ppContactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get ppContactUs;

  /// No description provided for @ppContactUsDesc.
  ///
  /// In en, this message translates to:
  /// **'If you have any questions regarding privacy while using the Application, or have questions about our practices, please contact us via email at info@pharmarack.com'**
  String get ppContactUsDesc;

  /// No description provided for @partySoonMsg.
  ///
  /// In en, this message translates to:
  /// **'Dear Retailer, Your party will be locked soon by stockist, Please pay the outstanding balance'**
  String get partySoonMsg;

  /// No description provided for @partyLockedDistributor.
  ///
  /// In en, this message translates to:
  /// **'Dear Retailer, the selected distributor has locked you. We can\'\'t show any products or deals from this distributor, please select other distributor to continue!'**
  String get partyLockedDistributor;

  /// No description provided for @failedToPreviouspasswordChanage.
  ///
  /// In en, this message translates to:
  /// **'You have already used this password'**
  String get failedToPreviouspasswordChanage;

  /// No description provided for @applicationNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'This application is currently not available in your region. Please download the alternate version of Pharmarack to proceed'**
  String get applicationNotAvailable;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
