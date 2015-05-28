module ApplicationHelper

  def time_message(object)
    if object.updated_at > object.created_at
      if object.created_at > Time.now.beginning_of_day
        "Edited #{time_ago_in_words(object.created_at)} atrás" # 3 minutes ago, less than a minute ago
      else
        object.created_at.strftime("%b %d, %Y")  # Jun 29, 2012
      end
    else
      if object.created_at > Time.now.beginning_of_day
        "#{time_ago_in_words(object.created_at)} atrás" # 3 minutes ago, less than a minute ago
      else
        object.created_at.strftime("%b %d, %Y")  # Jun 29, 2012
      end
    end
  end
end
