class CreateTaskDTO {
  String title;
  String description;
  String dateTime;
  String createdDate;

  CreateTaskDTO({this.title, this.description, this.dateTime, this.createdDate});

  CreateTaskDTO.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    dateTime = json['dateTime'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['dateTime'] = this.dateTime;
    data['createdDate'] = this.createdDate;
    return data;
  }
}