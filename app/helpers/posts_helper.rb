module PostsHelper

  def tags
   [["Informática", "Culinária"], ["Profissão", "Automotivo"], ["Conserto", "Games"], ["Educação", "Tecnologia"]]
  end


  def subjects
    {
      INFORMÁTICA: "informatica",
      CULINÁRIA: "culinaria",
      PROFISSÃO: "profissao",
      AUTOMOTIVOS: "automotivos",
      CONSERTOS: "consertos",
      GAMES: "games",
      EDUCAÇÃO: "educacao",
      TECNOLOGIA: "tecnologia"
    }
  end
end
