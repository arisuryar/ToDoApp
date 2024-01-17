class Task {
  String? tittle;
  String? description;
  String? category;
  String? deadlineDate;
  String? deadlineTime;
  String? createdAt;
  bool? isCompleted;
  String? image;

  Task(
      {this.tittle,
      this.description,
      this.category,
      this.deadlineDate,
      this.deadlineTime,
      this.createdAt,
      this.isCompleted,
      this.image});

  Task.fromJson(Map<String, dynamic> json) {
    tittle = json['tittle'];
    description = json['description'];
    category = json['category'];
    deadlineDate = json['deadlineDate'];
    deadlineTime = json['deadlineTime'];
    createdAt = json['createdAt'];
    isCompleted = json['isCompleted'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['tittle'] = tittle;
    data['description'] = description;
    data['category'] = category;
    data['deadlineDate'] = deadlineDate;
    data['deadlineTime'] = deadlineTime;
    data['createdAt'] = createdAt;
    data['isCompleted'] = isCompleted;
    data['image'] = image;

    return data;
  }
}
