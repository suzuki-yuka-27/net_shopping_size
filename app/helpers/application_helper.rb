module ApplicationHelper
  def default_meta_tags
    {
      site: t('defaults.service_name'),
      title: t('defaults.title'),
      reverse: false,
      separator: '|',
      description: t('defaults.description'),
      keywords: t('defaults.service_name'),
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('favicon.png') },
        { href: image_url('ogp_image.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: t('defaults.service_name'),
        title: t('defaults.title'),
        description: t('defaults.description'), 
        type: 'website',
        url: request.original_url,
        image: image_url('ogp_image.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
        site: '@cloth_size',
        title: t('defaults.title'),
        separator: '|',
        description: t('defaults.description'),
        image_url: image_url('ogp_image.png'),
      }
    }
  end
end
