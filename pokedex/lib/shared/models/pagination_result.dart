abstract class PaginationResult<T> {
  PaginationResult(this.count, this.next, this.previous, this.results);

  final int count;
  final String? next;
  final String? previous;
  final List<T> results;
}
