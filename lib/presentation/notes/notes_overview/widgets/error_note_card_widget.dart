import 'package:flutter/material.dart';

import 'package:notes_firebase_ddd/domain/notes/note.dart';

class ErrorNoteCardWidget extends StatelessWidget {
  final Note note;

  const ErrorNoteCardWidget({
    Key key,
    @required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).errorColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              'Invalid note, please contact support',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyText2
                  .copyWith(fontSize: 18.0),
            ),
            const SizedBox(height: 2.0),
            Text(
              'Details for nerds:',
              style: Theme.of(context).primaryTextTheme.bodyText2,
            ),
            const SizedBox(height: 2.0),
            Text(
              note.failureOption
                  .fold(() => '', (failure) => failure.toString()),
              style: Theme.of(context).primaryTextTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
