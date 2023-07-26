import '../../../constants/constants_common_uses.dart';
import '../../domain/repositories/cache_repository.dart';

Future<bool> isCacheData() async =>
    (await CacheRepo().readCachedJsonBody(RequestApiConstants.content)) == null;
