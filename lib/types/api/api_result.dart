/// APIリクエストの結果を表現する基底クラス
abstract class ApiResult<T> {
  const ApiResult();

  /// 成功判定
  bool get isSuccess => this is ApiSuccess<T>;
  
  /// 失敗判定
  bool get isFailure => this is ApiFailure<T>;

  /// 成功時の値を取得（失敗時はnull）
  T? get dataOrNull {
    if (this is ApiSuccess<T>) {
      return (this as ApiSuccess<T>).data;
    }
    return null;
  }

  /// パターンマッチング用のwhenメソッド
  R when<R>({
    required R Function(ApiSuccess<T> success) success,
    required R Function(ApiFailure<T> failure) failure,
  }) {
    if (this is ApiSuccess<T>) {
      return success(this as ApiSuccess<T>);
    } else {
      return failure(this as ApiFailure<T>);
    }
  }

  /// より関数型スタイルのmap
  R map<R>({
    required R Function(T data, List<String> messages, int status, Pagination? pagination) success,
    required R Function(List<String> messages, int status, Map<String, dynamic>? validationMessages, bool isErrorPage) failure,
  }) {
    if (this is ApiSuccess<T>) {
      final s = this as ApiSuccess<T>;
      return success(s.data, s.messages, s.status, s.pagination);
    } else {
      final f = this as ApiFailure<T>;
      return failure(f.messages, f.status, f.validationMessages, f.isErrorPage);
    }
  }
}

/// 成功時の結果
class ApiSuccess<T> extends ApiResult<T> {
  /// システムが利用するメインデータ
  final T data;
  
  /// システムが表示するメッセージ
  final List<String> messages;
  
  /// ステータスコード
  final int status;
  
  /// ページネーション情報
  final Pagination? pagination;

  const ApiSuccess({
    required this.data,
    this.messages = const [],
    required this.status,
    this.pagination,
  });

  /// JSONからのパース（ジェネリック型対応）
  factory ApiSuccess.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) dataParser,
  ) {
    return ApiSuccess(
      data: dataParser(json['data']),
      messages: _parseMessages(json['message']),
      status: json['status'] as int,
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'] as Map<String, dynamic>)
          : null,
    );
  }

  /// copyWithメソッド
  ApiSuccess<T> copyWith({
    T? data,
    List<String>? messages,
    int? status,
    Pagination? pagination,
  }) {
    return ApiSuccess(
      data: data ?? this.data,
      messages: messages ?? this.messages,
      status: status ?? this.status,
      pagination: pagination ?? this.pagination,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiSuccess<T> &&
          runtimeType == other.runtimeType &&
          data == other.data &&
          _listEquals(messages, other.messages) &&
          status == other.status &&
          pagination == other.pagination;

  @override
  int get hashCode => data.hashCode ^ messages.hashCode ^ status.hashCode ^ pagination.hashCode;
}

/// 失敗時の結果
class ApiFailure<T> extends ApiResult<T> {
  /// エラーメッセージ
  final List<String> messages;
  
  /// ステータスコード
  final int status;
  
  /// バリデーション専用メッセージ
  final Map<String, dynamic>? validationMessages;
  
  /// エラーページ表示フラグ
  final bool isErrorPage;

  const ApiFailure({
    required this.messages,
    required this.status,
    this.validationMessages,
    this.isErrorPage = false,
  });

  /// JSONからのパース
  factory ApiFailure.fromJson(Map<String, dynamic> json) {
    return ApiFailure(
      messages: _parseMessages(json['message']),
      status: json['status'] as int? ?? 500,
      validationMessages: json['validation_messages'] as Map<String, dynamic>?,
      isErrorPage: json['is_error_page'] as bool? ?? false,
    );
  }

  /// ネットワークエラー用のファクトリ
  factory ApiFailure.networkError([String? customMessage]) {
    return ApiFailure(
      messages: [customMessage ?? 'ネットワークエラーが発生しました'],
      status: 0,
      isErrorPage: true,
    );
  }

  /// タイムアウトエラー用のファクトリ
  factory ApiFailure.timeout() {
    return const ApiFailure(
      messages: ['リクエストがタイムアウトしました'],
      status: 408,
      isErrorPage: true,
    );
  }

  /// copyWithメソッド
  ApiFailure<T> copyWith({
    List<String>? messages,
    int? status,
    Map<String, dynamic>? validationMessages,
    bool? isErrorPage,
  }) {
    return ApiFailure(
      messages: messages ?? this.messages,
      status: status ?? this.status,
      validationMessages: validationMessages ?? this.validationMessages,
      isErrorPage: isErrorPage ?? this.isErrorPage,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiFailure<T> &&
          runtimeType == other.runtimeType &&
          _listEquals(messages, other.messages) &&
          status == other.status &&
          _mapEquals(validationMessages, other.validationMessages) &&
          isErrorPage == other.isErrorPage;

  @override
  int get hashCode =>
      messages.hashCode ^ status.hashCode ^ validationMessages.hashCode ^ isErrorPage.hashCode;
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

  const Pagination({
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
      currentPage: json['current_page'] as int? ?? 0,
      lastPage: json['last_page'] as int? ?? 0,
      perPage: json['per_page'] as int? ?? 0,
      total: json['total'] as int? ?? 0,
      from: json['from'] as int?,
      to: json['to'] as int?,
      hasMore: json['has_more'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'last_page': lastPage,
      'per_page': perPage,
      'total': total,
      if (from != null) 'from': from,
      if (to != null) 'to': to,
      'has_more': hasMore,
    };
  }

  Pagination copyWith({
    int? currentPage,
    int? lastPage,
    int? perPage,
    int? total,
    int? from,
    int? to,
    bool? hasMore,
  }) {
    return Pagination(
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      from: from ?? this.from,
      to: to ?? this.to,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pagination &&
          runtimeType == other.runtimeType &&
          currentPage == other.currentPage &&
          lastPage == other.lastPage &&
          perPage == other.perPage &&
          total == other.total &&
          from == other.from &&
          to == other.to &&
          hasMore == other.hasMore;

  @override
  int get hashCode =>
      currentPage.hashCode ^
      lastPage.hashCode ^
      perPage.hashCode ^
      total.hashCode ^
      from.hashCode ^
      to.hashCode ^
      hasMore.hashCode;
}

// ヘルパー関数
List<String> _parseMessages(dynamic message) {
  if (message == null) return const [];
  if (message is List) {
    return message.map((e) => e.toString()).toList();
  }
  return [message.toString()];
}

bool _listEquals<T>(List<T>? a, List<T>? b) {
  if (a == null) return b == null;
  if (b == null || a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

bool _mapEquals<K, V>(Map<K, V>? a, Map<K, V>? b) {
  if (a == null) return b == null;
  if (b == null || a.length != b.length) return false;
  for (final key in a.keys) {
    if (!b.containsKey(key) || a[key] != b[key]) return false;
  }
  return true;
}