import '../../../constants/constants_common_uses.dart';
import '../../../utils/custom_exception.dart';
import '../../domain/repositories/secure_storage_repository.dart';

Future<String> getApiKey() async {
  try {
    await FlutterSecureStorageRepository().writeData(
        key: RequestApiConstants.apiKeyName,
        value: RequestApiConstants.apiKeyValue);
    String? apiKeyValueStorage = await FlutterSecureStorageRepository()
        .readData(key: RequestApiConstants.apiKeyName);
    return apiKeyValueStorage ?? '';
  } catch (error) {
    throw CustomException(innerException: error);
  }
}
