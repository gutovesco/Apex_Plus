import 'package:flutter/material.dart';

class NewPost extends StatefulWidget {
  static String lala = "Lalala";

  @override
  _NewPostState createState() => _NewPostState();
}

Color left = Colors.black;

class _NewPostState extends State<NewPost> {
  String dropdownValue = 'Tecnologia';

  String _radioValue;

  String choice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Post',
          )),
      body: SingleChildScrollView (
        child: Container(
          child: Card(
            elevation: 5,
            child: Column(
              children: <Widget>[
                Text("Teste"),
                Container(
                  width: double.infinity,
                  child: Text("Digite um título para sua publicação: "),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Ex: Como começar a exportar soja?',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Container(
                  width: double.infinity,
                  child: Text("Descreva sua dúvida: "),
                ),
                Container(
                  child: TextFormField(
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText: 'Ex: Qual é o custo para exportar grãos de soja...',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                ),
                Container(
                  width: double.infinity,
                  child: Text("Selecione o tipo da dúvida: "),
                ),
                groupRadio(),
                Container(
                  width: double.infinity,
                  child: Text("Qual é o seu negócio: "),
                ),
                dropDown(),
                Container(
                  width: double.infinity,
                  child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  elevation: 8,
                  color: Color(0xff43B155),
                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 42.0),
                    child: Text(
                      "TÓPICO",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontFamily: "WorkSansBold"),
                    ),
                  ),
                  onPressed: () => _neverSatisfied(),
                ),
                ),
                 topicos()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dropDown() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Tecnologia', 'Agricultura']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case '1':
          choice = value;
          break;
        case '2':
          choice = value;
          break;
        case '3':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }

  Widget groupRadio() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Radio(
              value: '1',
              groupValue: _radioValue,
              onChanged: radioButtonChanges,
            ),
            Text(
              "Importação",
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              value: '2',
              groupValue: _radioValue,
              onChanged: radioButtonChanges,
            ),
            Text(
              "Exportação",
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              value: '3',
              groupValue: _radioValue,
              onChanged: radioButtonChanges,
            ),
            Text(
              "Outros",
            ),
          ],
        ),
       
      ],
    );
  }

  Widget topicos() {
    return SafeArea(
      child: Container(
        child: SafeArea(
          child: Row(
            children: <Widget>[
              topico("Valor"),
              topico("Documentação"),
              topico("Empresas"),
            ],
          ),
        ),
      ),
    );
  }

  Widget topico(String conteudo) {
    return Card(
      child: Row(
        children: <Widget>[
          Text(conteudo),
          Icon(
            Icons.close,
            color: Colors.black,
            size: 22.0,
          )
        ],
      ),
    );
  }

  Future<void> _neverSatisfied() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Rewind and remember'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Digite um título para sua publicação',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                )
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

}
