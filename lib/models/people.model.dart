import 'package:star_wars/models/models.dart';


class PeopleModel {
  PeopleModel({
    required this.count,
    this.next,
    this.previous,
    required this.persons,
  });

  final int count;
  final String? next;
  final String? previous;
  final List<PersonModel> persons;

  factory PeopleModel.fromJson(Map<String, dynamic> json) => PeopleModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        persons: List<PersonModel>.from(
          json["results"].map(
            (x) => PersonModel.fromJson(x),
          ),
        ),
      );
}


