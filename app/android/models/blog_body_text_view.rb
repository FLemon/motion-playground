class BlogBodyTextView
	def initialize(text)
		@text = text
	end

	def outlet=(text_view_outlet)
		@outlet = text_view_outlet
	end

	def text=(text)
		@outlet.text = text
	end
end
