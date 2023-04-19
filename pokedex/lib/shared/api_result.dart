import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ApiResult<T> extends Equatable {
  const ApiResult(
    this.count,
    this.next,
    this.prev,
    this.results,
  );

  final int count;
  final String? next;
  final String? prev;
  final List<T> results;

  @override
  List<Object?> get props => [count, next, prev, results];
}
