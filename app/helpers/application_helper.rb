module ApplicationHelper
  def title(str)
    main = Robotics::Application.config.page_title
    str.blank? ? main : "#{str} | #{main}"
  end

  def m(str)
    return "" if str.blank?
    RDiscount.new(str, :smart, :autolink).to_html.html_safe
  end

  def sub_menu_link(page)
    if page.external_link.blank?
      link_to page.title, page_path(page)
    else
      options = {}
      options[:target] = "_blank" unless page.external_link[0] == "/"
      link_to page.title, page.external_link, options
    end
  end

  def query(hash)
    request.query_string.split("&").inject({}) { |hash, pair|
      key, value = pair.split("=")
      hash.merge(key.to_sym => value)
    }.merge(hash).inject("?") { |str, pair| str + "#{pair[0].to_s}=#{pair[1]}&" }[0..-2]
  end
end
