import 'package:app_cadastro/models/user.dart';
import 'package:app_cadastro/provider/users.dart';
import 'package:app_cadastro/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user, {super.key});

  @override
  Widget build(BuildContext context) {

    final avatar = user.avatarUrl == '' || user.avatarUrl.isEmpty
      ? CircleAvatar(child: Icon(Icons.person))
      : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 96,
        child: Row(children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM,
                arguments: user,
              );
            }, 
            color: Colors.orangeAccent,
            icon: Icon(Icons.edit)
          ),

          IconButton(
            onPressed: () {
              showDialog(
                context: context, 
                builder: (ctx) => AlertDialog(
                  title: Text('Excluir Usuário'),
                  content: Text('Deseja mesmo excluir esse usuário?'),
                  actionsAlignment: MainAxisAlignment.spaceAround,
                  actions: <Widget>[
                    FloatingActionButton(
                      child: Text('Não'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }
                    ),
                    FloatingActionButton(
                      child: Text('Sim'),
                      onPressed: () {
                        Provider.of<UsersProvider>(context, listen: false).remove(user);
                        Navigator.of(context).pop();
                      }
                    ),
                  ],
                )
              );
            }, 
            color: Colors.red,
            icon: Icon(Icons.delete)
          )
        ],)
      ),
    );
  }
}