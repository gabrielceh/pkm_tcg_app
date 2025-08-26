class ResponseDataTcg {
  final int page;
  final int pageSize;
  final int count;
  final int totalCount;

  ResponseDataTcg({
    required this.page,
    required this.pageSize,
    required this.count,
    required this.totalCount,
  });

  factory ResponseDataTcg.fromJson(Map<String, dynamic> json) =>
      ResponseDataTcg(
        page: json["page"],
        pageSize: json["pageSize"],
        count: json["count"],
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
    "page": page,
    "pageSize": pageSize,
    "count": count,
    "totalCount": totalCount,
  };
}
