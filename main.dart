import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  final title = "ListView List";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: new ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: List.generate(choices.length, (index) {
              return Center(
                child: ChoiceCard(
                  choice: choices[index],
                  item: choices[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detail(choice: choices[index])),
                    );
                  },
                ),
              );
            })));
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Real Analayis ', icon: Icons.directions_car),
  const Choice(title: 'Linear Algebra ', icon: Icons.directions_bike),
  const Choice(title: 'Calculus', icon: Icons.directions_boat),
  const Choice(title: 'Ordinary Differential Equations', icon: Icons.directions_bus),
  const Choice(title: 'Group Theory', icon: Icons.directions_railway),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard(
      {Key key,
      this.choice,
      this.onTap,
      @required this.item,
      this.selected: false})
      : super(key: key);

  final Choice choice;
  final VoidCallback onTap;
  final Choice item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline4;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              new Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.topLeft,
                  child: Icon(
                    choice.icon,
                    size: 80.0,
                    color: textStyle.color,
                  )),
              new Expanded(
                  child: new Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.topLeft,
                child: Text(
                  choice.title,
                  style: null,
                  textAlign: TextAlign.left,
                  maxLines: 5,
                ),
              )),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          )),
    );
  }
}

class Detail extends StatelessWidget {
  final Choice choice;
  Detail({this.choice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Column(
        children: <Widget>[
           Image.network(
          'https://i.imgur.com/Cqy6Jar.png',
        ),
      SizedBox(height: 20),
        Image.network(
          'https://i.imgur.com/4jFFXN5.png',
        ),
          SizedBox(height: 20),
        Image.network(
          'https://i.imgur.com/sPIV2GJ.png',
        ),
          Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),
          ),
        ],
      ),
    );
  }
}
