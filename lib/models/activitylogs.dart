class ActivitylogsModel{
  final int  id;
  final int task_id;
  final String action;
  final int performed_by;
  final DateTime performed_at;

  ActivitylogsModel({
    required this.id,
    required this.task_id,
    required this.action,
    required this.performed_by,
    required this.performed_at,

});
  // Phương thức từ JSON thành object
  factory ActivitylogsModel.fromJson(Map<String, dynamic>json){
    return ActivitylogsModel(
      id:json['id'],
      task_id: json['task_id'],
      action: json['action'],
      performed_by: json['performed_by'],
      performed_at: json['performed_at'],
    );
  }
  // Phương thức từ object thành JSON
  Map<String, dynamic> toJson(){
    return{
      'id':id,
      'task_id':task_id,
      'action':action,
      'performed_by':performed_by,
      'performed_at':performed_at,

    };
  }







}