require 'rexml/document'

xmlfile = File.new "public/publicaciones.xml"
xmldoc = REXML::Document.new xmlfile

hashtag = "#prueba1"

final = ""
each_post = REXML::XPath.each xmldoc, "//publicacion"

loop do
  iterator = each_post.next.to_s
  it = REXML::Document.new iterator
  it.elements.each("publicacion/hashtags/hashtag"){ |tag|
    if hashtag.eql? tag.text
      final = final + iterator.to_s + "\n"
    end
  }
end
puts final
