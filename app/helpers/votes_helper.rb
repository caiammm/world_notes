module VotesHelper

  def vote_button(post)
    if current_user.voted_in?(post)
      link_to(  image_tag( image_path("icones/desvotar.jpg"), class: "vote_img_#{post.id}"),
                unvote_post_path(post), class: "vote_link_#{post.id}", method: :put, remote: true )
    else
      link_to(  image_tag( image_path("icones/votar.png"), class: "vote_img_#{post.id}"),
                vote_post_path(post), class: "vote_link_#{post.id}", method: :put, remote: true )
    end
  end
end
