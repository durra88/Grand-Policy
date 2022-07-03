
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/app_localizations.dart';
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
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
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
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// No description provided for @hrPanel.
  ///
  /// In en, this message translates to:
  /// **'HR Panel'**
  String get hrPanel;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @loans.
  ///
  /// In en, this message translates to:
  /// **'Loans'**
  String get loans;

  /// No description provided for @overtime.
  ///
  /// In en, this message translates to:
  /// **'Overtime'**
  String get overtime;

  /// No description provided for @vacations.
  ///
  /// In en, this message translates to:
  /// **'Vacations'**
  String get vacations;

  /// No description provided for @excuses.
  ///
  /// In en, this message translates to:
  /// **'Excuses'**
  String get excuses;

  /// No description provided for @requestDetail.
  ///
  /// In en, this message translates to:
  /// **'Request Detail'**
  String get requestDetail;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @viewDocuments.
  ///
  /// In en, this message translates to:
  /// **'View Documents'**
  String get viewDocuments;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// No description provided for @cancelsuccessfully.
  ///
  /// In en, this message translates to:
  /// **'cancel successfully!'**
  String get cancelsuccessfully;

  /// No description provided for @requestType.
  ///
  /// In en, this message translates to:
  /// **'Request Type'**
  String get requestType;

  /// No description provided for @department.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get department;

  /// No description provided for @emailingTo.
  ///
  /// In en, this message translates to:
  /// **'Emailing to'**
  String get emailingTo;

  /// No description provided for @requestDetails.
  ///
  /// In en, this message translates to:
  /// **'Request Details'**
  String get requestDetails;

  /// No description provided for @informTo.
  ///
  /// In en, this message translates to:
  /// **'Inform To'**
  String get informTo;

  /// No description provided for @uploadDocuments.
  ///
  /// In en, this message translates to:
  /// **'Upload Documents'**
  String get uploadDocuments;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @requestService.
  ///
  /// In en, this message translates to:
  /// **'Request Service'**
  String get requestService;

  /// No description provided for @emptyField.
  ///
  /// In en, this message translates to:
  /// **'this field is empty'**
  String get emptyField;

  /// No description provided for @sentSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Sent Successfully!'**
  String get sentSuccessfully;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @employees.
  ///
  /// In en, this message translates to:
  /// **'Employees'**
  String get employees;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @noOfHours.
  ///
  /// In en, this message translates to:
  /// **'No. of Hours'**
  String get noOfHours;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @overtimeRequest.
  ///
  /// In en, this message translates to:
  /// **'Overtime Request'**
  String get overtimeRequest;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @settled.
  ///
  /// In en, this message translates to:
  /// **'Settled'**
  String get settled;

  /// No description provided for @loanAmount.
  ///
  /// In en, this message translates to:
  /// **'Loan Amount'**
  String get loanAmount;

  /// No description provided for @deductedFromSalary.
  ///
  /// In en, this message translates to:
  /// **'Deducted from Salary'**
  String get deductedFromSalary;

  /// No description provided for @createdOn.
  ///
  /// In en, this message translates to:
  /// **'Created on'**
  String get createdOn;

  /// No description provided for @totalLoan.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get totalLoan;

  /// No description provided for @totalPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get totalPaid;

  /// No description provided for @totalPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get totalPending;

  /// No description provided for @loanRequest.
  ///
  /// In en, this message translates to:
  /// **'Loan Request'**
  String get loanRequest;

  /// No description provided for @loanType.
  ///
  /// In en, this message translates to:
  /// **'Loan Type'**
  String get loanType;

  /// No description provided for @noOfInstallment.
  ///
  /// In en, this message translates to:
  /// **'No of Installement'**
  String get noOfInstallment;

  /// No description provided for @notdeductedFromSalary.
  ///
  /// In en, this message translates to:
  /// **'Not deducted from salary'**
  String get notdeductedFromSalary;

  /// No description provided for @installmentStart.
  ///
  /// In en, this message translates to:
  /// **'Installment Start'**
  String get installmentStart;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @excuseFrom.
  ///
  /// In en, this message translates to:
  /// **'Excuse From'**
  String get excuseFrom;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get hours;

  /// No description provided for @leaveReason.
  ///
  /// In en, this message translates to:
  /// **'Leave Reason'**
  String get leaveReason;

  /// No description provided for @backToWorkTime.
  ///
  /// In en, this message translates to:
  /// **'Back To Work Time'**
  String get backToWorkTime;

  /// No description provided for @excuseRequest.
  ///
  /// In en, this message translates to:
  /// **'Excuse Request'**
  String get excuseRequest;

  /// No description provided for @hRManagerEmail.
  ///
  /// In en, this message translates to:
  /// **'HR Manager Email'**
  String get hRManagerEmail;

  /// No description provided for @excuseType.
  ///
  /// In en, this message translates to:
  /// **'Excuse Type'**
  String get excuseType;

  /// No description provided for @hour.
  ///
  /// In en, this message translates to:
  /// **'Hour'**
  String get hour;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @dateTo.
  ///
  /// In en, this message translates to:
  /// **'Date To'**
  String get dateTo;

  /// No description provided for @totalHours.
  ///
  /// In en, this message translates to:
  /// **'Total  Hours'**
  String get totalHours;

  /// No description provided for @requests.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get requests;

  /// No description provided for @noOfDays.
  ///
  /// In en, this message translates to:
  /// **'No of Days'**
  String get noOfDays;

  /// No description provided for @leaveType.
  ///
  /// In en, this message translates to:
  /// **'Leave Type'**
  String get leaveType;

  /// No description provided for @deductedFromBalance.
  ///
  /// In en, this message translates to:
  /// **'Deducted From Balance'**
  String get deductedFromBalance;

  /// No description provided for @contactDetails.
  ///
  /// In en, this message translates to:
  /// **'Contact Details'**
  String get contactDetails;

  /// No description provided for @approve.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get approve;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// No description provided for @cancelRequest.
  ///
  /// In en, this message translates to:
  /// **'Cancel Request'**
  String get cancelRequest;

  /// No description provided for @alternativeEmployes.
  ///
  /// In en, this message translates to:
  /// **'Alternative Employees'**
  String get alternativeEmployes;

  /// No description provided for @backToWork.
  ///
  /// In en, this message translates to:
  /// **'Back to Work'**
  String get backToWork;

  /// No description provided for @vacationRequest.
  ///
  /// In en, this message translates to:
  /// **'Vacation Request'**
  String get vacationRequest;

  /// No description provided for @leave.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get leave;

  /// No description provided for @entitlement.
  ///
  /// In en, this message translates to:
  /// **'Entitlement'**
  String get entitlement;

  /// No description provided for @daysTaken.
  ///
  /// In en, this message translates to:
  /// **'Days Taken'**
  String get daysTaken;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @vacationBalance.
  ///
  /// In en, this message translates to:
  /// **'Vacation Balance'**
  String get vacationBalance;

  /// No description provided for @periodFrom.
  ///
  /// In en, this message translates to:
  /// **'Period from'**
  String get periodFrom;

  /// No description provided for @totalNoOfDays.
  ///
  /// In en, this message translates to:
  /// **'Total no. of days'**
  String get totalNoOfDays;

  /// No description provided for @holidayList.
  ///
  /// In en, this message translates to:
  /// **'Holiday List'**
  String get holidayList;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'PersonalInformationDetails'**
  String get personalInformation;

  /// No description provided for @staffID.
  ///
  /// In en, this message translates to:
  /// **'StaffID'**
  String get staffID;

  /// No description provided for @oldStaffID.
  ///
  /// In en, this message translates to:
  /// **'OldStuffID'**
  String get oldStaffID;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'FullName'**
  String get fullName;

  /// No description provided for @arabicFullName.
  ///
  /// In en, this message translates to:
  /// **'FullNameArabic'**
  String get arabicFullName;

  /// No description provided for @maritalStatus.
  ///
  /// In en, this message translates to:
  /// **'MaritalStatus'**
  String get maritalStatus;

  /// No description provided for @nationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get nationality;

  /// No description provided for @religion.
  ///
  /// In en, this message translates to:
  /// **'Religion'**
  String get religion;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'DateofBirth'**
  String get dateOfBirth;

  /// No description provided for @extention.
  ///
  /// In en, this message translates to:
  /// **'Extension'**
  String get extention;

  /// No description provided for @tele.
  ///
  /// In en, this message translates to:
  /// **'Tele'**
  String get tele;

  /// No description provided for @mobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get mobile;

  /// No description provided for @faxNo.
  ///
  /// In en, this message translates to:
  /// **'FaxNo'**
  String get faxNo;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get email;

  /// No description provided for @sponsor.
  ///
  /// In en, this message translates to:
  /// **'Sponsor'**
  String get sponsor;

  /// No description provided for @gosiNo.
  ///
  /// In en, this message translates to:
  /// **'GOSI No'**
  String get gosiNo;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @labourCardDetails.
  ///
  /// In en, this message translates to:
  /// **'Labour Card Details'**
  String get labourCardDetails;

  /// No description provided for @staffCardNo.
  ///
  /// In en, this message translates to:
  /// **'Staff Card no'**
  String get staffCardNo;

  /// No description provided for @companyNo.
  ///
  /// In en, this message translates to:
  /// **'Companyn o'**
  String get companyNo;

  /// No description provided for @issuePlace.
  ///
  /// In en, this message translates to:
  /// **'Issue Place'**
  String get issuePlace;

  /// No description provided for @issueDate.
  ///
  /// In en, this message translates to:
  /// **'Issue Date'**
  String get issueDate;

  /// No description provided for @expiryDate.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date'**
  String get expiryDate;

  /// No description provided for @idDetails.
  ///
  /// In en, this message translates to:
  /// **'ID Details'**
  String get idDetails;

  /// No description provided for @idNo.
  ///
  /// In en, this message translates to:
  /// **'ID No'**
  String get idNo;

  /// No description provided for @idIssuePlace.
  ///
  /// In en, this message translates to:
  /// **'Issue Place'**
  String get idIssuePlace;

  /// No description provided for @idIssuePlaceArabic.
  ///
  /// In en, this message translates to:
  /// **'Issue Place Arabic'**
  String get idIssuePlaceArabic;

  /// No description provided for @idIssueDate.
  ///
  /// In en, this message translates to:
  /// **'Issue Date'**
  String get idIssueDate;

  /// No description provided for @idExpiryDate.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date'**
  String get idExpiryDate;

  /// No description provided for @passportDetails.
  ///
  /// In en, this message translates to:
  /// **'Passport Details'**
  String get passportDetails;

  /// No description provided for @passportNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get passportNo;

  /// No description provided for @passportIssuePlace.
  ///
  /// In en, this message translates to:
  /// **'Issue Place'**
  String get passportIssuePlace;

  /// No description provided for @passportIssuePlaceArabic.
  ///
  /// In en, this message translates to:
  /// **'Issue Place Arabic'**
  String get passportIssuePlaceArabic;

  /// No description provided for @passportIssueDate.
  ///
  /// In en, this message translates to:
  /// **'Issue Date'**
  String get passportIssueDate;

  /// No description provided for @passportExpiryDate.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date'**
  String get passportExpiryDate;

  /// No description provided for @branch.
  ///
  /// In en, this message translates to:
  /// **'Branch'**
  String get branch;

  /// No description provided for @jobTitle.
  ///
  /// In en, this message translates to:
  /// **'JobTitle'**
  String get jobTitle;

  /// No description provided for @hireDate.
  ///
  /// In en, this message translates to:
  /// **'HireDate'**
  String get hireDate;

  /// No description provided for @division.
  ///
  /// In en, this message translates to:
  /// **'Division'**
  String get division;

  /// No description provided for @salaryDetails.
  ///
  /// In en, this message translates to:
  /// **'Salary Details'**
  String get salaryDetails;

  /// No description provided for @basicSalary.
  ///
  /// In en, this message translates to:
  /// **'Basic Salary'**
  String get basicSalary;

  /// No description provided for @housingAllowance.
  ///
  /// In en, this message translates to:
  /// **'Housing Allowance'**
  String get housingAllowance;

  /// No description provided for @transportationAllowance.
  ///
  /// In en, this message translates to:
  /// **'Transporte Allowance'**
  String get transportationAllowance;

  /// No description provided for @otherAllowance.
  ///
  /// In en, this message translates to:
  /// **'Other Allowance'**
  String get otherAllowance;

  /// No description provided for @totalSalary.
  ///
  /// In en, this message translates to:
  /// **'Total Salary'**
  String get totalSalary;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get goodMorning;

  /// No description provided for @goodAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good Afternoon'**
  String get goodAfternoon;

  /// No description provided for @goodEvening.
  ///
  /// In en, this message translates to:
  /// **'Good Evening'**
  String get goodEvening;

  /// No description provided for @goodNight.
  ///
  /// In en, this message translates to:
  /// **'Good Night'**
  String get goodNight;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Info'**
  String get personalInfo;

  /// No description provided for @jobDetails.
  ///
  /// In en, this message translates to:
  /// **'Job Details'**
  String get jobDetails;

  /// No description provided for @labourCard.
  ///
  /// In en, this message translates to:
  /// **'Labour Card'**
  String get labourCard;

  /// No description provided for @medicalInfo.
  ///
  /// In en, this message translates to:
  /// **'Medical Info'**
  String get medicalInfo;

  /// No description provided for @emergencyContact.
  ///
  /// In en, this message translates to:
  /// **'Emergency Contact'**
  String get emergencyContact;

  /// No description provided for @bloodType.
  ///
  /// In en, this message translates to:
  /// **'Blood Type'**
  String get bloodType;

  /// No description provided for @doctorsName.
  ///
  /// In en, this message translates to:
  /// **'Doctors Name'**
  String get doctorsName;

  /// No description provided for @medicalConditions.
  ///
  /// In en, this message translates to:
  /// **'Medical Conditions'**
  String get medicalConditions;

  /// No description provided for @allergies.
  ///
  /// In en, this message translates to:
  /// **'allergies'**
  String get allergies;

  /// No description provided for @currentMedications.
  ///
  /// In en, this message translates to:
  /// **'Current Medications'**
  String get currentMedications;

  /// No description provided for @emergencyName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get emergencyName;

  /// No description provided for @emergencyRelation.
  ///
  /// In en, this message translates to:
  /// **'Relation'**
  String get emergencyRelation;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @medicalEmergencyContact.
  ///
  /// In en, this message translates to:
  /// **'Medical & Emergency Contact'**
  String get medicalEmergencyContact;

  /// No description provided for @dorterAddress.
  ///
  /// In en, this message translates to:
  /// **'Dorter\'s Address'**
  String get dorterAddress;

  /// No description provided for @installementDetails.
  ///
  /// In en, this message translates to:
  /// **'Installment Details '**
  String get installementDetails;

  /// No description provided for @noInternet.
  ///
  /// In en, this message translates to:
  /// **'no internet'**
  String get noInternet;

  /// No description provided for @approvedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Approved Successfully!'**
  String get approvedSuccessfully;

  /// No description provided for @rejectedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Rejected Successfully!'**
  String get rejectedSuccessfully;

  /// No description provided for @emptydata.
  ///
  /// In en, this message translates to:
  /// **'Empty Data'**
  String get emptydata;

  /// No description provided for @manageVacations.
  ///
  /// In en, this message translates to:
  /// **'Manage Vacations'**
  String get manageVacations;

  /// No description provided for @leaves.
  ///
  /// In en, this message translates to:
  /// **'Leaves'**
  String get leaves;

  /// No description provided for @holidaysInBetween.
  ///
  /// In en, this message translates to:
  /// **'Holidays in Between'**
  String get holidaysInBetween;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @ensuredLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out'**
  String get ensuredLogout;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @signInTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign In now to begin an amazing journey'**
  String get signInTitle;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @offlineMesg.
  ///
  /// In en, this message translates to:
  /// **'Please ckeck Internet connection'**
  String get offlineMesg;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'try again'**
  String get tryAgain;

  /// No description provided for @tryAgainMsg.
  ///
  /// In en, this message translates to:
  /// **'wrong Username or Password'**
  String get tryAgainMsg;

  /// No description provided for @almamoon.
  ///
  /// In en, this message translates to:
  /// **'Al Mamoon'**
  String get almamoon;

  /// No description provided for @grandPolicy.
  ///
  /// In en, this message translates to:
  /// **'Grand Policy'**
  String get grandPolicy;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @welcomeScreenDescriptionOne.
  ///
  /// In en, this message translates to:
  /// **'Set your all employee details includes staff profile, medical&emergency details, loan,decuction, overtime,vacation request'**
  String get welcomeScreenDescriptionOne;

  /// No description provided for @welcomeScreenDescriptionTwo.
  ///
  /// In en, this message translates to:
  /// **'Set your all employee details includes staff profile, medical&emergency details, loan,decuction'**
  String get welcomeScreenDescriptionTwo;

  /// No description provided for @welcomeScreenDescriptionThree.
  ///
  /// In en, this message translates to:
  /// **'Set your all employee details includes staff profile, medical&emergency details, loan,decuction'**
  String get welcomeScreenDescriptionThree;

  /// No description provided for @changeLang.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLang;

  /// No description provided for @changeLangText.
  ///
  /// In en, this message translates to:
  /// **'Which language do  you prefer?'**
  String get changeLangText;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
