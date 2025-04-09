import 'dart:math';
import 'package:app_cadastro/models/user.dart';


final random = Random();

String getAvatarUrlMen(number) {
  return 'https://randomuser.me/api/portraits/men/$number.jpg';
}

String getAvatarUrlWomen(number) {
  return 'https://randomuser.me/api/portraits/women/$number.jpg';
}

final dummyUsers = {
  '1': User(
    id: '1',
    name: 'Maria Silva',
    email: 'maria@email.com',
    avatarUrl: getAvatarUrlWomen(random.nextInt(100)),
  ),
  '2': User(
    id: '2',
    name: 'Carlos Alberto',
    email: 'carlos@email.com',
    avatarUrl: getAvatarUrlMen(random.nextInt(100)),
  ),
  '3': User(
    id: '3',
    name: 'José Saramago',
    email: 'jose@email.com',
    avatarUrl: getAvatarUrlMen(random.nextInt(100)),
  ),
  '4': User(
    id: '4',
    name: 'Cristiano Gustavo',
    email: 'cristiano@email.com',
    avatarUrl: getAvatarUrlMen(random.nextInt(100)),
  ),
  '5': User(
    id: '5',
    name: 'Jessica Almeida',
    email: 'jessica@email.com',
    avatarUrl: getAvatarUrlWomen(random.nextInt(100)),
  ),
  '6': User(
    id: '6',
    name: 'Natasha Romanov',
    email: 'natasha@email.com',
    avatarUrl: getAvatarUrlWomen(random.nextInt(100)),
  ),
};