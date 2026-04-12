import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:alfaresi/core/networks/send_request_model.dart';

Future<void> sendBookingRequest(BookingRequest booking) async {
  final supabase = Supabase.instance.client;

  try {
    // 1. Save booking to Supabase table
    final payload = {
      'name': booking.name,
      'email': booking.email,
      'phone': booking.phone,
      'consultation_type': booking.consultationType,
      'date': booking.date,
      'time': booking.time,
    };

    print("💾 Saving booking to Supabase...");
    final inserted = await supabase
        .from('bookings')
        .insert(payload)
        .select()
        .single();

    print("✅ Booking saved successfully!");
    print("   ID: ${inserted['id']}");
    print("   Name: ${inserted['name']}");
    print("   Email: ${inserted['email']}");
    print("   Date: ${inserted['date']} at ${inserted['time']}");

    // 2. Call edge function AFTER booking is saved
    print("📧 Calling edge function to send email...");
    try {
      final emailPayload = {
        'to': 'Info@alfaresi.co',
        'subject': 'New Booking Request',
        'data': {
          'id': inserted['id'],
          'name': inserted['name'],
          'email': inserted['email'],
          'phone': inserted['phone'],
          'consultation_type': inserted['consultation_type'],
          'date': inserted['date'],
          'time': inserted['time'],
          'created_at': inserted['created_at'],
        },
      };

      final emailResponse = await supabase.functions.invoke(
        'send-booking-email',
        body: emailPayload,
      );

      if (emailResponse.status == 200) {
        print("✅ Email sent successfully!");
        print("   Response: ${emailResponse.data}");
      } else {
        print("⚠️ Email function returned status: ${emailResponse.status}");
        print("   Response: ${emailResponse.data}");
      }
    } catch (emailError) {
      // Don't fail the booking if email fails - booking is already saved
      print("⚠️ Email function failed (booking was saved successfully)");
      print("   Error: $emailError");
      // Re-throw only if you want to handle it in the UI
      // For now, we'll just log it since booking is saved
    }
  } on PostgrestException catch (e) {
    print("❌ Supabase database error: ${e.message}");
    print("   Code: ${e.code}");
    print("   Details: ${e.details}");
    rethrow;
  } catch (e) {
    print("❌ Unexpected error: $e");
    rethrow;
  }
}
