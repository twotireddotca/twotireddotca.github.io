# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions


activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end



# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false


#set :source_dir, 'source/day'

set :relative_links, true

set :site_url, ""
# ...

configure :build do
  # Relative assets needed to deploy to Github Pages
  activate :relative_assets
  set :site_url, "/repo-name"
end

#set :css_dir, "stylesheets"
#set :js_dir, "javascripts"

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

page "equipment.html", layout: 'layout'

max = 49
title_collection = []
t_s = []
from_s = []
distance_s = []
dates = []
for i in 1..max
	f = File.open("source/day/#{i}.html.erb")
	lines = f.readlines
	page_title =  lines[1]
	date = lines[2]	
	from = lines[3]
	to = lines[4]
	distance = lines[5]
	title_collection.push(page_title)
	distance_s.push(distance)
	from_s.push(from)
	t_s.push(to)
	dates.push(date)
	page "/day/#{i}.html", layout: 'day_page' , 
		:locals => {:previous_page=>(i==1 ? "home" : (i-1).to_s),
	      		:next_page =>(i==max ? "home" : (i+1).to_s),
			:title => page_title,
			:date => date,
			:from => from,
			:to => to,
			:distance => distance,
			:number=>i}
end

page '/' , :locals => {:day_count=>max,:titles=>title_collection,:distances=>distance_s,:froms=>from_s,:tos=>t_s}




# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end


