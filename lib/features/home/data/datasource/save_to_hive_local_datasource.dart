import 'package:easy_downloader/core/errors/errors.dart';
import 'package:easy_downloader/features/home/data/models/video_model.dart';
import 'package:hive/hive.dart';

abstract class SaveToHiveLocalDataSource {
  Future<void> saveToBox(String boxName, VideoModel value);
  Future<List<VideoModel>> getToBox(String boxName);
  Future<void> deleteFromoBox(String boxName, int index);
}

class SaveToHiveLoacalDataSourceImpl implements SaveToHiveLocalDataSource {
  @override
  Future<List<VideoModel>> getToBox(String boxName) async {
    Box<VideoModel> box = await Hive.openBox(boxName);
    if (Hive.isBoxOpen(boxName)) {
      box = Hive.box(boxName);
      final list = box.values.toList();
      return list;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveToBox(String boxName, VideoModel value) async {
    Box<VideoModel> box;
    if (!Hive.isBoxOpen(boxName)) {
      box = await Hive.openBox<VideoModel>(boxName);
    } else {
      box = Hive.box(boxName);
    }
    await box.add(value);
    // await box.put('list', value);
  }

  @override
  Future<void> deleteFromoBox(String boxName, int index) async {
    Box<VideoModel> box;
    if (!Hive.isBoxOpen(boxName)) {
      box = await Hive.openBox<VideoModel>(boxName);
    } else {
      box = Hive.box(boxName);
    }
    await box.deleteAt(index);
  }
}
