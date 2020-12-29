import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_firebase_ddd/application/notes/note_form/note_form_bloc.dart';
import 'package:notes_firebase_ddd/domain/notes/value_objects.dart';

class ColorFieldWidget extends StatelessWidget {
  const ColorFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteFormBloc, NoteFormState>(
      buildWhen: (previousState, currentState) =>
          previousState.note.color != currentState.note.color,
      builder: (context, state) {
        return Container(
          height: 80.0,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: NoteColor.predefinedColors.length,
            itemBuilder: (context, index) {
              final itemColor = NoteColor.predefinedColors[index];
              return GestureDetector(
                onTap: () {
                  context
                      .read<NoteFormBloc>()
                      .add(NoteFormEvent.colorChanged(itemColor));
                },
                child: Material(
                  color: itemColor,
                  elevation: 4,
                  shape: CircleBorder(
                    side: state.note.color.value.fold(
                        (_) => BorderSide.none,
                        (color) => color == itemColor
                            ? const BorderSide(width: 1.5)
                            : BorderSide.none),
                  ),
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 12.0,
              );
            },
          ),
        );
      },
    );
  }
}
