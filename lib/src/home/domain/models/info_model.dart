import 'dart:convert';

class ChartInfo {
  final String category;
  final String chart;
  final String date;
  final String source;
  ChartInfo({
    required this.category,
    required this.chart,
    required this.date,
    required this.source,
  });

  ChartInfo copyWith({
    String? category,
    String? chart,
    String? date,
    String? source,
  }) {
    return ChartInfo(
      category: category ?? this.category,
      chart: chart ?? this.chart,
      date: date ?? this.date,
      source: source ?? this.source,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'chart': chart,
      'date': date,
      'source': source,
    };
  }

  factory ChartInfo.fromMap(Map<String, dynamic> map) {
    return ChartInfo(
      category: map['category'] ?? '',
      chart: map['chart'] ?? '',
      date: map['date'] ?? '',
      source: map['source'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChartInfo.fromJson(String source) =>
      ChartInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChartInfo(category: $category, chart: $chart, date: $date, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChartInfo &&
        other.category == category &&
        other.chart == chart &&
        other.date == date &&
        other.source == source;
  }

  @override
  int get hashCode {
    return category.hashCode ^ chart.hashCode ^ date.hashCode ^ source.hashCode;
  }
}
