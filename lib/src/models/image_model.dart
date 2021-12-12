class ImageModel {
  String id = '';
  String username = '';
  String url = '';

  ImageModel(this.id, this.username, this.url);

  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    username = parsedJson['user']['username'];
    url = parsedJson['urls']['small'];
  }
}
