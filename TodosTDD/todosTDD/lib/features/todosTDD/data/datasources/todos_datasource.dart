import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todosTDD/features/todosTDD/data/models/todos/todo.dart';
import 'package:todosTDD/features/todosTDD/domain/entities/todos/todo_entity.dart';

abstract class TodosDataSource {

  Future<void> addNewTodo(TodoModel todo);
  Future<TodoModel> deleteTodo(TodoModel todo);
  Stream<List<TodoModel>> todos();
  Future<TodoModel> updateTodo(TodoModel todo);
  

}

class TodosDataSourceImpl implements TodosDataSource {

  final todoCollection = Firestore.instance.collection('todos');

  @override
  Future<void> addNewTodo(TodoModel todo) {
      return todoCollection.add(todo.toEntity().toDocument());
    }
  
    @override
    Future<TodoModel> deleteTodo(TodoModel todo) {
      // TODO: implement deleteTodo
      throw UnimplementedError();
    }
  
    @override
    Stream<List<TodoModel>> todos() {
      return todoCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => TodoModel.fromEntity(TodoEntity.fromSnapshot(doc)))
          .toList();
    });
    }
  
    @override
    Future<TodoModel> updateTodo(TodoModel todo) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }

}