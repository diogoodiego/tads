using System;

class User{
  // Propriedades do usuário
  public int Id {get;set;}
  public string Nome{get;set;}


  public override string ToString(){
    return ID + "-" + Nome;
  }
}