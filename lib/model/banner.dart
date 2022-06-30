import 'dart:convert';

List<AdBanner> adBannerListFromJson(String val) => List<AdBanner>.from(
    json.decode(val)['banners'].map((banner) => AdBanner.fromJson(banner))
);

class AdBanner {
  final int id;
  final String banner_image;

  AdBanner({
    required this.id,
    required this.banner_image
  });

  factory AdBanner.fromJson(Map<String, dynamic> data) => AdBanner(
    id: data['id'],
    banner_image: data['banner_image'],

  );
}