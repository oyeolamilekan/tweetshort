import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class IndexController extends GetxController {
  final TextEditingController _textEditingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController get textEditingController => _textEditingController;

  GlobalKey<FormState> get formKey => _formKey;

  void clearText() {
    _textEditingController.text = '';
  }
}
