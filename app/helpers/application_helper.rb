module ApplicationHelper

  def time_message(object)
    if object.updated_at > object.created_at
      if object.created_at > Time.now.beginning_of_day
        "editado #{time_ago_in_words(object.created_at)} atrás" # 3 minutes ago, less than a minute ago
      else
        l(object.created_at, format: :short)  # Jun 29, 2012
          #l Time.now, format: :short
      end
    else
      if object.created_at > Time.now.beginning_of_day
        "#{time_ago_in_words(object.created_at)} atrás" # 3 minutes ago, less than a minute ago
      else
        l(object.created_at, format: :short)  # Jun 29, 2012
      end
    end
  end
end
