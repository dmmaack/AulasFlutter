import 'dart:io';
import 'package:flutter/material.dart';

class FuncHelper {
  ImageProvider getImageProvider(String path) {
    File f;

    if (path != null && path.isNotEmpty) f = File(path);

    return (f != null && f.existsSync())
        ? FileImage(f)
        : AssetImage("images/person.png");
  }
}
