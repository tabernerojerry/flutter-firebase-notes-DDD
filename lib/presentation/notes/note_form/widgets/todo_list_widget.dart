import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kt_dart/collection.dart';
import 'package:notes_firebase_ddd/domain/notes/value_objects.dart';
import 'package:provider/provider.dart';

import 'package:notes_firebase_ddd/application/notes/note_form/note_form_bloc.dart';
import 'package:notes_firebase_ddd/presentation/notes/note_form/miscellaneous/todo_item_presentation_classes.dart';
import 'package:notes_firebase_ddd/presentation/notes/note_form/miscellaneous/build_context_x.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (previousState, currentState) =>
          previousState.note.todos.isFull != currentState.note.todos.isFull,
      listener: (context, state) {
        if (state.note.todos.isFull) {
          FlushbarHelper.createAction(
            message: 'Want longer list? Activate Premium 🤩',
            button: FlatButton(
              onPressed: () {},
              child: const Text(
                'BUY NOW',
                style: TextStyle(
                  color: Colors.yellow,
                ),
              ),
            ),
            duration: const Duration(seconds: 5),
          ).show(context);
        }
      },
      child: Consumer<FormTodos>(
        builder: (context, formTodos, child) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: formTodos.value.size,
            itemBuilder: (context, index) {
              return TodoTile(
                index: index,
                // Set Unique Todo Value key
                key: ValueKey(context.formTodos[index].id),
              );
            },
          );
        },
      ),
    );
  }
}

class TodoTile extends HookWidget {
  final int index;

  const TodoTile({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo = context.formTodos.getOrElse(
      index,
      (_) => TodoItemPrimitive.empty(),
    );

    final textEditingController = useTextEditingController(text: todo.name);

    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.15,
      secondaryActions: [
        IconSlideAction(
          caption: 'Delete',
          icon: Icons.delete_outline,
          color: Colors.red,
          onTap: () {
            context.formTodos = context.formTodos.minusElement(todo);
            context
                .read<NoteFormBloc>()
                .add(NoteFormEvent.todosChanged(context.formTodos));
          },
        ),
      ],
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4,
        ),
        child: ListTile(
          leading: Checkbox(
            value: todo.done,
            onChanged: (value) {
              context.formTodos = context.formTodos.map(
                (listTodo) =>
                    listTodo == todo ? todo.copyWith(done: value) : listTodo,
              );

              context
                  .read<NoteFormBloc>()
                  .add(NoteFormEvent.todosChanged(context.formTodos));
            },
          ),
          title: TextFormField(
            controller: textEditingController,
            decoration: const InputDecoration(
              hintText: 'Todo',
              counterText: '',
              border: InputBorder.none,
            ),
            maxLength: TodoName.maxLength,
            onChanged: (value) {
              context.formTodos = context.formTodos.map(
                (listTodo) =>
                    listTodo == todo ? todo.copyWith(name: value) : listTodo,
              );

              context
                  .read<NoteFormBloc>()
                  .add(NoteFormEvent.todosChanged(context.formTodos));
            },
            validator: (_) {
              return context.read<NoteFormBloc>().state.note.todos.value.fold(
                    // Failure stemming from the TodoList length should NOT be displayed by the individual TextFormFields
                    (_) => null,
                    (todoList) => todoList[index].name.value.fold(
                          (failure) => failure.maybeMap(
                            empty: (_) => 'This field is required',
                            exceedingLength: (_) => 'Too long',
                            multiline: (_) => 'It has to be a single line',
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
                  );
            },
          ),
        ),
      ),
    );
  }
}
