// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoState {
  List<TodoModel> get todoList =>
      throw _privateConstructorUsedError; // Lista de tareas
  TodoModel get todo => throw _privateConstructorUsedError; // Tarea actual
  BusquedaModel get busqueda => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoStateCopyWith<TodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoStateCopyWith<$Res> {
  factory $TodoStateCopyWith(TodoState value, $Res Function(TodoState) then) =
      _$TodoStateCopyWithImpl<$Res, TodoState>;
  @useResult
  $Res call({List<TodoModel> todoList, TodoModel todo, BusquedaModel busqueda});

  $TodoModelCopyWith<$Res> get todo;
  $BusquedaModelCopyWith<$Res> get busqueda;
}

/// @nodoc
class _$TodoStateCopyWithImpl<$Res, $Val extends TodoState>
    implements $TodoStateCopyWith<$Res> {
  _$TodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoList = null,
    Object? todo = null,
    Object? busqueda = null,
  }) {
    return _then(_value.copyWith(
      todoList: null == todoList
          ? _value.todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as List<TodoModel>,
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as TodoModel,
      busqueda: null == busqueda
          ? _value.busqueda
          : busqueda // ignore: cast_nullable_to_non_nullable
              as BusquedaModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TodoModelCopyWith<$Res> get todo {
    return $TodoModelCopyWith<$Res>(_value.todo, (value) {
      return _then(_value.copyWith(todo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BusquedaModelCopyWith<$Res> get busqueda {
    return $BusquedaModelCopyWith<$Res>(_value.busqueda, (value) {
      return _then(_value.copyWith(busqueda: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TodoStateCopyWith<$Res> implements $TodoStateCopyWith<$Res> {
  factory _$$_TodoStateCopyWith(
          _$_TodoState value, $Res Function(_$_TodoState) then) =
      __$$_TodoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TodoModel> todoList, TodoModel todo, BusquedaModel busqueda});

  @override
  $TodoModelCopyWith<$Res> get todo;
  @override
  $BusquedaModelCopyWith<$Res> get busqueda;
}

/// @nodoc
class __$$_TodoStateCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$_TodoState>
    implements _$$_TodoStateCopyWith<$Res> {
  __$$_TodoStateCopyWithImpl(
      _$_TodoState _value, $Res Function(_$_TodoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoList = null,
    Object? todo = null,
    Object? busqueda = null,
  }) {
    return _then(_$_TodoState(
      todoList: null == todoList
          ? _value._todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as List<TodoModel>,
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as TodoModel,
      busqueda: null == busqueda
          ? _value.busqueda
          : busqueda // ignore: cast_nullable_to_non_nullable
              as BusquedaModel,
    ));
  }
}

/// @nodoc

class _$_TodoState extends _TodoState {
  _$_TodoState(
      {required final List<TodoModel> todoList,
      required this.todo,
      required this.busqueda})
      : _todoList = todoList,
        super._();

  final List<TodoModel> _todoList;
  @override
  List<TodoModel> get todoList {
    if (_todoList is EqualUnmodifiableListView) return _todoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todoList);
  }

// Lista de tareas
  @override
  final TodoModel todo;
// Tarea actual
  @override
  final BusquedaModel busqueda;

  @override
  String toString() {
    return 'TodoState(todoList: $todoList, todo: $todo, busqueda: $busqueda)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoState &&
            const DeepCollectionEquality().equals(other._todoList, _todoList) &&
            (identical(other.todo, todo) || other.todo == todo) &&
            (identical(other.busqueda, busqueda) ||
                other.busqueda == busqueda));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_todoList), todo, busqueda);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoStateCopyWith<_$_TodoState> get copyWith =>
      __$$_TodoStateCopyWithImpl<_$_TodoState>(this, _$identity);
}

abstract class _TodoState extends TodoState {
  factory _TodoState(
      {required final List<TodoModel> todoList,
      required final TodoModel todo,
      required final BusquedaModel busqueda}) = _$_TodoState;
  _TodoState._() : super._();

  @override
  List<TodoModel> get todoList;
  @override // Lista de tareas
  TodoModel get todo;
  @override // Tarea actual
  BusquedaModel get busqueda;
  @override
  @JsonKey(ignore: true)
  _$$_TodoStateCopyWith<_$_TodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchState {
  List<CharacterModel> get characterList => throw _privateConstructorUsedError;
  List<BusquedaModel> get busquedaList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {List<CharacterModel> characterList, List<BusquedaModel> busquedaList});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterList = null,
    Object? busquedaList = null,
  }) {
    return _then(_value.copyWith(
      characterList: null == characterList
          ? _value.characterList
          : characterList // ignore: cast_nullable_to_non_nullable
              as List<CharacterModel>,
      busquedaList: null == busquedaList
          ? _value.busquedaList
          : busquedaList // ignore: cast_nullable_to_non_nullable
              as List<BusquedaModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_SearchStateCopyWith(
          _$_SearchState value, $Res Function(_$_SearchState) then) =
      __$$_SearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CharacterModel> characterList, List<BusquedaModel> busquedaList});
}

/// @nodoc
class __$$_SearchStateCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$_SearchState>
    implements _$$_SearchStateCopyWith<$Res> {
  __$$_SearchStateCopyWithImpl(
      _$_SearchState _value, $Res Function(_$_SearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterList = null,
    Object? busquedaList = null,
  }) {
    return _then(_$_SearchState(
      characterList: null == characterList
          ? _value._characterList
          : characterList // ignore: cast_nullable_to_non_nullable
              as List<CharacterModel>,
      busquedaList: null == busquedaList
          ? _value._busquedaList
          : busquedaList // ignore: cast_nullable_to_non_nullable
              as List<BusquedaModel>,
    ));
  }
}

/// @nodoc

class _$_SearchState extends _SearchState {
  _$_SearchState(
      {required final List<CharacterModel> characterList,
      required final List<BusquedaModel> busquedaList})
      : _characterList = characterList,
        _busquedaList = busquedaList,
        super._();

  final List<CharacterModel> _characterList;
  @override
  List<CharacterModel> get characterList {
    if (_characterList is EqualUnmodifiableListView) return _characterList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characterList);
  }

  final List<BusquedaModel> _busquedaList;
  @override
  List<BusquedaModel> get busquedaList {
    if (_busquedaList is EqualUnmodifiableListView) return _busquedaList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_busquedaList);
  }

  @override
  String toString() {
    return 'SearchState(characterList: $characterList, busquedaList: $busquedaList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchState &&
            const DeepCollectionEquality()
                .equals(other._characterList, _characterList) &&
            const DeepCollectionEquality()
                .equals(other._busquedaList, _busquedaList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_characterList),
      const DeepCollectionEquality().hash(_busquedaList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      __$$_SearchStateCopyWithImpl<_$_SearchState>(this, _$identity);
}

abstract class _SearchState extends SearchState {
  factory _SearchState(
      {required final List<CharacterModel> characterList,
      required final List<BusquedaModel> busquedaList}) = _$_SearchState;
  _SearchState._() : super._();

  @override
  List<CharacterModel> get characterList;
  @override
  List<BusquedaModel> get busquedaList;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
