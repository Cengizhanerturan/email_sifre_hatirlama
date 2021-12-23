import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final girisKey = GlobalKey<FormState>();
  final kayitKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final sifreSifirlaKey = GlobalKey<FormState>();
  var uyelikDurumu = 1.obs;
  var isChecked = false.obs;

  var box = GetStorage();

  String? kayitEmail;
  String? kayitSifre;
  String? kayitUserName;
  String? girisEmail;
  String? girisSifre;
}
