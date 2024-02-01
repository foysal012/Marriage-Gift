import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'contact_model_info.g.dart';

@HiveType(typeId: 0)
class ContactModelInfo extends HiveObject{

  @HiveField(0)
  String name;

  @HiveField(1)
  String gender;

  @HiveField(2)
  String giftOrMoney;

  ContactModelInfo({required this.name, required this.gender, required this.giftOrMoney});
}