import 'dart:convert';

class ContentItem {
  final String rank;
  final String title;
  final String artist;
  final String?
      weeksAtNo1; // The field has a name with dots, so we declare it as optional with '?'
  final String lastWeek;
  final String peakPosition;
  final String weeksOnChart;
  final String detail;
  ContentItem({
    required this.rank,
    required this.title,
    required this.artist,
    this.weeksAtNo1,
    required this.lastWeek,
    required this.peakPosition,
    required this.weeksOnChart,
    required this.detail,
  });

  ContentItem copyWith({
    String? rank,
    String? title,
    String? artist,
    String? weeksAtNo1,
    String? lastWeek,
    String? peakPosition,
    String? weeksOnChart,
    String? detail,
  }) {
    return ContentItem(
      rank: rank ?? this.rank,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      weeksAtNo1: weeksAtNo1 ?? this.weeksAtNo1,
      lastWeek: lastWeek ?? this.lastWeek,
      peakPosition: peakPosition ?? this.peakPosition,
      weeksOnChart: weeksOnChart ?? this.weeksOnChart,
      detail: detail ?? this.detail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rank': rank,
      'title': title,
      'artist': artist,
      'weeksAtNo1': weeksAtNo1,
      'lastWeek': lastWeek,
      'peakPosition': peakPosition,
      'weeksOnChart': weeksOnChart,
      'detail': detail,
    };
  }

  factory ContentItem.fromMap(Map<String, dynamic> map) {
    return ContentItem(
      rank: map['rank'] ?? '',
      title: map['title'] ?? '',
      artist: map['artist'] ?? '',
      weeksAtNo1: map['weeksAtNo1'],
      lastWeek: map['lastWeek'] ?? '',
      peakPosition: map['peakPosition'] ?? '',
      weeksOnChart: map['weeksOnChart'] ?? '',
      detail: map['detail'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentItem.fromJson(String source) =>
      ContentItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChartContentItem(rank: $rank, title: $title, artist: $artist, weeksAtNo1: $weeksAtNo1, lastWeek: $lastWeek, peakPosition: $peakPosition, weeksOnChart: $weeksOnChart, detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContentItem &&
        other.rank == rank &&
        other.title == title &&
        other.artist == artist &&
        other.weeksAtNo1 == weeksAtNo1 &&
        other.lastWeek == lastWeek &&
        other.peakPosition == peakPosition &&
        other.weeksOnChart == weeksOnChart &&
        other.detail == detail;
  }

  @override
  int get hashCode {
    return rank.hashCode ^
        title.hashCode ^
        artist.hashCode ^
        weeksAtNo1.hashCode ^
        lastWeek.hashCode ^
        peakPosition.hashCode ^
        weeksOnChart.hashCode ^
        detail.hashCode;
  }
}
