import 'package:flutter/material.dart';
import 'package:flutter_app/Conversation.dart';

class _ConversationItem extends StatelessWidget {
  final Conversation conversation;

  const _ConversationItem({Key key, this.conversation})
      : assert(conversation != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("click");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SecondScreen()));
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              conversation.avatar,
              width: 80,
              height: 80,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(conversation.title),
                  Text(conversation.content)
                ],
              ),
            ),
            Text(conversation.time)
          ],
        ),
      ),
    );
  }
}

class ConversationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConversationPageState();
  }
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index.isOdd)
          return new Divider(
            height: 1,
            color: Colors.black12,
          );
        return _ConversationItem(conversation: mockConversations[index]);
      },
      itemCount: mockConversations.length,
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('${this} hashCode=${this.hashCode}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text("Go back"),
            onPressed: () {
              print('This is 2nd page');
              Navigator.pop(context);
            }),
      ),
    );
  }
}
