class DummyApiModel{
  int? userId;
  int? id;
  String? title;
  String? body;
DummyApiModel(this.userId,this.id,this.title,this.body);
Map<String,dynamic> fromJson(){
  return{
    "userId":userId,
    "id":id,
    "title":title,
    "body":body
  };
}
}




