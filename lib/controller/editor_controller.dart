import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import '../const/appstate.dart';
import '../models/tweet_models.dart';
import '../services/api/api.dart';
import '../services/api/api_error.dart';
import '../setup.dart';
import '../styles/style.dart';

class EditorController extends GetxController {
  String tweetId = '';

  EditorController() {
    tweetId = arguements!['tweetId'] ?? '';
  }

  GlobalKey globalKey = GlobalKey();

  final ApiClient _apiClient = locator<ApiClient>();

  Map? arguements =
      Get.arguments != null ? Map<String, dynamic>.from(Get.arguments) : null;

  List<Color> _colors = [];

  AppState appState = AppState.loading;

  Color _backgroundColor = Color(
    (Random().nextDouble() * 0xFFFFFF).toInt(),
  ).withOpacity(1.0);

  List<Color> get colors => _colors;

  Color get backgroundColor => _backgroundColor;

  TweetModel? tweetModel;

  TweetModel? get tweet => tweetModel;

  Future<void> loadTweet() async {
    try {
      final Map<String, dynamic> response = await _apiClient.getTweet(
        tweetId,
      );
      tweetModel = TweetModel.fromJson(response);
      appState = AppState.none;
    } catch (e) {
      String errorMessage = ApiError.convertExceptionToString(e as Exception);
      appState = AppState.error;
      TWEETSHortStyle.errorSnackBar(
        "Error",
        errorMessage,
      );
    }
    update();
  }

  @override
  void onInit() async {
    _colors = _generateColor();
    await loadTweet();
    super.onInit();
  }

  List<Color> _generateColor() {
    return List.generate(
      50,
      (index) => Color(
        (Random().nextDouble() * 0xFFFFFF).toInt(),
      ).withOpacity(1.0),
    );
  }

  void setBackgroundColor(Color value) {
    _backgroundColor = value;
    update();
  }

  void saveScreenshot() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

      ui.Image image = await boundary.toImage(
        pixelRatio: 10.0,
      );

      ByteData byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      ) as ByteData;

      Uint8List pngBytes = byteData.buffer.asUint8List();

      if (!(await Permission.storage.status.isGranted))
        await Permission.storage.request();

      final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(pngBytes),
        quality: 100,
      );

      if (result['isSuccess']) {
        TWEETSHortStyle.successSnackBar(
          "Success",
          "Tweet has been successfully saved.",
        );
      } else {
        TWEETSHortStyle.errorSnackBar(
          "Success",
          "Tweet has been successfully saved.",
        );
      }
    } catch (e) {
      TWEETSHortStyle.errorSnackBar(
        "Error",
        "Could not save tweet.",
      );
    }
  }
}
