module ApplicationHelper
  #current_user will be used for future refrence to logged in user
  private
    def current_user
      if session[:user_id] 
        @current_user ||= User.find(session[:user_id])
      end
    end
    def laytehcarpet(text)
      renderer = Redcarpet::Render::HTML.new(no_links: true, hard_wrap: true, filter_html: true)
      markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true)
      markdown.render(text).html_safe
    end
end
