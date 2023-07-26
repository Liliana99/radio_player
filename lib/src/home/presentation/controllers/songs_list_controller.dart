import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_radio_player_2/src/constants/constants_common_uses.dart';
import 'package:flutter_radio_player_2/src/home/domain/repositories/cache_repository.dart';
import 'package:flutter_radio_player_2/src/utils/custom_exception.dart';

import '../../application/services/radio_api_request.dart';
import '../../domain/models/item_model.dart';

// Create a StateNotifier subclass using AsyncValue<void> as the state
class SongListHomeControllerProvider with ChangeNotifier {
  SongListHomeControllerProvider(this._myList);
  List<ContentItem> _myList = [];
  List<ContentItem> get myList => _myList;

  Future<void> updateSongList() async {
    try {
      var myContent =
          await CacheRepo().readCachedJsonBody(RequestApiConstants.content);
      if (myContent != null) {
        _myList = myContent;

        notifyListeners();
      } else {
        _myList = await obtainRadioListFromServer();
      }
    } catch (e) {
      throw CustomException(innerException: e);
    }
  }
}
