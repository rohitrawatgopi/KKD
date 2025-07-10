import 'package:flutter_cache_manager/flutter_cache_manager.dart';

// class MyCacheManager {
//   static final CacheManager instance = CacheManager(
//     Config(
//       'customCategoryImageCache',
//       stalePeriod: const Duration(days: 30), // 30 din tak cache safe
//       maxNrOfCacheObjects: 200, // up to 200 images
//     ),
//   );
// }
class MyCacheManager extends CacheManager {
  static const key = "customCache";

  static final instance = MyCacheManager._();

  MyCacheManager._()
    : super(
        Config(
          key,
          stalePeriod: const Duration(days: 7),
          maxNrOfCacheObjects: 100,
          repo: JsonCacheInfoRepository(databaseName: key),
          fileService: HttpFileService(),
        ),
      );
}
