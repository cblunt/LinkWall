module ApplicationHelper
  def number_to_count(count, singular, options = {})
    options = { :zero => "No" }.merge(options)

    case count 
      when 0 then return "#{options[:zero]} #{singular.pluralize}"
      when 1 then return "#{count} #{singular}"
      else return "#{count} #{singular.pluralize}"
    end
  end
end
