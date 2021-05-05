class CreateTaskDTO {
  String title;
  String description;
  String dateTime;

  CreateTaskDTO({this.title, this.description, this.dateTime});

  CreateTaskDTO.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['dateTime'] = this.dateTime;
    return data;
  }
}