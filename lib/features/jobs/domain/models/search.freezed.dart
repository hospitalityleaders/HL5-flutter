// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Search _$SearchFromJson(Map<String, dynamic> json) {
  return _Search.fromJson(json);
}

/// @nodoc
mixin _$Search {
  int get pageCount => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  int get perPage => throw _privateConstructorUsedError;
  int get current => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchCopyWith<Search> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchCopyWith<$Res> {
  factory $SearchCopyWith(Search value, $Res Function(Search) then) =
      _$SearchCopyWithImpl<$Res, Search>;
  @useResult
  $Res call(
      {int pageCount, int count, int perPage, int current, int page, int end});
}

/// @nodoc
class _$SearchCopyWithImpl<$Res, $Val extends Search>
    implements $SearchCopyWith<$Res> {
  _$SearchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageCount = null,
    Object? count = null,
    Object? perPage = null,
    Object? current = null,
    Object? page = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchCopyWith<$Res> implements $SearchCopyWith<$Res> {
  factory _$$_SearchCopyWith(_$_Search value, $Res Function(_$_Search) then) =
      __$$_SearchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int pageCount, int count, int perPage, int current, int page, int end});
}

/// @nodoc
class __$$_SearchCopyWithImpl<$Res>
    extends _$SearchCopyWithImpl<$Res, _$_Search>
    implements _$$_SearchCopyWith<$Res> {
  __$$_SearchCopyWithImpl(_$_Search _value, $Res Function(_$_Search) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageCount = null,
    Object? count = null,
    Object? perPage = null,
    Object? current = null,
    Object? page = null,
    Object? end = null,
  }) {
    return _then(_$_Search(
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Search implements _Search {
  _$_Search(
      {required this.pageCount,
      required this.count,
      required this.perPage,
      required this.current,
      required this.page,
      required this.end});

  factory _$_Search.fromJson(Map<String, dynamic> json) =>
      _$$_SearchFromJson(json);

  @override
  final int pageCount;
  @override
  final int count;
  @override
  final int perPage;
  @override
  final int current;
  @override
  final int page;
  @override
  final int end;

  @override
  String toString() {
    return 'Search(pageCount: $pageCount, count: $count, perPage: $perPage, current: $current, page: $page, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Search &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pageCount, count, perPage, current, page, end);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchCopyWith<_$_Search> get copyWith =>
      __$$_SearchCopyWithImpl<_$_Search>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchToJson(
      this,
    );
  }
}

abstract class _Search implements Search {
  factory _Search(
      {required final int pageCount,
      required final int count,
      required final int perPage,
      required final int current,
      required final int page,
      required final int end}) = _$_Search;

  factory _Search.fromJson(Map<String, dynamic> json) = _$_Search.fromJson;

  @override
  int get pageCount;
  @override
  int get count;
  @override
  int get perPage;
  @override
  int get current;
  @override
  int get page;
  @override
  int get end;
  @override
  @JsonKey(ignore: true)
  _$$_SearchCopyWith<_$_Search> get copyWith =>
      throw _privateConstructorUsedError;
}
