import 'package:supabase_flutter/supabase_flutter.dart';

class Partner {
  final String id;
  final String name;
  final String subTitle;
  final String imageUrl;
  final int position;

  Partner({
    required this.id,
    required this.name,
    required this.subTitle,
    required this.imageUrl,
    required this.position,
  });

  factory Partner.fromMap(Map<String, dynamic> map) {
    return Partner(
      id: map['id'] as String,
      name: map['name'] as String? ?? '',
      subTitle: map['sub_title'] as String? ?? '',
      imageUrl: map['image_url'] as String? ?? '',
      position: (map['position'] as num?)?.toInt() ?? 0,
    );
  }
}

class PartnerService {
  final _supabase = Supabase.instance.client;

  Future<List<Partner>> fetchPartners() async {
    try {
      final response = await _supabase
          .from('partners')
          .select('*')
          .order('position', ascending: true);

      return (response as List)
          .map((item) => Partner.fromMap(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error fetching partners: $e');
      rethrow;
    }
  }
}

