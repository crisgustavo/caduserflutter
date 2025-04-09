import 'package:app_cadastro/models/user.dart';
import 'package:app_cadastro/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, Object> _formData = {};

  User? _editedUser; 

  void _loadFormData(User? user) {
    _formData['id'] = user?.id ?? '';
    _formData['name'] = user?.name ?? '';
    _formData['email'] = user?.email ?? '';
    _formData['avatarUrl'] = user?.avatarUrl ?? '';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final user = ModalRoute.of(context)?.settings.arguments as User?;

    _loadFormData(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_editedUser == null ? 'Novo Usuário' : 'Editar Usuário'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState!.save();
                Provider.of<UsersProvider>(context, listen: false).put(User(
                  id: _formData['id'].toString(),
                  name: _formData['name'].toString(), 
                  email: _formData['email'].toString(), 
                  avatarUrl: _formData['avatarUrl'].toString())
                );
                Navigator.of(context).pop();
              }
            }, 
            icon: Icon(Icons.save)
          )
        ],
      ),

      body: Padding( 
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'].toString(),
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira um nome';
                  }
                  if (value.length < 3) {
                    return 'Nome inválido';
                  }

                  return null;
                },
                onSaved: (value) => _formData['name'] = value.toString(),
              ),

              TextFormField(
                initialValue: _formData['email'].toString(),
                decoration: InputDecoration(labelText: 'E-mail'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira um e-mail';
                  }
                  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                  if (!emailRegex.hasMatch(value)) {
                    return 'E-mail inválido';
                  }

                  return null;
                },
                onSaved: (value) => _formData['email'] = value.toString()
              ),

              TextFormField(
                initialValue: _formData['avatarUrl'].toString(),
                decoration: InputDecoration( labelText: 'URL do avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value.toString()     
              )
            ],
          ),
        ),
      )
    );
  }
}