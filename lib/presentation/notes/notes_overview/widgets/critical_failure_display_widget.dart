import 'package:flutter/material.dart';
import 'package:notes_firebase_ddd/domain/notes/note_failure.dart';

class CriticalFailureDisplayWidget extends StatelessWidget {
  final NoteFailure noteFailure;

  const CriticalFailureDisplayWidget({
    Key key,
    @required this.noteFailure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            'Oooooops!',
            style: TextStyle(fontSize: 32.0),
          ),
          Text(
            noteFailure.maybeMap(
                insufficientPermission: (_) => 'Insufficient permissions',
                orElse: () => 'Unexpected error. \nPlease, context support.'),
            style: const TextStyle(
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: () {
              print('Sending Email...');
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Icon(Icons.mail_outline),
                SizedBox(height: 4.0),
                Text('I Need Help'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
