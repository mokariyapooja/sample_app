def full_title(page_title)
	bace_title="Ruby On Rails Tutorial Sample App"
	if page_title.empty?
		bace_title
	else
        "#{page_title} | #{bace_title}"
 	end
 end