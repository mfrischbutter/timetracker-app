import 'dart:convert';

class Timer {
  DateTime start;
  DateTime end;

  Timer({this.start, this.end});

  factory Timer.fromJsonString(String json) {
    Map obj = jsonDecode(json);
    return Timer(
      start: (obj['start'] != null) ? DateTime.parse(obj['start']) : null,
      end: (obj['end'] != null) ? DateTime.parse(obj['end']) : null,
    );
  }

  String toJsonString() => jsonEncode({
        'start': (start != null) ? start.toIso8601String() : null,
        'end': (end != null) ? end.toIso8601String() : null,
      });
}
