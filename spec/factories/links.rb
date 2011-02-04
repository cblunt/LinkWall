Factory.define :link do |l|
  l.url 'example.com'
end

Factory.define :invalid_link, :class => Link do |l|
  l.url
end
