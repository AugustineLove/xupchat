class Message {
  final String? userName;
  final int? userId;
  final int? id;

  Message({
    required this.userName,
    required this.userId,
    required this.id,
  });

  factory Message.fromJson(Map<String, dynamic> json){
    return Message(
      userId: json['userId'] as int,
      userName: json['userName'] as String,
      id: json['id'] as int,
    );
  }
}