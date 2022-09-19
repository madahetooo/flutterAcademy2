import 'package:flutter/material.dart';
import 'package:flutter_course/todolistapp/repository/local/database_helper.dart';

class TodoListApp extends StatefulWidget {
  const TodoListApp({Key? key}) : super(key: key);

  @override
  State<TodoListApp> createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  final dbhelper = DatabaseHelper.instance;
  TextEditingController todoController = TextEditingController();
  bool validated = true;
  String errorMessage = "";
  String todoEdited = "";
  List<Widget> children = [];
  var myTodos = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snap) {
        if (snap.hasData == null) {
          return Center(
            child: Text(" NO DATA AVAILABLE"),
          );
        } else {
          if (myTodos.length == 0) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "My Tasks",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: showAlertDialog,
                child: Icon(Icons.add),
                backgroundColor: Colors.pinkAccent,
              ),
              body: const Center(
                child: Text(
                  "No Tasks Available",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: Colors.grey[200],
              appBar: AppBar(
                title: const Text(
                  "My Tasks",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: children,
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: showAlertDialog,
                child: Icon(Icons.add),
                backgroundColor: Colors.pinkAccent,
              ),
            );
          }
        }
      },
      future: query(),
    );
  }

  void showAlertDialog() {
    todoController.text = "";
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: const Text("Add a Task"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: todoController,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      todoEdited = value;
                    },
                    decoration: InputDecoration(
                      errorText: validated ? null : errorMessage,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {
                      if (todoController.text.isEmpty) {
                        setState(() {
                          errorMessage = "Can't be empty";
                          validated = false;
                        });
                      } else if (todoController.text.length > 200) {
                        setState(() {
                          errorMessage = "Too many characters";
                          validated = false;
                        });
                      } else {
                        // AddTodo
                        addTodo();
                      }
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    color: Colors.pinkAccent,
                  ),
                ],
              ),
            );
          });
        });
  }

  void addTodo() async {
    Map<String, dynamic> todo = {
      DatabaseHelper.columnName: todoEdited,
    };
    final id = await dbhelper.insert(todo);
    print(id);
    Navigator.of(context, rootNavigator: true).pop();
    todoEdited = "";
    setState(() {
      validated = true;
      errorMessage = "";
    });
  }

  Future<bool> query() async {
    myTodos = [];
    children = [];
    var allTodos = await dbhelper.queryAllTodos();
    allTodos?.forEach((todo) {
      myTodos.add(todo.toString());
      children.add(
        Card(
          elevation: 5.0,
          child: Container(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              title: Text(
                todo['todo'],
                style: TextStyle(fontSize: 18),
              ),
              onLongPress: () {
                dbhelper.delete(todo['id']);
                setState(() {});
              },
            ),
          ),
        ),
      );
    });
    return Future.value(true);
  }
}
