xml.instruct! :xml, version: "1.0"
xml.rss(version: "2.0"){
  xml.channel{
    xml.title "#{Setting.app_name} - #{t('plugin.press')}"
    xml.link posts_url
    xml.description "#{Setting.app_name} - #{t('plugin.press')}"
    xml.language('zh-CN')
      for post in @posts
        xml.item do
          xml.title post.title
          xml.description markdown(post.body)
          xml.author post.user&.login
          xml.pubDate(post.created_at.strftime("%a, %d %b %Y %H:%M:%S %z"))
          xml.link post_url(post)
          xml.guid post_url(post)
        end
      end
  }
}
