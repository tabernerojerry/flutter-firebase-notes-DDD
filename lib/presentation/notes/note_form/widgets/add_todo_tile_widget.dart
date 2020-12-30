import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:notes_firebase_ddd/application/notes/note_form/note_form_bloc.dart';
import 'package:notes_firebase_ddd/presentation/notes/note_form/miscellaneous/todo_item_presentation_classes.dart';
import 'package:notes_firebase_ddd/presentation/notes/note_form/miscellaneous/build_context_x.dart';

class AddTodoTileWidget extends StatelessWidget {
  const AddTodoTileWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteFormBloc, NoteFormState>(
      listenWhen: (previousState, currentState) =>
          previousState.isEditing != currentState.isEditing,
      listener: (context, state) {
        context.formTodos = state.note.todos.value.fold(
          (_) => listOf<TodoItemPrimitive>(),
          (todoItemList) => todoItemList.map(
            (todoItem) => TodoItemPrimitive.fromDomain(todoItem),
          ),
        );
      },
      buildWhen: (previousState, currentState) =>
          previousState.note.todos.isFull != currentState.note.todos.isFull,
      builder: (context, state) {
        return ListTile(
          enabled: !state.note.todos.isFull,
          title: const Text('Add Todo'),
          leading: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.add),
          ),
          onTap: () {
            context.formTodos =
                context.formTodos.plusElement(TodoItemPrimitive.empty());

            context.read<NoteFormBloc>().add(
                  NoteFormEvent.todosChanged(
                    context.formTodos,
                  ),
                );
          },
        );
      },
    );
  }
}
