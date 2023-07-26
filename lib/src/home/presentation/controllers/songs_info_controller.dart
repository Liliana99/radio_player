import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_radio_player_2/src/constants/constants_common_uses.dart';
import 'package:flutter_radio_player_2/src/home/domain/models/info_model.dart';
import 'package:flutter_radio_player_2/src/home/domain/repositories/cache_repository.dart';
import 'package:flutter_radio_player_2/src/utils/custom_exception.dart';

import '../../application/services/radio_api_request.dart';

// Create a StateNotifier subclass using AsyncValue<void> as the state
class SongInfoControllerProvider with ChangeNotifier {
  SongInfoControllerProvider(this._info);
  ChartInfo _info;
  ChartInfo get myInfo => _info;

  Future<void> updateSongInfo() async {
    try {
      _info = await CacheRepo().readCachedJsonBody(RequestApiConstants.info);

      if (_info.category.isEmpty) {
        await obtainRadioListFromServer();
        _info = await CacheRepo().readCachedJsonBody(RequestApiConstants.info);
      }
      notifyListeners();
    } catch (e) {
      throw CustomException(innerException: e);
    }
  }
}
