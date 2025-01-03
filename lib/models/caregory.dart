class CategoryModel {
  final int id;
  final String name;
  final String color_code;
  final DateTime created_at;


  CategoryModel({
    required this.id,
    required this.name,
    required this.color_code,
    required this.created_at,
  });

// Phương thức từ JSON thành object
  factory CategoryModel.fromJson(Map<String, dynamic>json){
    return CategoryModel(
      id:json['id'],
      name: json['name'],
      color_code: json['color_code'],
      created_at: json['created_at'],

    );
  }
// Phương thức từ object thành JSON
  Map<String, dynamic> toJson(){
    return{
      'id':id,
      'name':name,
      'color_code':color_code,
      'created_at':created_at,

    };
  }


}