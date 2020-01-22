require 'yaml'

def directors_database
	rot13 = -> (s) { s.tr('A-Za-z', 'N-ZA-Mn-za-m') }
  @_db ||= YAML.load(rot13.call(File.open("directors_db").read.to_s))
end

def gross_for_director(director_data)
  total = 0
  index = 0
  
  while index < director_data[:movies].length do
    total += director_data[:movies][index][:worldwide_gross]
  end
  total
end

def directors_totals(nds)
  result = {}
  director_index = 0
  while director_index < nds.size do
    director = nds[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

