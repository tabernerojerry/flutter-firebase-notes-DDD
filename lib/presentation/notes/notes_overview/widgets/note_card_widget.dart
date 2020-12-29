import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';
import 'package:notes_firebase_ddd/application/notes/note_actor/note_actor_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_firebase_ddd/domain/notes/note.dart';
import 'package:notes_firebase_ddd/domain/notes/todo_item.dart';
import 'package:notes_firebase_ddd/presentation/routes/router.gr.dart';

class NoteCardWidget extends StatelessWidget {
  final Note note;

  const NoteCardWidget({
    Key key,
    @required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: note.color.getOrCrash(),
      child: InkWell(
        onTap: () {
          ExtendedNavigator.of(context).pushNoteFormPage(editNote: note);
        },
        onLongPress: () {
          final noteActorBloc = context.read<NoteActorBloc>();
          _showDeleteDialog(context, noteActorBloc);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                note.body.getOrCrash(),
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              if (note.todos.length > 0) ...[
                const SizedBox(height: 4.0),
                Wrap(
                  spacing: 8.0,
                  children: <Widget>[
                    ...note.todos
                        .getOrCrash()
                        .map(
                          (todoItem) => TodoDisplay(
                            todoItem: todoItem,
                          ),
                        )
                        .iter,
                  ],
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, NoteActorBloc noteActorBloc) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selected Note:'),
          content: Text(
            note.body.getOrCrash(),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('CANCEL'),
            ),
            FlatButton(
              onPressed: () {
                noteActorBloc.add(NoteActorEvent.deleted(note));
                Navigator.pop(context);
              },
              child: const Text('DELETE'),
            ),
          ],
        );
      },
    );
  }
}

class TodoDisplay extends StatelessWidget {
  final TodoItem todoItem;

  const TodoDisplay({
    Key key,
    @required this.todoItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (todoItem.done)
          Icon(
            Icons.check_box_outlined,
            color: Theme.of(context).accentColor,
          ),
        if (!todoItem.done)
          Icon(
            Icons.check_box_outline_blank,
            color: Theme.of(context).disabledColor,
          ),
        Text(
          todoItem.name.getOrCrash(),
        ),
      ],
    );
  }
}
