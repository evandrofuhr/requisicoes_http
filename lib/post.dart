class Post {
  int usuarioId;
  int id;
  String titulo;
  String conteudo;

  /*
   {
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  },
  */

  Post({this.usuarioId, this.id, this.titulo, this.conteudo});

  Post.apartirDoMap(Map<String, dynamic> map) {
    usuarioId = map['userId'];
    id = map['id'];
    titulo = map['title'];
    conteudo = map['body'];
  }

  Map<String, dynamic> toMap() {
    return {'userId': usuarioId, 'id': id, 'title': titulo, 'body': conteudo};
  }

  @override
  String toString() {
    return 'usuarioId: $usuarioId, id: $id, titulo: $titulo, conteudo: $conteudo';
  }
}
