// To parse this JSON data, do
//
//     final responseEvents = responseEventsFromJson(jsonString);

import 'dart:convert';

List<ResponseEvents> responseEventsFromJson(String str) => List<ResponseEvents>.from(json.decode(str).map((x) => ResponseEvents.fromJson(x)));

String responseEventsToJson(List<ResponseEvents> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResponseEvents {
  ResponseEvents({
    this.id,
    this.name,
    this.description,
    this.address,
    this.startDate,
    this.endDate,
    this.picture,
    this.createdAt,
    this.updatedAt,
    this.tickets,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? address;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? picture;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Ticket>? tickets;

  factory ResponseEvents.fromJson(Map<String, dynamic> json) => ResponseEvents(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    address: json["address"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    picture: json["picture"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    tickets: json["tickets"] == null ? [] : List<Ticket>.from(json["tickets"]!.map((x) => Ticket.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "address": address,
    "start_date": startDate?.toIso8601String(),
    "end_date": endDate?.toIso8601String(),
    "picture": picture,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "tickets": tickets == null ? [] : List<dynamic>.from(tickets!.map((x) => x.toJson())),
  };
}

class Ticket {
  Ticket({
    this.id,
    this.eventId,
    this.type,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? eventId;
  final String? type;
  final int? price;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
    id: json["id"],
    eventId: json["event_id"],
    type: json["type"],
    price: json["price"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "event_id": eventId,
    "type": type,
    "price": price,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
