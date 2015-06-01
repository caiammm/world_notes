module PostsHelper

  def tags
   [["Informática", "Culinária"], ["Profissão", "Automotivo"], ["Conserto", "Games"], ["Educação", "Tecnologia"]]
  end


  def subjects
    {
      INFORMÁTICA: "Informática",
      CULINÁRIA: "Culinária",
      PROFISSÃO: "Profissão",
      AUTOMOTIVOS: "Automotivo",
      CONSERTOS: "Conserto",
      GAMES: "Games",
      EDUCAÇÃO: "Educação",
      TECNOLOGIA: "Tecnologia"
    }
  end
end
