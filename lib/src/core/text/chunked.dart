part of text;

extension ChunkedString on String {
  /// Splits into a list of strings, each not with a length of `size`.
  ///
  /// The last string may have a length smaller than the given `size`.
  ///
  /// The returned iterable will be lazy, it will only chunk the elements that
  /// are requested.
  ///
  /// ```dart
  /// final words = 'xxxyyyzzz';
  /// final chunks = words.chunked(3);
  ///
  /// print(chunks); // (xxx, yyy, zzz)
  /// ```
  ///
  /// When the `transform` is given, it will be applied to each list.
  ///
  /// ```dart
  /// final codonTable = {
  ///   'ATT': 'Isoleucine',
  ///   'CAA': 'Glutamine',
  ///   'CGC': 'Arginine',
  ///   'GGC': 'Glycine'
  /// };
  /// final dnaFragment = 'ATTCGCGGCCGCCAA';
  /// final proteins = dnaFragment.chunked(3, (codon) => codonTable[codon]);
  ///
  /// print(proteins); // (Isoleucine, Arginine, Glycine, Arginine, Glutamine)
  /// ```
  Iterable<R> chunked<R>(int size, [ChunkedTransform<String, R>? transform]) {
    transform ??= (v) => v as R;
    final nnTransform = transform;

    return split('').chunked(size, (v) => nnTransform(v.join()));
  }
}
