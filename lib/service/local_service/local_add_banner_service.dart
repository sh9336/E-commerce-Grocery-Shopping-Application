import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../model/add_banner.dart';

class LocalAddBannerSevice {
  late Box<AddBanner> _addBannerBox;

  Future<void> init() async {
    _addBannerBox = await Hive.openBox<AddBanner>('AddBanners');
  }

  Future<void> assignAllAddbanners({required List<AddBanner> addBanners}) async {
    await _addBannerBox.clear();
    await _addBannerBox.addAll(addBanners);
  }

  List<AddBanner> getAddBanners() => _addBannerBox.values.toList();
 }