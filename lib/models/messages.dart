class MessagesModel {
  final String message;
  final String id;
  MessagesModel({required this.message, required this.id});

  factory MessagesModel.fromJson(dynamic json) {
    final message = json['message'] as String;
    final id = json['id'] as String; // Fix the assignment here
    return MessagesModel(message: message, id: id);
  }
}
