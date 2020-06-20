import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:requisicoes_http/post.dart';

void main() async {
  /* var posts = await metodoGetLista(usuarioId: 2);
  if (posts.isNotEmpty) {
    print(posts[0]);
  } */
  /* var post = await metodoGet(6);
  print(post); */

  /* var novoPost = Post(
      usuarioId: 2,
      conteudo: 'Meu primeiro post! É mto lindo!',
      titulo: 'Meu primeiro post');
  novoPost = await metodoPost(novoPost);
  print(novoPost); */

  /* var novoPostAlterar = Post(
      id: 12,
      usuarioId: 2,
      conteudo: 'Meu primeiro post! É mto lindo!',
      titulo: 'Meu primeiro post');
  novoPostAlterar = await metodoPut(novoPostAlterar);
  print(novoPostAlterar); */

  await metodoDelete(12);
}

Future<List<Post>> metodoGetLista({int usuarioId}) async {
  var dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
  var resposta = await dio.get('/posts',
      queryParameters: usuarioId != null ? {'userId': usuarioId} : null);
  var retorno = <Post>[];
  if (resposta.statusCode >= 200 && resposta.statusCode < 300) {
    List lista = resposta.data;
    lista.forEach((item) => retorno.add(Post.apartirDoMap(item)));
  } else {
    print(resposta.statusMessage);
  }
  return retorno;
}

Future<Post> metodoGet(int id) async {
  var dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
  var resposta = await dio.get('/posts/$id');
  Post retorno;
  if (resposta.statusCode >= 200 && resposta.statusCode < 300) {
    retorno = Post.apartirDoMap(resposta.data);
  } else {
    print(resposta.statusMessage);
  }
  return retorno;
}

Future<Post> metodoPost(Post post) async {
  var dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
  var dados = jsonEncode(post.toMap());
  var resposta = await dio.post('/posts', data: dados);
  Post retorno;
  if (resposta.statusCode >= 200 && resposta.statusCode < 300) {
    retorno = Post.apartirDoMap(resposta.data);
  } else {
    print(resposta.statusMessage);
  }
  return retorno;
}

Future<Post> metodoPut(Post post) async {
  var dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
  var dados = jsonEncode(post.toMap());
  var resposta = await dio.put('/posts/${post.id}', data: dados);
  Post retorno;
  if (resposta.statusCode >= 200 && resposta.statusCode < 300) {
    retorno = Post.apartirDoMap(resposta.data);
  } else {
    print(resposta.statusMessage);
  }
  return retorno;
}

Future<void> metodoDelete(int id) async {
  var dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
  var resposta = await dio.delete('/posts/$id');
  if (resposta.statusCode >= 300 && resposta.statusCode < 200) {
    print(resposta.statusMessage);
  }
}
