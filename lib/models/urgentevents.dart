class UrgenteventsModel {
  final int id;
  final String title;
  final String text;
  final DateTime event_date;
  final String priority;
  final String status;
  final int user_id;
  final int task_id;
  final DateTime  created_at;
  final DateTime updated_at;

  UrgenteventsModel({
    required this.id,
    required this.title,
    required this.text,
    required this.event_date,
    required this.priority,
    required this.status,
    required this.user_id,
    required this.task_id,
    required this.created_at,
    required this.updated_at,

});
  // Phương thức từ JSON thành object
  factory UrgenteventsModel.fromJson(Map<String, dynamic>json){
    return UrgenteventsModel(
      id:json['id'],
      title: json['title'],
      text: json['text'],
      event_date: json['event_date'],
      priority: json['priority'],
      status: json['status'],
      user_id: json['user_id'],
      task_id: json['task_id'],
      created_at: json['created_at'],
      updated_at: json['update_at'],
    );
  }
  // Phương thức từ object thành JSON
  Map<String, dynamic> toJson(){
    return{
      'id':id,
      'title':title,
      'text':text,
      'event_date':event_date,
      'priority':priority,
      'status':status,
      'user_id':user_id,
      'task_id':task_id,
      'created_at':created_at,
      'updated_at':updated_at,

    };
  }



}