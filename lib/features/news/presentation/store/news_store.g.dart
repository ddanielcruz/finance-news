// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsStore on _NewsStore, Store {
  final _$categoriesAtom = Atom(name: '_NewsStore.categories');

  @override
  List<Category> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<Category> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$initializeAsyncAction = AsyncAction('_NewsStore.initialize');

  @override
  Future<dynamic> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  @override
  String toString() {
    return '''
categories: ${categories}
    ''';
  }
}
