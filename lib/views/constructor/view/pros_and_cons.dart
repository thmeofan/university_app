import 'package:flutter/material.dart';

class ProsAndConsScreen extends StatefulWidget {
  @override
  _ProsAndConsScreenState createState() => _ProsAndConsScreenState();
}

class _ProsAndConsScreenState extends State<ProsAndConsScreen> {
  List<TextEditingController> _prosControllers = [TextEditingController()];
  List<TextEditingController> _consControllers = [TextEditingController()];

  void _addNewTextField(List<TextEditingController> controllers) {
    setState(() {
      controllers.add(TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pros and Cons'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text('Pros:'),
            ..._prosControllers.map((controller) {
              return TextField(controller: controller);
            }).toList(),
            TextButton(
              onPressed: () => _addNewTextField(_prosControllers),
              child: Text('Add Pro'),
            ),
            SizedBox(height: 30),
            Text('Cons:'),
            ..._consControllers.map((controller) {
              return TextField(controller: controller);
            }).toList(),
            TextButton(
              onPressed: () => _addNewTextField(_consControllers),
              child: Text('Add Con'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Next'),
              onPressed: () {
                widget.universityInfo.pros = _prosControllers
                    .map((controller) => controller.text)
                    .toList();
                widget.universityInfo.cons = _consControllers
                    .map((controller) => controller.text)
                    .toList();
                widget.onSave(widget.universityInfo);
              },
            ),
          ],
        ),
      ),
    );
  }
}
