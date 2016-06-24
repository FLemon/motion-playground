class BlogsTable
  def initialize(tableData)
    @table_data = tableData
  end

  def outlet=(table_outlet)
    @outlet = table_outlet
    setup
  end

  def parent=(parent)
    @parent = parent
  end

  def onItemClick(list, view, position, id)
    return unless @table_data.respond_to?(:getJSONObject)
    intent = Android::Content::Intent.new(@parent, BlogDetail);
    intent.putExtra('blog_detail', @table_data.getJSONObject(position).toString)
    @parent.startActivity(intent);
  end

  def reload_with_data(data_array)
    @table_data = data_array
    @outlet.adapter.clear

    (0..data_array.length-1).map do |index|
      @outlet.adapter.add(data_array.getJSONObject(index))
    end
    @outlet.adapter.notifyDataSetChanged
  end

  private

  def setup
    @outlet.onItemClickListener = self
    @outlet.choiceMode = Android::Widget::AbsListView::CHOICE_MODE_SINGLE
    @outlet.adapter = BlogAdapter.new(
      @parent,
      Android::R::Layout::Simple_list_item_1,
      @table_data.length == 0 ? ['Fetching...Be patient'] : (0..@table_data.length-1).map { |index| @table_data.getJSONObject(index) }
    )
  end
end

class BlogAdapter < Android::Widget::ArrayAdapter
  def getView(position, convertView, parent)
    textView = Android::Widget::TextView.new(context)
    item = self.getItem(position)

    textView.text = item.respond_to?(:get) ? item.get("title") : item
    textView.setSingleLine(true)
    textView.setPadding(20,20,20,20)
    textView.setEllipsize(Android::Text::TextUtils::TruncateAt::END)
    textView.textSize = 15

    layout = Android::Widget::LinearLayout.new(context)
    layout.addView(
      textView,
      Android::Widget::LinearLayout::LayoutParams.new(
        Android::View::ViewGroup::LayoutParams::MATCH_PARENT,
        Android::View::ViewGroup::LayoutParams::WRAP_CONTENT
      )
    )

    layout
  end
end
