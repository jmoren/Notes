module NotasHelper
  def collapse_code(text)
    text.gsub(/(?:@@@((?:[^@]+(?:[@]{1,2}?)[^@]*)*|(?:[^@]*))@@@)/m, "<br/> <span class=\"info\" title=\"Aca se cito codigo\"> [ Code ] </span><br/>") 
  end
end
