import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CatImageProvider {
  static final String imageHost = 'https://cataas.com/cat?';

  /**
   * Get random cat image
   */
  static Widget getCatImage(
          {void Function(BuildContext context, String url, Object error)
              onError}) =>
      CachedNetworkImage(
        imageUrl: _getImageUrl(),
        placeholder: (context, url) => _getLoadingCatImage(),
        errorWidget: (context, url, error) {
          if (onError != null) onError(context, url, error);
          return _getLostCatImage();
        },
      );

  /** 
   * Get image to show when other image not found
   */
  static Widget _getLostCatImage() => Image.asset(
        'images/original.png',
      );

  /** 
   * Get image to show while loading other image
   */
  static Widget _getLoadingCatImage() => Image.asset('images/cat-loading.gif');

  /**
   * Get a random number
   */
  static String _getRandomNumber({
    // Desired number length to be generated
    int numLen: 20,
  }) {
    int len = Random().nextInt(numLen) + 1;
    String number = '';
    for (int i = 0; i < len; i++) number += Random().nextInt(9).toString();
    return number;
  }

  /**
   * Get image url
   */
  static String _getImageUrl() => imageHost + _getRandomNumber();
}
