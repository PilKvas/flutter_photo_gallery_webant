// ignore_for_file: public_member_api_docs, sort_constructors_first


T _getOrDefault<T>(
  Map<String, dynamic> json, {
  required String key,
  required T defaultValue,
}) {
  final value = json[key];
  if (value is T) {
    return value;
  } else {
    return defaultValue;
  }
}
class PhotoGridDTO {
  final int id;
  final String name;
  final String dateCreate;
  final String description;
  final bool isNew;
  final bool isPopular;
  final ImageDetails? image;
  final String? user;

  PhotoGridDTO({
    required this.id,
    required this.name,
    required this.dateCreate,
    required this.description,
    required this.isNew,
    required this.isPopular,
    required this.image,
    required this.user,
  });

  factory PhotoGridDTO.fromApi(Map<String, dynamic> json) {
    return PhotoGridDTO(
      id: json['id'],
      name: _getOrDefault(json, key: 'name', defaultValue: "No name"),
      dateCreate: _getOrDefault(json, key: 'dateCreate', defaultValue: "No date"),
      description: _getOrDefault(json, key: 'description', defaultValue: "No description"),
      isNew: json['new'],
      isPopular: json['popular'],
      image: json['image'] != null ? ImageDetails.fromApi(json['image']) : null,
      user: _getOrDefault(json, key: 'user', defaultValue: "No user"),
    );
  }

  @override
  String toString() {
    return 'PhotoGridDTO(id: $id, name: $name, dateCreate: $dateCreate, description: $description, isNew: $isNew, isPopular: $isPopular, image: $image, user: $user)';
  }
}

class ImageDetails {
  final int id;
  final String imageUrl; 

  ImageDetails({
    required this.id,
    required this.imageUrl,
  });

  factory ImageDetails.fromApi(Map<String, dynamic> json) {
    return ImageDetails(
      id: json['id'],
      imageUrl: 'https://gallery.prod1.webant.ru/media/${json['name']}', 
    );
  }
}
