///   created               : Fadqurrosyidik
///   originalFilename      : extension_list
///   date                  : 27 Sept 2021
///   —————————————————————————————————————————————————————————————————————————————
///    scope                : List

extension Unique<E, Id> on List<E> {
  List<E> unique([Id Function(E element)? id, bool inplace = true]) {
    final ids = <dynamic>{};
    final list = inplace ? this : List<E>.from(this)
      ..retainWhere((x) => ids.add(id != null ? id(x) : x as Id));
    return list;
  }
}
