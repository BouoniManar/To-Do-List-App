import 'package:flutter/material.dart';

void main() {
  runApp(TodoList());
}

class TodoList extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDo(),
    );
  }
}

class ToDo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyView();
}

class MyView extends State<ToDo>{
  TextEditingController _controller = TextEditingController();

  List<String> _todos =[];

  _AddTolist(){
    if(_controller.text.isNotEmpty){
      setState(() {
        _todos.add(_controller.text);
        _controller.clear();
      });
    }
  }

  DeleteElement(int index){
    setState(() {
    _todos.removeAt(index);
    });
  }

@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(title: Text("To-Do-List"), backgroundColor: Colors.purple,),
    body: Column(
      children: [
        Padding(padding: EdgeInsets.all(16),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: "Enter a Task !",
            border: OutlineInputBorder(),
          ),
        ),
        ),
        Expanded(child: 
         ListView.builder(
          itemCount: _todos.length
          ,itemBuilder: (context, index){
            return ListTile(title: Text(_todos[index],),
            onLongPress: () => DeleteElement(index),
            );
            
          })
          )
       
        
      ],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: _AddTolist,
      child: Icon(Icons.add),
      backgroundColor: Colors.teal,
    ),
  );
}
 
  }

