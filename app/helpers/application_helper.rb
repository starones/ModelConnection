module ApplicationHelper
  def devise_error_messages
    return "" if resource.errors.empty?
    html = ""
    # エラーメッセージ用のHTMLを生成
    resource.errors.full_messages.each do |msg|
      html += <<-EOF
        <div class="error_field alert alert-danger " role="alert">
          <div class="error_msg">#{msg}</div>
        </div>
      EOF
    end
    html.html_safe
  end
end
