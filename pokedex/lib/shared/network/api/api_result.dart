import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ApiResult<T> extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<T> results;

  const ApiResult(this.count, this.next, this.previous, this.results);

  @override
  List<Object?> get props => [count, next, previous, results];
}
