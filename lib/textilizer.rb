class Textilizer
  def initialize(text)
    @text = text
  end

  def to_html
    RedCloth.new(formatted_text).to_html
  end

  def formatted_text
    @text.gsub(/^<code ?(\w*)>\r?\n(.*)(?:\r?\n)?<\/code>\r?$/m) do |match|
      lang = $1.empty? ? nil : $1
      "<notextile>" + CodeRay.scan($2, lang).html(:line_numbers => :inline, :wrap => :div,:css => :class) + "</notextile>"
    end
  end
end
