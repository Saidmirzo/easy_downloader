import 'package:hive/hive.dart';
part 'video_model.g.dart';

@HiveType(typeId: 0)
class VideoModel extends HiveObject {
  @HiveField(0)
  String? url;
  @HiveField(1)
  int? size;
  @HiveField(2)
  String? quality;
  @HiveField(3)
  int? witdth;
  @HiveField(4)
  int? height;
  @HiveField(5)
  int? fps;
  @HiveField(6)
  String? container;

  VideoModel(
      {this.url,
      this.size,
      this.quality,
      this.witdth,
      this.height,
      this.fps,
      this.container});

  VideoModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    size = json['size'];
    quality = json['quality'];
    witdth = json['witdth'];
    height = json['height'];
    fps = json['fps'];
    container = json['container'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['size'] = this.size;
    data['quality'] = this.quality;
    data['witdth'] = this.witdth;
    data['height'] = this.height;
    data['fps'] = this.fps;
    data['container'] = this.container;
    return data;
  }
}
