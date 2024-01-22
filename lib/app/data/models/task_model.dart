class Task {
  String? tittle;
  String? description;
  String? category;
  String? deadlineDate;
  String? deadlineTime;
  String? createdAt;
  String? uid;
  bool? isCompleted;

  Task(
      {this.tittle,
      this.description,
      this.category,
      this.deadlineDate,
      this.deadlineTime,
      this.createdAt,
      this.uid,
      this.isCompleted});

  Task.fromJson(Map<String, dynamic> json) {
    tittle = json['tittle'];
    description = json['description'];
    category = json['category'];
    deadlineDate = json['deadlineDate'];
    deadlineTime = json['deadlineTime'];
    createdAt = json['createdAt'];
    uid = json['uid'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['tittle'] = tittle;
    data['description'] = description;
    data['category'] = category;
    data['deadlineDate'] = deadlineDate;
    data['deadlineTime'] = deadlineTime;
    data['createdAt'] = createdAt;
    data['uid'] = uid;
    data['isCompleted'] = isCompleted;

    return data;
  }
}
