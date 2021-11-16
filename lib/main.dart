import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
      home : MyApp()
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _State createState()=> _State();
}

enum Gender {female, male}

class _State extends State<MyApp>{
  String _value = 'hello world';
  String title = "Application";
  bool spring = false;
  bool react  = false;
  bool angular = false;
  bool django = false;
  bool as = true;
  Gender? _gender = Gender.male;
    void _onPressed(String value){
      _onSubmit(value);
  }
  void _onChange(String value){
    setState(() {
      _value = "Change: $value";
    });
  }
  void _onSubmit(String value){
    setState(() {
      _value = "Submit: $value";
    });
  }

  Future _selectDate() async{
      DateTime? picked = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1985), lastDate: DateTime(2077));
      if(picked != null) setState(()=> _value = picked.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('name'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Text(_value),
             TextField(
              decoration: const InputDecoration(labelText: 'Nom',hintText: 'taper votre nom',icon: Icon(Icons.people)),
              autocorrect: true,
              autofocus: true,
              keyboardType: TextInputType.text,
              onChanged: _onChange,
              onSubmitted: _onSubmit,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Email',hintText: 'taper votre email',icon: Icon(Icons.email)),
              autocorrect: true,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              onChanged: _onChange,
              onSubmitted: _onSubmit,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Tel',hintText: 'taper votre tel',icon: Icon(Icons.phone)),
              autocorrect: true,
              autofocus: true,
              keyboardType: TextInputType.phone,
              onChanged: _onChange,
              onSubmitted: _onSubmit,
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text('Gender',
                    style: TextStyle(fontSize: 17))),
            ListTile(
              title: const Text("Male"),
              leading: Radio<Gender>(
                value: Gender.male,
                groupValue: _gender,
                onChanged: (Gender? value){
                  setState(() {
                    _gender = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text("Female"),
              leading: Radio<Gender>(
                value: Gender.female,
                groupValue: _gender,
                onChanged: (Gender? value){
                  setState(() {
                    _gender = value;
                  });
                },
              ),
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text('Technologie',
                    style: TextStyle(fontSize: 17))),
            CheckboxListTile(value: spring,
                onChanged:(bool? value){
              setState(() {
                spring = value!;
              });
            },
              title: const Text("Spring"),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(value: react,
              onChanged:(bool? value){
                setState(() {
                  react = value!;
                });
              },
              title: const Text("React"),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(value: django,
              onChanged:(bool? value){
                setState(() {
                  django = value!;
                });
              },
              title: const Text("Django"),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            ElevatedButton(onPressed: _selectDate, child: const Text('date')),
            const Spacer(),
            ElevatedButton(onPressed:() => _onPressed("form submitted"), child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}




