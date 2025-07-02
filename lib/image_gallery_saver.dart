import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';

class ImageGallerySaver {
  static const MethodChannel _channel = MethodChannel('image_gallery_saver');

  /// Save image bytes to gallery
  ///
  /// Parameters:
  /// - [imageBytes]: The raw image bytes (non-null)
  /// - [quality]: Compression quality (default 80)
  /// - [name]: Optional custom name for the saved file
  /// - [isReturnImagePathOfIOS]: iOS-specific return flag
  ///
  /// Returns:
  ///   A `Map` with:
  ///   - "isSuccess": `true` or `false`
  ///   - "filePath": `String?` path of saved file
  static Future<Map> saveImage(
    Uint8List imageBytes, {
    int quality = 80,
    String? name,
    bool isReturnImagePathOfIOS = false,
  }) async {
    final result = await _channel.invokeMethod<Map>('saveImageToGallery', {
      'imageBytes': imageBytes,
      'quality': quality,
      'name': name,
      'isReturnImagePathOfIOS': isReturnImagePathOfIOS,
    });
    return result ?? {};
  }

  /// Save an existing file (image or video) to the gallery
  ///
  /// Parameters:
  /// - [file]: Absolute path to the file
  /// - [name]: Optional new name for the file
  /// - [isReturnPathOfIOS]: iOS-specific return flag
  ///
  /// Returns:
  ///   A `Map` with:
  ///   - "isSuccess": `true` or `false`
  ///   - "filePath": `String?` path of saved file
  static Future<Map> saveFile(
    String file, {
    String? name,
    bool isReturnPathOfIOS = false,
  }) async {
    final result = await _channel.invokeMethod<Map>('saveFileToGallery', {
      'file': file,
      'name': name,
      'isReturnPathOfIOS': isReturnPathOfIOS,
    });
    return result ?? {};
  }
}
