import 'package:equatable/equatable.dart';

class ImageApp extends Equatable {
  String? id;
  String? Url;
  ImageApp({ this.id, this.Url});

 factory ImageApp.fromJson(String id, Map<String, dynamic> json) {
  return ImageApp(
    id: id,
    Url: json['path_image']
  );
 }
  @override
  // TODO: implement props
  List<Object?> get props => [id, Url];
}
