import 'package:alfaresi/config/extension.dart';
import 'package:alfaresi/config/themes/app_colors.dart';
import 'package:alfaresi/config/widgets/app_container.dart';
import 'package:alfaresi/config/widgets/app_dropdown_widget.dart';
import 'package:alfaresi/config/widgets/app_service_card.dart';
import 'package:alfaresi/config/widgets/custom_date_picker.dart';
import 'package:alfaresi/config/widgets/custom_title_tile.dart';
import 'package:alfaresi/config/widgets/time_filter_chips.dart';
import 'package:alfaresi/core/networks/api_services.dart';
import 'package:alfaresi/core/networks/send_request_model.dart';
import 'package:alfaresi/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitleTile(text: context.l10n.servicesTitle),
                const SizedBox(height: 16),
                AppContainer(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder:
                        (context, index) => const SizedBox(height: 20),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final mockServiceData = {
                        context.l10n.technicalConsultationsTitle:
                            context.l10n.technicalConsultationsDescription,
                        context.l10n.mediaMarketingSolutionsTitle:
                            context.l10n.mediaMarketingSolutionsDescription,
                        context.l10n.studioReservationsTitle:
                            context.l10n.studioReservationsDescription,
                        context.l10n.broadcastBookingServicesTitle:
                            context.l10n.broadcastBookingServicesDescription,
                        context.l10n.salesTeam: context.l10n.salesTeamDesc,
                      };

                      final title = mockServiceData.keys.elementAt(index);
                      final subTitle = mockServiceData.values.elementAt(index);
                      final img = [
                        'assets/gif/technical_consultation.gif',
                        'assets/gif/media_and_marketing.gif',
                        'assets/gif/studio_reservation.gif',
                        'assets/gif/brodcast.gif',
                        'assets/gif/sales_team.gif',
                      ];
                      return AppServiceCard(
                        model: AppServiceCardModel(
                          image: img[index],
                          title: title,
                          subTitle: subTitle,
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: AppColors.backgroundPrimary,
                              showDragHandle: true,
                              useRootNavigator: true,
                              isScrollControlled: true,
                              context: context,
                              builder: (context) => const _BottomSheet(),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomSheet extends StatefulWidget {
  const _BottomSheet();

  @override
  State<_BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<_BottomSheet> {
  String pickedDate = '';
  String time = '';
  bool showDateError = false;

  @override
  void initState() {
    final parsedDate = DateTime.parse(DateTime.now().toString());
    final formattedDate =
        DateFormat('MM-dd-yyyy').format(parsedDate).toString();
    pickedDate = formattedDate;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.backgroundPrimary),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                context.l10n.bookYourConsultation,
                style: context.textTheme.headlineSmall!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              context.l10n.bookYourConsultationDesc,
              style: context.textTheme.bodyLarge!.copyWith(
                color: AppColors.grey400,
                height: 1.2,
                letterSpacing: 0.2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(context.l10n.serviceType, style: context.textTheme.bodyLarge),
            const SizedBox(height: 10),
            AppDropdownWidget(
              items: [context.l10n.generalConsultation, context.l10n.services],
              onChanged: (value) {},
            ),
            const SizedBox(height: 12),
            Text(
              context.l10n.consultationDate,
              style: context.textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            CustomDatePicker(
              selectedDate: DateTime.now(),
              onDateSelected: (date) {
                final parsedDate = DateTime.parse(date.toString());
                final formattedDate =
                    DateFormat('MM-dd-yyyy').format(parsedDate).toString();
                setState(() {
                  pickedDate = formattedDate;
                  showDateError = false;
                });
              },
              showErrorBorder: showDateError,
            ),
            const SizedBox(height: 16),
            Text(
              context.l10n.consultationSchedule,
              style: context.textTheme.bodyLarge,
            ),
            const SizedBox(height: 12),
            TimingFilterChips(
              time: (selectedTime) {
                setState(() {
                  time = selectedTime;
                });
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fixedSize: Size(MediaQuery.of(context).size.width, 56),
              ),
              onPressed: () {
                if (pickedDate.isEmpty) {
                  setState(() {
                    showDateError = true;
                  });
                  return;
                }
                if (time.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select a time slot'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }
                context.pop();
                showModalBottomSheet(
                  backgroundColor: AppColors.backgroundPrimary,
                  showDragHandle: true,
                  useRootNavigator: true,
                  isScrollControlled: true,
                  context: context,
                  builder:
                      (context) => _FinalizeBottomSheet(
                        pickedDate,
                        time,
                        'General Consultation with Specialists',
                      ),
                );
              },
              child: Text(
                context.l10n.continueString,
                style: context.textTheme.bodyLarge!.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _FinalizeBottomSheet extends StatefulWidget {
  const _FinalizeBottomSheet(this.date, this.time, this.consultationType);
  final String date;
  final String time;
  final String consultationType;

  @override
  State<_FinalizeBottomSheet> createState() => _FinalizeBottomSheetState();
}

class _FinalizeBottomSheetState extends State<_FinalizeBottomSheet> {
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _phoneNumber = '';
  String _countryCode = '+965'; // Kuwait default
  bool? isLoading;
  @override
  void initState() {
    isLoading = false;
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.4,
      decoration: const BoxDecoration(
        color: AppColors.backgroundPrimary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.bookingDetails,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _textFormField(
                      controller: _nameController,
                      hintText: context.l10n.name,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return '${context.l10n.name} is required';
                        }
                        if (value.trim().length < 2) {
                          return '${context.l10n.name} must be at least 2 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    _phoneField(context),
                    const SizedBox(height: 16),
                    _textFormField(
                      controller: _emailController,
                      hintText: context.l10n.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return '${context.l10n.email} is required';
                        }
                        final emailRegex = RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        );
                        if (!emailRegex.hasMatch(value.trim())) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: const Size(double.infinity, 56),
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  isLoading = true;
                });

                final data = BookingRequest(
                  name: _nameController.text.trim(),
                  email: _emailController.text.trim(),
                  phone: _phoneNumber.isNotEmpty 
                      ? _phoneNumber 
                      : '$_countryCode${_phoneController.text}',
                  consultationType: widget.consultationType,
                  date: widget.date,
                  time: widget.time,
                );
                print('📅 Booking Data:');
                print('  Name: ${data.name}');
                print('  Email: ${data.email}');
                print('  Phone: ${data.phone}');
                print('  Date: ${data.date}');
                print('  Time: ${data.time}');
                print('  Type: ${data.consultationType}');
                sendBookingRequest(data).then((value) {
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.pop(context);
                  showStatusDialog(context);
                });
              }
            },
            child:
                isLoading == true
                    ? const CircularProgressIndicator(color: AppColors.white)
                    : Text(
                      context.l10n.bookNow,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: AppColors.white,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
          ),
          const SizedBox(height: 170),
        ],
      ),
    );
  }

  Widget _textFormField({
    required String hintText,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: AppColors.primaryBlue,
      textCapitalization: keyboardType == TextInputType.emailAddress
          ? TextCapitalization.none
          : TextCapitalization.words,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.grey400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryBlue, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.grey400),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
      validator: validator,
    );
  }

  Widget _phoneField(BuildContext context) {
    return IntlPhoneField(
      controller: _phoneController,
      initialCountryCode: 'KW',
      flagsButtonPadding: const EdgeInsets.only(left: 8),
      cursorColor: AppColors.primaryBlue,
      decoration: InputDecoration(
        hintText: context.l10n.phoneNumber,
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.grey400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryBlue, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.grey400),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
      onChanged: (phone) {
        setState(() {
          _phoneNumber = phone.completeNumber;
          _countryCode = phone.countryCode;
        });
      },
      onCountryChanged: (country) {
        setState(() {
          _countryCode = '+${country.dialCode}';
        });
      },
      validator: (phone) {
        if (phone == null || phone.number.isEmpty) {
          return '${context.l10n.phoneNumber} is required';
        }
        if (phone.number.length < 7) {
          return 'Please enter a valid phone number';
        }
        return null;
      },
    );
  }
}

Future<void> showStatusDialog(BuildContext context) async {
  if (!context.mounted) return;

  await showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.4),
    builder: (BuildContext dialogContext) {
      return Dialog(
        backgroundColor: Colors.transparent, // Transparent so Stack can float
        insetPadding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Stack(
          clipBehavior: Clip.none, // Allow overflow
          alignment: Alignment.topCenter,
          children: [
            // Main Card
            Container(
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.fromLTRB(24, 70, 24, 24),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    context
                        .l10n
                        .bookedSuccessful, // context.l10n.bookedSuccessful
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  // Description
                  Text(
                    context
                        .l10n
                        .yourBookingHasBeenConfirmed, // context.l10n.yourBookingHasBeenConfirmed
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  // OK Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text(
                        "OK",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Floating Icon
            const Positioned(
              top: 0,
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 40,
                child: Icon(Icons.check_circle, color: Colors.green, size: 80),
              ),
            ),
          ],
        ),
      );
    },
  );
}
