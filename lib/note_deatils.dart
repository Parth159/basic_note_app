import 'package:flutter/material.dart';
import 'package:notes/controller.dart';

class NoteDetailScreen extends StatelessWidget {
  NoteDetailScreen({super.key, required this.controller, required this.index});

  final NotesController controller;
  final int index;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (controller.notes.asMap().containsKey(index)) {
      textController.text = controller.notes[index];
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 5,
        title: const Text(
          "Note Details",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          iconSize: 30,
          onPressed: () {
            if (controller.notes.asMap().containsKey(index)) {
              controller.updatenotes(index, textController.text);
            } else {
              if (textController.text.isNotEmpty) {
                controller.addnotes(index, textController.text);
              }
            }
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: TextField(
              autofocus: true,
              controller: textController,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                hintText: 'Write a message',
                filled: true,
              ),
              maxLines: null,
              expands: true,
              keyboardType: TextInputType.multiline,
            ),
          ),
        ],
      ),
    );
  }
}
