import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @welcomeToAlfaresi.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Alfaresi'**
  String get welcomeToAlfaresi;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @discoverInnovativeDigital.
  ///
  /// In en, this message translates to:
  /// **'Discover innovative digital marketing solutions where technology meets entrepreneurship. '**
  String get discoverInnovativeDigital;

  /// No description provided for @marketing.
  ///
  /// In en, this message translates to:
  /// **'Marketing'**
  String get marketing;

  /// No description provided for @software.
  ///
  /// In en, this message translates to:
  /// **'software'**
  String get software;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'services'**
  String get services;

  /// No description provided for @partners.
  ///
  /// In en, this message translates to:
  /// **'Partner'**
  String get partners;

  /// No description provided for @whyLaunchWithAlfaresi.
  ///
  /// In en, this message translates to:
  /// **'Why Launch with Al-Farsi Media?'**
  String get whyLaunchWithAlfaresi;

  /// No description provided for @whyLaunchWithAlfaresiDesc.
  ///
  /// In en, this message translates to:
  /// **'We redefine your marketing journey in a world where competition is fierce! From your first spark of an idea to dominating the market, what sets us apart? Our marketers turn challenges into **unforgettable success sagas.'**
  String get whyLaunchWithAlfaresiDesc;

  /// No description provided for @howDoWeSupercharge.
  ///
  /// In en, this message translates to:
  /// **'How Do We Supercharge Your Growth?'**
  String get howDoWeSupercharge;

  /// No description provided for @howDoWeSuperchargeDesc.
  ///
  /// In en, this message translates to:
  /// **'We transform hurdles into opportunities and ideas into vibrant, living campaigns. Your 360° partner in the marketing universe:'**
  String get howDoWeSuperchargeDesc;

  /// No description provided for @howDoWeSuperchargeFirstTitle.
  ///
  /// In en, this message translates to:
  /// **'Digital Identity Crafting'**
  String get howDoWeSuperchargeFirstTitle;

  /// No description provided for @howDoWeSuperchargeFirstDesc.
  ///
  /// In en, this message translates to:
  /// **'From logo to brand soul, we weave your story with precision and purpose, creating lasting impressions.'**
  String get howDoWeSuperchargeFirstDesc;

  /// No description provided for @howDoWeSuperchargeSecondTitle.
  ///
  /// In en, this message translates to:
  /// **'Data-Driven Strategies'**
  String get howDoWeSuperchargeSecondTitle;

  /// No description provided for @howDoWeSuperchargeSecondDesc.
  ///
  /// In en, this message translates to:
  /// **'Smart targeting, sector-specific innovation, and analytics that speak volumes with clarity and confidence.'**
  String get howDoWeSuperchargeSecondDesc;

  /// No description provided for @howDoWeSuperchargeThirdTitle.
  ///
  /// In en, this message translates to:
  /// **'Campaign Mastery'**
  String get howDoWeSuperchargeThirdTitle;

  /// No description provided for @howDoWeSuperchargeThirdDesc.
  ///
  /// In en, this message translates to:
  /// **'Social media buzz to razor-sharp paid ads—we deliver maximum reach, impact, and brand growth.'**
  String get howDoWeSuperchargeThirdDesc;

  /// No description provided for @howDoWeSuperchargeFourth.
  ///
  /// In en, this message translates to:
  /// **'Social media buzz to razor-sharp paid ads—we deliver maximum reach, impact, and brand growth.'**
  String get howDoWeSuperchargeFourth;

  /// No description provided for @howDoWeSuperchargeFourthDesc.
  ///
  /// In en, this message translates to:
  /// **'Captivating content + interactive experiences = loyal fans for life and lasting brand love.'**
  String get howDoWeSuperchargeFourthDesc;

  /// No description provided for @smartStart.
  ///
  /// In en, this message translates to:
  /// **'Small Start, Epic Finish'**
  String get smartStart;

  /// No description provided for @smartStartDesc.
  ///
  /// In en, this message translates to:
  /// **'Zero budget stress! Our plans start at symbolic prices and grow with you—so you only pay for what you need.  '**
  String get smartStartDesc;

  /// No description provided for @smartStartFirst.
  ///
  /// In en, this message translates to:
  /// **'Newbie-Friendly Packages: Tailored for rising entrepreneurs.'**
  String get smartStartFirst;

  /// No description provided for @smartStartFirstSecond.
  ///
  /// In en, this message translates to:
  /// **'No Hidden Fees: Transparent pricing, zero sneaky charges.  '**
  String get smartStartFirstSecond;

  /// No description provided for @smartStartThird.
  ///
  /// In en, this message translates to:
  /// **'Flexible Scaling: Pay as you grow. Your success, your terms. '**
  String get smartStartThird;

  /// No description provided for @weDontJustMakeYouVisible.
  ///
  /// In en, this message translates to:
  /// **'We Don’t Just Make You Visible, We Make You UNIGNORABLE.'**
  String get weDontJustMakeYouVisible;

  /// No description provided for @weDontJustMakeYouVisibleDesc.
  ///
  /// In en, this message translates to:
  /// **'First step? Hit “Contact” now. Let’s turn your “what if” into “what’s next”!'**
  String get weDontJustMakeYouVisibleDesc;

  /// No description provided for @yourFirstDestination.
  ///
  /// In en, this message translates to:
  /// **'Your First destination for digital marketing solutions'**
  String get yourFirstDestination;

  /// No description provided for @combineTechnologyEntrepreneurship.
  ///
  /// In en, this message translates to:
  /// **'We combine technology and \nentrepreneurship'**
  String get combineTechnologyEntrepreneurship;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @alFaresiSoftwareTitle.
  ///
  /// In en, this message translates to:
  /// **'Al-Faresi for Software Solutions and Information Technology'**
  String get alFaresiSoftwareTitle;

  /// No description provided for @alFaresiSoftwareDesc.
  ///
  /// In en, this message translates to:
  /// **'Al-Faresi Company is distinguished by providing integrated and advanced software solutions in the fields of application development, systems, and websites. Our team is made up of a select group of experts with global certifications and outstanding achievements, which have contributed to significant successes and left a mark for the State of Kuwait in the field of software and smart technologies \n\n What sets us apart is our use of proprietary software technologies, specially designed to ensure the highest levels of efficiency and quality, whether in project development or in offering innovative marketing solutions for advertising through the latest smart tools. We believe in building long-term partnerships with our clients by providing advanced technological solutions that meet their needs and contribute to the growth of their businesses.'**
  String get alFaresiSoftwareDesc;

  /// No description provided for @ourMissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Mission'**
  String get ourMissionTitle;

  /// No description provided for @ourMissionDesc.
  ///
  /// In en, this message translates to:
  /// **'At Al-Faresi Software Development, we strive to provide advanced and innovative software solutions that meet our clients\' needs with high efficiency and quality. We work to empower businesses and individuals to achieve their digital goals by developing smart applications, systems, and websites using the latest technologies to ensure optimal performance and a unique experience.'**
  String get ourMissionDesc;

  /// No description provided for @ourVisionTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Vision'**
  String get ourVisionTitle;

  /// No description provided for @ourVisionDesc.
  ///
  /// In en, this message translates to:
  /// **'To be the leading company in software development in Kuwait and the region, by offering innovative technological solutions tailored to support digital transformation and enhance the success of our clients with the highest standards of quality and innovation.'**
  String get ourVisionDesc;

  /// No description provided for @service1.
  ///
  /// In en, this message translates to:
  /// **'1- Website and Smart Application Development and Design'**
  String get service1;

  /// No description provided for @service1Desc.
  ///
  /// In en, this message translates to:
  /// **'Do you have a product or service and want to open your online store? It’s time to get closer to your customers and go online.'**
  String get service1Desc;

  /// No description provided for @service2.
  ///
  /// In en, this message translates to:
  /// **'2- Technology Project Management'**
  String get service2;

  /// No description provided for @service2Desc.
  ///
  /// In en, this message translates to:
  /// **'You’re passionate and you’ve started your smart app or website, but there\'s no need to stop now – you’ve already taken the hardest step. All you need is management and development.'**
  String get service2Desc;

  /// No description provided for @service3.
  ///
  /// In en, this message translates to:
  /// **'3- Software and Technical Consulting'**
  String get service3;

  /// No description provided for @service3Desc.
  ///
  /// In en, this message translates to:
  /// **'Did you create your website or app with a company and now you\'re stuck? Don’t worry! You just need some consultation, and you’ll be on your way to success.'**
  String get service3Desc;

  /// No description provided for @service4.
  ///
  /// In en, this message translates to:
  /// **'4- Writing Legal Technology Forms for Cybercrime Cases'**
  String get service4;

  /// No description provided for @service4Desc.
  ///
  /// In en, this message translates to:
  /// **'Did you sign a contract with a development company, and they didn’t deliver what you expected? Or you shared your idea with a friend and it slipped away? All you need is a techno-legal form, and our lawyer will help you, just be strong!'**
  String get service4Desc;

  /// No description provided for @service5.
  ///
  /// In en, this message translates to:
  /// **'5- Intellectual Property Rights Registration for Websites and Smart Applications'**
  String get service5;

  /// No description provided for @service5Desc.
  ///
  /// In en, this message translates to:
  /// **'I know you\'re eager to launch your project as soon as possible, but you need to register your intellectual property rights first.'**
  String get service5Desc;

  /// No description provided for @whyAlFaresiTitle.
  ///
  /// In en, this message translates to:
  /// **'Why Al-Faresi ?'**
  String get whyAlFaresiTitle;

  /// No description provided for @whyAlFaresiDesc.
  ///
  /// In en, this message translates to:
  /// **'Do you know why our clients prefer long-term partnerships with us? Our company brings together experts with certifications and achievements that have made a significant impact, leaving a mark for the State of Kuwait in the fields of software development and smart technological media. What sets us apart is that we use proprietary software technologies for advertising and promoting your project.'**
  String get whyAlFaresiDesc;

  /// No description provided for @alFarsiMediaTitle.
  ///
  /// In en, this message translates to:
  /// **'Al-Farsi Media'**
  String get alFarsiMediaTitle;

  /// No description provided for @mediaPoint1.
  ///
  /// In en, this message translates to:
  /// **'When You Start with the Right Crew!'**
  String get mediaPoint1;

  /// No description provided for @mediaDesc1.
  ///
  /// In en, this message translates to:
  /// **'We redefine your marketing journey in a world where competition is fierce! From your first spark of an idea to dominating the market, what sets us apart? Our marketers turn challenges into **unforgettable success sagas.'**
  String get mediaDesc1;

  /// No description provided for @howWeSupercharge.
  ///
  /// In en, this message translates to:
  /// **'How Do We Supercharge Your Growth?'**
  String get howWeSupercharge;

  /// No description provided for @mediaDesc2.
  ///
  /// In en, this message translates to:
  /// **'We transform hurdles into opportunities and ideas into **vibrant, living campaigns. Your 360° partner in the marketing universe: Digital Identity Crafting: From logo to brand soul, we weave your story with precision. Data-Driven Strategies: Smart targeting, sector-specific innovation, and analytics that speak volumes. Campaign Mastery: Social media buzz to razor-sharp paid ads—we deliver maximum reach. Audience to Advocates: Captivating content + interactive experiences = loyal fans for life.'**
  String get mediaDesc2;

  /// No description provided for @mediaSmallStartTitle.
  ///
  /// In en, this message translates to:
  /// **'Small Start, Epic Finish'**
  String get mediaSmallStartTitle;

  /// No description provided for @mediaSmallStartDesc.
  ///
  /// In en, this message translates to:
  /// **'Zero budget stress! Our plans start at symbolic prices and grow with you—so you only pay for what you need. Newbie-Friendly Packages: Tailored for rising entrepreneurs. No Hidden Fees: Transparent pricing, zero sneaky charges. Flexible Scaling: Pay as you grow. Your success, your terms.'**
  String get mediaSmallStartDesc;

  /// No description provided for @whyChooseMediaTitle.
  ///
  /// In en, this message translates to:
  /// **'Why Choose Al-Farsi Media?'**
  String get whyChooseMediaTitle;

  /// No description provided for @whyChooseMediaDesc.
  ///
  /// In en, this message translates to:
  /// **'We ensure a budget-friendly approach with transparent pricing, flexible scaling, and tailored solutions for startups and enterprises alike. Your success, your terms!'**
  String get whyChooseMediaDesc;

  /// No description provided for @mediaReadyToShine.
  ///
  /// In en, this message translates to:
  /// **'Ready to Outshine the Competition?'**
  String get mediaReadyToShine;

  /// No description provided for @mediaOutroTitle.
  ///
  /// In en, this message translates to:
  /// **'Al-Farsi Media isn’t just an agency—'**
  String get mediaOutroTitle;

  /// No description provided for @mediaOutroDesc.
  ///
  /// In en, this message translates to:
  /// **'we’re your shortcut to digital dominance. Whether you’re a startup or an empire, we’ll craft a legacy that gets talked about.'**
  String get mediaOutroDesc;

  /// No description provided for @technicalConsultation.
  ///
  /// In en, this message translates to:
  /// **'Technical Consultations'**
  String get technicalConsultation;

  /// No description provided for @technicalConsultationDesc.
  ///
  /// In en, this message translates to:
  /// **'Expert guidance to optimize workflows, upgrade infrastructure, and integrate the latest technologies.'**
  String get technicalConsultationDesc;

  /// No description provided for @mediaAndMarketing.
  ///
  /// In en, this message translates to:
  /// **'Media & Marketing Solutions'**
  String get mediaAndMarketing;

  /// No description provided for @mediaAndMarketingDesc.
  ///
  /// In en, this message translates to:
  /// **'Comprehensive branding, content creation, and digital marketing to enhance your brand presence,'**
  String get mediaAndMarketingDesc;

  /// No description provided for @studioReservations.
  ///
  /// In en, this message translates to:
  /// **'Studio Reservations'**
  String get studioReservations;

  /// No description provided for @bookYourConsultation.
  ///
  /// In en, this message translates to:
  /// **'Book Your Consultation'**
  String get bookYourConsultation;

  /// No description provided for @bookYourConsultationDesc.
  ///
  /// In en, this message translates to:
  /// **'Schedule your preferred service at a time that suits you.'**
  String get bookYourConsultationDesc;

  /// No description provided for @generalConsultation.
  ///
  /// In en, this message translates to:
  /// **'General Consultation with Specialists'**
  String get generalConsultation;

  /// No description provided for @consultationSchedule.
  ///
  /// In en, this message translates to:
  /// **'Consultation Schedule'**
  String get consultationSchedule;

  /// No description provided for @finalizeYourPayment.
  ///
  /// In en, this message translates to:
  /// **'Finalize Your Payment'**
  String get finalizeYourPayment;

  /// No description provided for @finalizeYourPaymentDesc.
  ///
  /// In en, this message translates to:
  /// **'Ensure your payment method is correct to confirm your booking.'**
  String get finalizeYourPaymentDesc;

  /// No description provided for @paymentSuccessFull.
  ///
  /// In en, this message translates to:
  /// **'Payment successful!'**
  String get paymentSuccessFull;

  /// No description provided for @paymentSuccessFullDesc.
  ///
  /// In en, this message translates to:
  /// **'Etiam cras nec metus laoreet. Faucibus iaculis cras ut posuere.'**
  String get paymentSuccessFullDesc;

  /// No description provided for @bePartOfSomething.
  ///
  /// In en, this message translates to:
  /// **'Be part of something inspiring and innovative.'**
  String get bePartOfSomething;

  /// No description provided for @bePartOfSomethingDesc.
  ///
  /// In en, this message translates to:
  /// **'Start your journey with us and take the first step toward limitless possibilities.'**
  String get bePartOfSomethingDesc;

  /// No description provided for @joinUs.
  ///
  /// In en, this message translates to:
  /// **'Join Us'**
  String get joinUs;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @toggleLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get toggleLanguage;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutTitle;

  /// No description provided for @companyName.
  ///
  /// In en, this message translates to:
  /// **'Al-Faresi for Software Solutions and Information Technology'**
  String get companyName;

  /// No description provided for @welcomeHeading.
  ///
  /// In en, this message translates to:
  /// **'Your First destination for digital marketing solutions'**
  String get welcomeHeading;

  /// No description provided for @welcomeSubheading.
  ///
  /// In en, this message translates to:
  /// **'We combine technology and entrepreneurship'**
  String get welcomeSubheading;

  /// No description provided for @welcomeText.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcomeText;

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'Al-Faresi Company is distinguished by providing integrated and advanced software solutions in the fields of application development, systems, and websites. Our team is made up of a select group of experts with global certifications and outstanding achievements, which have contributed to significant successes and left a mark for the State of Kuwait in the field of software and smart technologies \n\n What sets us apart is our use of proprietary software technologies, specially designed to ensure the highest levels of efficiency and quality, whether in project development or in offering innovative marketing solutions for advertising through the latest smart tools. We believe in building long-term partnerships with our clients by providing advanced technological solutions that meet their needs and contribute to the growth of their businesses.'**
  String get aboutDescription;

  /// No description provided for @missionTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Mission'**
  String get missionTitle;

  /// No description provided for @missionDescription.
  ///
  /// In en, this message translates to:
  /// **'At Al-Faresi Software Development, we strive to provide advanced and innovative software solutions that meet our clients\' needs with high efficiency and quality. We work to empower businesses and individuals to achieve their digital goals by developing smart applications, systems, and websites using the latest technologies to ensure optimal performance and a unique experience.'**
  String get missionDescription;

  /// No description provided for @visionTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Vision'**
  String get visionTitle;

  /// No description provided for @visionDescription.
  ///
  /// In en, this message translates to:
  /// **'To be the leading company in software development in Kuwait and the region, by offering innovative technological solutions tailored to support digital transformation and enhance the success of our clients with the highest standards of quality and innovation.'**
  String get visionDescription;

  /// No description provided for @servicesTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Services'**
  String get servicesTitle;

  /// No description provided for @service1Title.
  ///
  /// In en, this message translates to:
  /// **'Website and Smart Application Development and Design'**
  String get service1Title;

  /// No description provided for @service1Description.
  ///
  /// In en, this message translates to:
  /// **'Do you have a product or service and want to open your online store? It\'s time to get closer to your customers and go online.'**
  String get service1Description;

  /// No description provided for @service2Title.
  ///
  /// In en, this message translates to:
  /// **'Technology Project Management'**
  String get service2Title;

  /// No description provided for @service2Description.
  ///
  /// In en, this message translates to:
  /// **'You\'re passionate and you\'ve started your smart app or website, but there\'s no need to stop now – you\'ve already taken the hardest step. All you need is management and development.'**
  String get service2Description;

  /// No description provided for @service3Title.
  ///
  /// In en, this message translates to:
  /// **'Software and Technical Consulting'**
  String get service3Title;

  /// No description provided for @service3Description.
  ///
  /// In en, this message translates to:
  /// **'Did you create your website or app with a company and now you\'re stuck? Don\'t worry! You just need some consultation, and you\'ll be on your way to success.'**
  String get service3Description;

  /// No description provided for @service4Title.
  ///
  /// In en, this message translates to:
  /// **'Writing Legal Technology Forms for Cybercrime Cases'**
  String get service4Title;

  /// No description provided for @service4Description.
  ///
  /// In en, this message translates to:
  /// **'Did you sign a contract with a development company, and they didn\'t deliver what you expected? Or you shared your idea with a friend and it slipped away? All you need is a techno-legal form, and our lawyer will help you, just be strong!'**
  String get service4Description;

  /// No description provided for @service5Title.
  ///
  /// In en, this message translates to:
  /// **'Intellectual Property Rights Registration for Websites and Smart Applications'**
  String get service5Title;

  /// No description provided for @service5Description.
  ///
  /// In en, this message translates to:
  /// **'I know you\'re eager to launch your project as soon as possible, but you need to register your intellectual property rights first.'**
  String get service5Description;

  /// No description provided for @whyAlfaresiTitle.
  ///
  /// In en, this message translates to:
  /// **'Why Al-Faresi?'**
  String get whyAlfaresiTitle;

  /// No description provided for @whyAlfaresiDescription.
  ///
  /// In en, this message translates to:
  /// **'Do you know why our clients prefer long-term partnerships with us? Our company brings together experts with certifications and achievements that have made a significant impact, leaving a mark for the State of Kuwait in the fields of software development and smart technological media. What sets us apart is that we use proprietary software technologies for advertising and promoting your project.'**
  String get whyAlfaresiDescription;

  /// No description provided for @mediaTitle.
  ///
  /// In en, this message translates to:
  /// **'Al-Farsi Media'**
  String get mediaTitle;

  /// No description provided for @mediaSlogan.
  ///
  /// In en, this message translates to:
  /// **'When You Start with the Right Crew!'**
  String get mediaSlogan;

  /// No description provided for @mediaDescription.
  ///
  /// In en, this message translates to:
  /// **'We redefine your marketing journey in a world where competition is fierce! From your first spark of an idea to dominating the market, what sets us apart? Our marketers turn challenges into unforgettable success sagas.'**
  String get mediaDescription;

  /// No description provided for @howWeGrowTitle.
  ///
  /// In en, this message translates to:
  /// **'How Do We Supercharge Your Growth?'**
  String get howWeGrowTitle;

  /// No description provided for @howWeGrowDescription.
  ///
  /// In en, this message translates to:
  /// **'We transform hurdles into opportunities and ideas into vibrant, living campaigns. Your 360° partner in the marketing universe: Digital Identity Crafting: From logo to brand soul, we weave your story with precision. Data-Driven Strategies: Smart targeting, sector-specific innovation, and analytics that speak volumes. Campaign Mastery: Social media buzz to razor-sharp paid ads—we deliver maximum reach. Audience to Advocates: Captivating content + interactive experiences = loyal fans for life.'**
  String get howWeGrowDescription;

  /// No description provided for @startSmallTitle.
  ///
  /// In en, this message translates to:
  /// **'Small Start, Epic Finish'**
  String get startSmallTitle;

  /// No description provided for @startSmallDescription.
  ///
  /// In en, this message translates to:
  /// **'Zero budget stress! Our plans start at symbolic prices and grow with you—so you only pay for what you need. Newbie-Friendly Packages: Tailored for rising entrepreneurs. No Hidden Fees: Transparent pricing, zero sneaky charges. Flexible Scaling: Pay as you grow. Your success, your terms.'**
  String get startSmallDescription;

  /// No description provided for @whyChooseMediaDescription.
  ///
  /// In en, this message translates to:
  /// **'We ensure a budget-friendly approach with transparent pricing, flexible scaling, and tailored solutions for startups and enterprises alike. Your success, your terms!'**
  String get whyChooseMediaDescription;

  /// No description provided for @readyToOutshine.
  ///
  /// In en, this message translates to:
  /// **'Ready to Outshine the Competition?'**
  String get readyToOutshine;

  /// No description provided for @mediaClosingTitle.
  ///
  /// In en, this message translates to:
  /// **'Al-Farsi Media isn\'t just an agency—'**
  String get mediaClosingTitle;

  /// No description provided for @mediaClosingDescription.
  ///
  /// In en, this message translates to:
  /// **'we\'re your shortcut to digital dominance. Whether you\'re a startup or an empire, we\'ll craft a legacy that gets talked about.'**
  String get mediaClosingDescription;

  /// No description provided for @englishOption.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get englishOption;

  /// No description provided for @arabicOption.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabicOption;

  /// No description provided for @whyTitle.
  ///
  /// In en, this message translates to:
  /// **'Why Al-Faresi?'**
  String get whyTitle;

  /// No description provided for @whyDescription.
  ///
  /// In en, this message translates to:
  /// **'Our certified experts and proprietary technologies help your project stand out in Kuwait and beyond.'**
  String get whyDescription;

  /// No description provided for @bookNow.
  ///
  /// In en, this message translates to:
  /// **'Book Now'**
  String get bookNow;

  /// No description provided for @technicalConsultationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Technical Consultations:'**
  String get technicalConsultationsTitle;

  /// No description provided for @technicalConsultationsDescription.
  ///
  /// In en, this message translates to:
  /// **'Expert guidance to optimize workflows, upgrade infrastructure, and integrate the latest technologies.'**
  String get technicalConsultationsDescription;

  /// No description provided for @mediaMarketingSolutionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Media & Marketing Solutions:'**
  String get mediaMarketingSolutionsTitle;

  /// No description provided for @mediaMarketingSolutionsDescription.
  ///
  /// In en, this message translates to:
  /// **'Comprehensive branding, content creation, and digital marketing to enhance your brand presence.'**
  String get mediaMarketingSolutionsDescription;

  /// No description provided for @studioReservationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Studio Reservations:'**
  String get studioReservationsTitle;

  /// No description provided for @studioReservationsDescription.
  ///
  /// In en, this message translates to:
  /// **'We offer state-of-the-art studios equipped with the latest technology, available for booking.'**
  String get studioReservationsDescription;

  /// No description provided for @broadcastBookingServicesTitle.
  ///
  /// In en, this message translates to:
  /// **'Broadcast Booking Services:'**
  String get broadcastBookingServicesTitle;

  /// No description provided for @broadcastBookingServicesDescription.
  ///
  /// In en, this message translates to:
  /// **'We provide seamless broadcast booking services to ensure your live productions run smoothly.'**
  String get broadcastBookingServicesDescription;

  /// No description provided for @salesTeam.
  ///
  /// In en, this message translates to:
  /// **'⁠Sales Team:'**
  String get salesTeam;

  /// No description provided for @salesTeamDesc.
  ///
  /// In en, this message translates to:
  /// **'We provide you with a professional sales team that doesn’t just sell—they convince, follow up, and turn interest into loyal customers.'**
  String get salesTeamDesc;

  /// No description provided for @serviceType.
  ///
  /// In en, this message translates to:
  /// **'Service Type'**
  String get serviceType;

  /// No description provided for @consultationDate.
  ///
  /// In en, this message translates to:
  /// **'Consultation Date'**
  String get consultationDate;

  /// No description provided for @payNow.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get payNow;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @partnerDail.
  ///
  /// In en, this message translates to:
  /// **'Dalilin'**
  String get partnerDail;

  /// No description provided for @partnerBringle.
  ///
  /// In en, this message translates to:
  /// **'Bringle'**
  String get partnerBringle;

  /// No description provided for @partnerPayle.
  ///
  /// In en, this message translates to:
  /// **'Payle'**
  String get partnerPayle;

  /// No description provided for @partnerConstruction.
  ///
  /// In en, this message translates to:
  /// **'Construction'**
  String get partnerConstruction;

  /// No description provided for @partnerLawOffice.
  ///
  /// In en, this message translates to:
  /// **'Law Office of Attorney Saad Dashti'**
  String get partnerLawOffice;

  /// No description provided for @partnerGDCKuwait.
  ///
  /// In en, this message translates to:
  /// **'GDC Kuwait'**
  String get partnerGDCKuwait;

  /// No description provided for @partnerMetrash.
  ///
  /// In en, this message translates to:
  /// **'Metrash'**
  String get partnerMetrash;

  /// No description provided for @partnerAutoMarket.
  ///
  /// In en, this message translates to:
  /// **'Auto Market'**
  String get partnerAutoMarket;

  /// No description provided for @partnerTataman.
  ///
  /// In en, this message translates to:
  /// **'Tataman'**
  String get partnerTataman;

  /// No description provided for @partnerNeom.
  ///
  /// In en, this message translates to:
  /// **'Neom'**
  String get partnerNeom;

  /// No description provided for @partnerMuhamik.
  ///
  /// In en, this message translates to:
  /// **'MUHAMIK'**
  String get partnerMuhamik;

  /// No description provided for @partnerTraininate.
  ///
  /// In en, this message translates to:
  /// **'Traininate'**
  String get partnerTraininate;

  /// No description provided for @partnerPublicProsecution.
  ///
  /// In en, this message translates to:
  /// **'Public Prosecution'**
  String get partnerPublicProsecution;

  /// No description provided for @partnerNiu.
  ///
  /// In en, this message translates to:
  /// **'Niu'**
  String get partnerNiu;

  /// No description provided for @partnerHBeam.
  ///
  /// In en, this message translates to:
  /// **'H Beam'**
  String get partnerHBeam;

  /// No description provided for @partnerAX.
  ///
  /// In en, this message translates to:
  /// **'AX'**
  String get partnerAX;

  /// No description provided for @partnerRita.
  ///
  /// In en, this message translates to:
  /// **'Rita'**
  String get partnerRita;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @continueString.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueString;

  /// No description provided for @bookingDetails.
  ///
  /// In en, this message translates to:
  /// **'Booking Details'**
  String get bookingDetails;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @aboutAlfaresi.
  ///
  /// In en, this message translates to:
  /// **'About Al-Faresi'**
  String get aboutAlfaresi;

  /// No description provided for @technology.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get technology;

  /// No description provided for @quality.
  ///
  /// In en, this message translates to:
  /// **'Quality'**
  String get quality;

  /// No description provided for @partnership.
  ///
  /// In en, this message translates to:
  /// **'Partnership'**
  String get partnership;

  /// No description provided for @bookedSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Booked successful'**
  String get bookedSuccessful;

  /// No description provided for @yourBookingHasBeenConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Your booking has been confirmed. We look forward to serving you!'**
  String get yourBookingHasBeenConfirmed;

  /// No description provided for @searchLogo.
  ///
  /// In en, this message translates to:
  /// **'Search Logo'**
  String get searchLogo;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @merchantLogin.
  ///
  /// In en, this message translates to:
  /// **'Merchant Login'**
  String get merchantLogin;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
