import 'dart:convert';

import 'package:flutter_radio_player_2/src/home/application/services/utils/convert_content_item_list.dart';
import 'package:flutter_radio_player_2/src/home/domain/repositories/cache_repository.dart';
import 'package:http/http.dart' as http;
import '../../../constants/constants_common_uses.dart';
import '../../../utils/check_reponse_request.dart';
import '../../../utils/custom_exception.dart';
import '../../data/utils/obtain_api_key_value.dart';
import '../../domain/models/item_model.dart';

Future<List<ContentItem>> obtainRadioListFromServer() async {
  try {
    String? apiKeyValueStorage = await getApiKey();
    Map<String, String> headers = {
      'X-RapidAPI-Key': apiKeyValueStorage,
      'X-RapidAPI-Host': 'billboard-api2.p.rapidapi.com'
    };
    final response = await http
        .get(Uri.parse(RequestApiConstants.urlApi), headers: headers)
        .timeout(
          const Duration(seconds: 60),
        );
    if (!isSuccessfulResponse(response.statusCode)) {
      throw CustomException(
          innerException: 'Failed to fetch data from the server.');
    }
    if (response.body.toString().isNotEmpty) {
      final Map<String, dynamic> jsonData =
          jsonDecode(response.body.toString());

      CacheRepo().writeCachedJsonBody(
          body: jsonData['info'], pathStringJson: RequestApiConstants.info);

      final Map<String, dynamic> items = jsonData['content'];
      CacheRepo().writeCachedJsonBody(
          body: items, pathStringJson: RequestApiConstants.content);
      final List<ContentItem> listItems = convertToContentItemList(items);
      return listItems;
    } else {
      throw CustomException(innerException: 'Empty response from the server.');
    }
  } catch (error) {
    throw CustomException(innerException: error);
  }
}
