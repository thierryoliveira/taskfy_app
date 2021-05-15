// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

List<Task> taskFromJson(String str) => List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String taskToJson(List<Task> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
    Task({
        this.id,
        this.title,
        this.description,
        this.status,
        this.dateTime,
        this.createdDate
    });

    int id;
    String title;
    String description;
    String status;
    String dateTime;
    String createdDate;


    factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        dateTime: json["dateTime"],
        status: json["status"],
        createdDate: json["createdDate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "status": status,
        "dateTime": dateTime,
        "createdDate": createdDate,
    };
}
