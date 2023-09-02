import 'package:flutter/material.dart';
import 'package:notes/controller.dart';
import 'package:notes/note_deatils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});
  final controller = NotesController();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await widget.controller.loadnotes();
        setState(() {});
      },
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 5,
        title: const Text(
          "Notes",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NoteDetailScreen(
                  controller: widget.controller,
                  index: widget.controller.notes.length,
                ),
              ),
            );
            setState(() {});
          },
          child: const Icon(
            Icons.add,
            size: 36,
            color: Colors.black,
          )),
      body: SafeArea(
        child: ListView.builder(
          itemCount: widget.controller.notes.length,
          padding: const EdgeInsets.all(15),
          itemBuilder: (ctx, index) {
            final note = widget.controller.notes[index];
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                onTap: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NoteDetailScreen(
                        controller: widget.controller,
                        index: index,
                      ),
                    ),
                  );
                  setState(() {});
                },
                title: Text(
                  note,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                leading: const Icon(
                  Icons.note,
                  size: 36,
                  color: Colors.greenAccent,
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.controller.deleteNote(index);
                    });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                  iconSize: 24,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
