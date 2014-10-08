Methodology.types.each do |method|
  Methodology.find_or_create_by(name: method)
end
