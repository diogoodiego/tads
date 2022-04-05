using System;
using System.Collections.Generic;

class NUser{
  private List<User> users = new List<User>();

  public List<User> Listar(){
    // Retorna uma lista com os usuarios cadastrados 
    return users;
  }

  public User Listar(int id){
    // Localiza na list o usuario com o id informado
    for(int i = 0;i < users.Count;i++){
      if(user[i].Id == id) return users[i];
    }
    return null;
  }

  public void Inserir(User u){
    // Gera o id do usuario
    int max = 0;
    foreach(User obj in users){
      if(obj.Id > max) max = obj.Id;
    }
    u.Id =  max + 1;
    // Inserir usuario na lista
    users.Add(u);
  }

  public void Atualizar(User u){
    // Localizar na lista o usuario com o id informado
    User user_atual = Listar(u.Id);
    // Se não encontrar o usuario com o id informado, retorna sem alterar
    if (user_atual == null) return;
    // Alterar os dados do usuário
    user_atual.Nome = u.Nome;
  }

  public void Excluir(User u){
    // Remover o usuário da lista
    if(u != null) users.Remove(u);
  }
}