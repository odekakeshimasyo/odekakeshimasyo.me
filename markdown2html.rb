require 'redcarpet'
require 'yaml'
require 'uri'
require 'pp'

#
$metadata_reg = "\\A^---\\n([\\s\\S]*?)^---\\n"


#
#  yaml + markdown => {:content_html => , :title => ..}
#
def parse(file_text)
	ret = Hash.new('')
	
	markdown_text = /#{$metadata_reg}/ =~ file_text ? file_text.gsub(/#{$metadata_reg}/, '') : file_text
	ret[:content_html] = Redcarpet::Markdown.new(
					Redcarpet::Render::HTML.new(
						hard_wrap: true, 
						link_attributes:{target: '_blank', rel: 'nofollow'}
						),
					tables: true, 
					no_intra_emphasis: true, 
					fenced_code_blocks: true, 
					autolink: true
				).render(markdown_text)
				.gsub(/\ \ \ \ /, "\t")
				.gsub(/<br>/, '<br/>')
				.gsub(/^br$/, '<br/>')
	
	metadata_text = /#{$metadata_reg}/ =~ file_text ? file_text.match(/#{$metadata_reg}/)[1] : nil
	metadata_text.gsub(/^([^:]+:){2}/, '$&\&\#058;')
	YAML.load(metadata_text).each{|key, value|
		ret[:"#{key.downcase}"] = value.to_s
	}
	return ret
end



#
# メニューHTML作成
#
nav = {}
Dir::glob(Dir.pwd + '/*.md')
		.delete_if{|filepath| filepath.rindex('/index.md') || filepath =~ /\/[0-9]*.md/}
		.each{|filepath|
	current_md = parse(File.open(filepath, 'r').read)
	nav[current_md[:title]] = File.basename(filepath, '.md') + '.html';
}

nav_html = ''
nav.sort_by{|key,value| key.to_s}.each{|title, path|
	nav_html += "<li><a href=\"/#{path}\">#{title}</a></li>"
}


#
# template.htmlからHTMLファイル生成
#
target_md = parse(ARGF.read)
filename = File.basename(ARGF.filename, '.md') + '.html'
head_title = target_md[:title] != 'index' ? target_md[:title] + ' | odekakeshimasyo.me' : '';
output_html = File.open(Dir.pwd + '/template.html', 'r').read
	.gsub(/{{{url}}}/, filename)
	.gsub(/{{{url.urlescape}}}/, URI.escape('https://odekakeshimasyo.me/' + filename))
	.gsub(/{{{nav}}}/, nav_html)
	.gsub(/{{{head.title}}}/, head_title)
	.gsub(/{{{head.title.urlescape}}}/, URI.escape(head_title))
	.gsub(/{{{title}}}/, target_md[:title])
	.gsub(/{{{content}}}/, target_md[:content_html])
	.gsub(/{{{meta.keywords}}}/, target_md['meta.keywords'.to_sym])
	
puts output_html


