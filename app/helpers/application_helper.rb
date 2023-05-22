module ApplicationHelper

  def paragraph_to_list(paragraph)
    sentences = paragraph.split(/(?<=\d\.) /) # split by digit followed by dot and space
    list_items = sentences.map { |sentence| "<li>#{sentence}</li>" }
    "<ul>#{list_items.join}</ul>"
  end

end
