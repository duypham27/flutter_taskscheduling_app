class TasksModel{
  final int id;
  final String title;
  final String description;
  final String status;
  final DateTime due_date;
  final String priority;
  final int category_id;
  final DateTime created_at;
  final DateTime updated_at;

  TasksModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.due_date,
    required this.priority,
    required this.category_id,
    required this.created_at,
    required this.updated_at,
});
// Phương thức từ JSON thành object
  factory TasksModel.fromJson(Map<String, dynamic>json){
    return TasksModel(
      id:json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      due_date: json['due_date'],
      priority: json['priority'],
      category_id: json['category_id'],
      created_at: json['created_at'],
      updated_at: json['update_at'],
    );
  }
// Phương thức từ object thành JSON
  Map<String, dynamic> toJson(){
      return{
        'id':id,
        'title':title,
        'description':description,
        'status':status,
        'due_date':due_date,
        'priority':priority,
        'category_id':category_id,
        'created_at':created_at,
        'updated_at':updated_at,

      };
  }

}