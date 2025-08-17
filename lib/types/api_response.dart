/// APIレスポンスの型定義
class ApiResponse<T> {
  /// システムが利用するメインデータ
  final T? data;
  /// システムが表示するメッセージ(エラーメッセージ、正常メッセージ共通)
  final List<String> message;
  /// ステータスコード
  final int status;
  /// バリデーション専用メッセージ
  final Map<String, dynamic>? validationMessages;
  /// ページネーション情報
  final Pagination? pagination;
  /// エラーページ表示フラグ
  final bool isErrorPage;

  ApiResponse({
    required this.data, 
    required this.message,
    required this.status,
    this.validationMessages,
    this.pagination,
    this.isErrorPage = false,
  });
}

/// ページネーション用型定義
class Pagination {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;
  final int? from;
  final int? to;
  final bool hasMore;

  Pagination({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
    this.from,
    this.to,
    required this.hasMore,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['current_page'] ?? 0,
      lastPage: json['last_page'] ?? 0,
      perPage: json['per_page'] ?? 0,
      total: json['total'] ?? 0,
      from: json['from'],
      to: json['to'],
      hasMore: json['has_more'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'last_page': lastPage,
      'per_page': perPage,
      'total': total,
      'from': from,
      'to': to,
      'has_more': hasMore,
    };
  }
}