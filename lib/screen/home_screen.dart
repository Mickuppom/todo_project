import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  Homescreen({Key key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> todos = [];
  TextEditingController input = new TextEditingController();

  void handleAddTolist() {
    setState(() {
      todos.add(input.text);
      input.text = "";
    });
  }

  void handleRemoveTodoFromList(String item) {
    setState(() {
      todos.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Form(
              child: TextFormField(
                controller: input,
                onFieldSubmitted: (s) => handleAddTolist(),
                decoration: InputDecoration(
                  hintText: "Todo lists",
                  border: OutlineInputBorder(),
                  suffixIcon: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 12.0),
                    child: IconButton(
                      onPressed: handleAddTolist,
                      icon: Icon(
                        Icons.list,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Lists:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: todos
                    .map(
                      (item) => Card(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("$item"),
                                IconButton(
                                  onPressed: () {
                                    handleRemoveTodoFromList(item);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
