import 'dart:convert';
import 'package:hive/hive.dart';
part 'add_banner.g.dart';
List<AddBanner> addBannerListFromJson(String val) => List<AddBanner>.from(
  json.decode(val)['data'].map((banner) => AddBanner.fromJson(banner))
);

@HiveType(typeId: 1)
class AddBanner {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String image;
  AddBanner({
    required this.id,
    required this.image
  });

  factory  AddBanner.fromJson(Map<String,dynamic> data ) => AddBanner(
      id: data['id'],
      image: data['attributes']['image']['data']['attributes']['url']
  );

}