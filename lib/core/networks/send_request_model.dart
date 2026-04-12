import 'dart:convert';

class BookingRequest {
  final String name;
  final String email;
  final String phone;
  final String consultationType;
  final String date;
  final String time;

  BookingRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.consultationType,
    required this.date,
    required this.time,
  });

  /// Converts the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'consultationType': consultationType,
      'date': date,
      'time': time,
    };
  }

  /// Optional: Convert from JSON to BookingRequest (if needed)
  factory BookingRequest.fromJson(Map<String, dynamic> json) {
    return BookingRequest(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      consultationType: json['consultationType'],
      date: json['date'],
      time: json['time'],
    );
  }

  /// Optional: Encode to JSON string
  String toRawJson() => jsonEncode(toJson());
}
