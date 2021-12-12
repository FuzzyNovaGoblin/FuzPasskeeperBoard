import 'package:flutter/material.dart';
import 'package:fuz_passmng_ui/ffi/phrase_to_serial.dart';

class ItemPage extends StatelessWidget {
  final Map<String, dynamic> data;
  const ItemPage(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['name']),
      ),
      body: ListView(
        children: [
          if (data['login']['username'] != null) FieldDisplay(name: "Username", text: data['login']['username']),
          if (data['login']['password'] != null) FieldDisplay(name: "Password", hidden: true, text: data['login']['password']),
          if (data['fields'] != null)
            ...data['fields']
                .map((d) => FieldDisplay(
                      name: d['name'],
                      text: d['value'],
                      hidden: d['type'] == 1,
                    ))
                .toList(),
        ],
      ),
    );
  }
}

class FieldDisplay extends StatefulWidget {
  final String name;
  final bool hidden;
  final String text;
  const FieldDisplay({Key? key, required this.name, this.hidden = false, required this.text}) : super(key: key);

  @override
  State<FieldDisplay> createState() => _FieldDisplayState();
}

class _FieldDisplayState extends State<FieldDisplay> {
  late bool isHidden;

  @override
  void initState() {
    super.initState();
    isHidden = widget.hidden;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                sendAsKeyboard(widget.text);
              },
              icon: const Icon(Icons.keyboard),
            ),
            Text(widget.name),
            const Spacer(),
            if (!isHidden) Text(widget.text),
            if (widget.hidden) IconButton(onPressed: () => setState(() => isHidden = !isHidden), icon: Icon(Icons.remove_red_eye_outlined))
          ],
        ),
      )),
    );
  }
}
