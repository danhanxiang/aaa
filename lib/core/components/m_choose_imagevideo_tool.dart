import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:video_player/video_player.dart';

class choose_imagevideo_tool {
  //选择照片
  static m_choose_image(Function(XFile? xfile) onCompletion,
      {int? quality}) async {
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: null,
        maxHeight: null,
        imageQuality: quality,
      );
      print("选择了图片");
      onCompletion(pickedFile);
    } catch (e) {
      print("照片单选错误=${e}");
      onCompletion(null);
    }
  }

  //选择照片（多选）
  static m_choose_imageList(Function(List<XFile>? imageLists) onCompletion,
      {int? quality}) async {
    final ImagePicker _picker = ImagePicker();
    try {
      final List<XFile>? pickedFileList = await _picker.pickMultiImage(
        maxWidth: null,
        maxHeight: null,
        imageQuality: quality,
      );
      onCompletion(pickedFileList);
    } catch (e) {
      print("照片多选错误=${e}");
      onCompletion(null);
    }
  }

//选择视频
  static m_choose_video(Function(XFile? VideoXfile) onCompletion,
      {int seconds = 10}) async {
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? file = await _picker.pickVideo(
          source: ImageSource.gallery, maxDuration: Duration(seconds: seconds));
      onCompletion(file);
    } catch (e) {
      print("视频选择错误=${e}");
      onCompletion(null);
    }
  }

  //打开相机拍照
  static m_take_Photo(Function(XFile? Xfile) onCompletion) async {
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: null,
        maxHeight: null,
        imageQuality: null,
      );
      onCompletion(pickedFile);
    } catch (e) {
      print("拍照错误=${e}");
      onCompletion(null);
    }
  }

  //打开录像
  static m_take_video(Function(XFile? VideoXfile) onCompletion,
      {int seconds = 10}) async {
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? file = await _picker.pickVideo(
          source: ImageSource.camera, maxDuration: Duration(seconds: seconds));
      onCompletion(file);
    } catch (e) {
      print("视频录制错误=${e}");
      onCompletion(null);
    }
  }
}
