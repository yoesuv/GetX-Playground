class TaskModel {
  TaskModel({
    this.id,
    this.titleTask,
    this.contentTask,
  });

  int? id;
  String? titleTask;
  String? contentTask;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        titleTask: json["titleTask"],
        contentTask: json["contentTask"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titleTask": titleTask,
        "contentTask": contentTask,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
