import 'package:flutter/cupertino.dart';
import 'package:todosTDD/features/todosTDD/data/datasources/todos_datasource.dart';
import 'package:todosTDD/features/todosTDD/domain/entities/todos/todo_entity.dart';
import 'package:todosTDD/features/todosTDD/data/models/todos/todo.dart';
import 'package:todosTDD/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:todosTDD/features/todosTDD/domain/repositories/todos/todos_repository.dart';

class TodosRepositoryImpl implements TodosRepository {

  final TodosDataSource todosDataSource;

  TodosRepositoryImpl({@required this.todosDataSource});
  
  
  @override
  Future<Either<Failure, void>> addNewTodo(TodoModel todo) async{
      return Right(todosDataSource.addNewTodo(todo));
    }
  
    @override
    Future<Either<Failure, TodoEntity>> deleteTodo(TodoModel todo) {
      // TODO: implement deleteTodo
      throw UnimplementedError();
    }
  
    @override
    Either<Failure, Stream<List<TodoModel>>> todos(){
      return Right(todosDataSource.todos());
    }
  
    @override
    Future<Either<Failure, TodoEntity>> updateTodo(TodoModel todo) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }

}