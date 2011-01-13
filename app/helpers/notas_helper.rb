module NotasHelper
  def collapse_code(text)
    text.gsub(/(?:@@@((?:[^@]+(?:[@]{1,2}?)[^@]*)*|(?:[^@]*))@@@)/m, "<br/> <u class=\"info\" title=\"Aca se cito codigo\"> Code </u><br/>") 
  end
end
