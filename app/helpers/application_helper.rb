module ApplicationHelper
  def page_title(page_title = ' ')
    page_title.empty? ? t('defaults.title') : page_title
  end
end
