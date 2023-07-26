import 'dart:convert';
import 'dart:io';

import 'package:flutter_radio_player_2/src/home/domain/models/info_model.dart';
import 'package:path_provider/path_provider.dart';

import '../../../constants/constants_common_uses.dart';
import '../../application/services/utils/convert_content_item_list.dart';

class CacheRepo {
  Future<void> writeCachedJsonBody(
      {final Map<String, dynamic>? body,
      required final String pathStringJson}) async {
    String fileName = pathStringJson;
    final Directory directory = await getTemporaryDirectory();

    final File file = File('${directory.path}/$fileName');
    if (body != null) {
      final String decodedBody = jsonEncode(body);
      file.writeAsStringSync(
        decodedBody,
        flush: true,
      );
    }
  }

  Future<dynamic> readCachedJsonBody(String pathStringJson) async {
    String fileName = pathStringJson;
    final Directory directory = await getTemporaryDirectory();
    final File file = File('${directory.path}/$fileName');
    if (file.existsSync()) {
      //reading from Cache
      final String data = file.readAsStringSync();
      if (data.isNotEmpty) {
        return returnContenFromCache(data, pathStringJson);
      }
    }
    return null;
  }

  dynamic returnContenFromCache(String data, String pathStringJson) {
    final Map<String, dynamic> decodedData = jsonDecode(data);

    if (pathStringJson == RequestApiConstants.content) {
      return convertToContentItemList(decodedData);
    }
    if (pathStringJson == RequestApiConstants.info) {
      return ChartInfo.fromMap(decodedData);
    }
  }
}
