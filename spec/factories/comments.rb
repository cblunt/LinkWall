Factory.define :comment do |c|
  c.body 'Some comment left about the link'
  c.association :link
end
