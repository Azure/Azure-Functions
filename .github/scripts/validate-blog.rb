require "cgi"
require "jekyll"

source = File.expand_path("../../docs", __dir__)
destination = File.expand_path(ARGV.fetch(0, File.join(source, "_site")))

abort "Blog articles belong in docs/_posts/, not docs/_drafts/." if Dir.exist?(File.join(source, "_drafts"))

site = Jekyll::Site.new(Jekyll.configuration(
  "source" => source,
  "destination" => destination,
  "quiet" => true
))
site.read

source_files = Dir.glob(File.join(source, "_posts", "**", "*")).select { |path| File.file?(path) }
published_files = site.posts.docs.map { |post| File.expand_path(post.path) }
missing_posts = source_files - published_files
unless missing_posts.empty?
  abort "Jekyll excluded these articles: #{missing_posts.join(', ')}. " \
    "Use YYYY-MM-DD-title.md filenames with a current or past date and do not set published: false."
end

topics = site.config.fetch("blog_topics")
reserved_tags = topics.map { |topic| topic.fetch("tag") }
home_path = File.join(destination, "index.html")
abort "Build the blog before validating: #{home_path} does not exist." unless File.file?(home_path)
home = File.read(home_path)
baseurl = site.config.fetch("baseurl", "")

topics.each do |topic|
  url = topic.fetch("url")
  archive_path = File.join(destination, url.sub(%r{\A/}, ""), "index.html")
  abort "Missing topic archive: #{archive_path}" unless File.file?(archive_path)
  unless home.include?(%{href="#{CGI.escapeHTML(baseurl + url)}"})
    abort "The homepage is missing the #{topic.fetch('title')} tab."
  end
end

site.posts.docs.each do |post|
  matching_topics = topics.select { |topic| Array(post.data["tags"]).include?(topic.fetch("tag")) }
  if matching_topics.empty?
    abort "#{post.relative_path}: add at least one reserved tag: #{reserved_tags.join(', ')}."
  end

  abort "Missing rendered article: #{post.relative_path}" unless File.file?(post.destination(destination))
  link = %{href="#{CGI.escapeHTML(baseurl + post.url)}"}
  abort "The homepage does not list #{post.relative_path}." unless home.include?(link)

  topics.each do |topic|
    archive_path = File.join(destination, topic.fetch("url").sub(%r{\A/}, ""), "index.html")
    listed = File.read(archive_path).include?(link)
    tagged = matching_topics.include?(topic)
    abort "#{post.relative_path}: incorrect listing in #{topic.fetch('title')}." unless listed == tagged
  end
end

puts "Verified #{site.posts.docs.length} published articles and #{topics.length} topic archives."
