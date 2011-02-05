Factory.define :link do |l|
  l.url 'example.com'
  l.association :user
end

Factory.define :invalid_link, :class => Link do |l|
  l.url
end
