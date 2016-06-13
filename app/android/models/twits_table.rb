class TwitsTable
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
    alert = Android::App::AlertDialog.new(@parent, Android::App::AlertDialog::THEME_HOLO_LIGHT)
    alert.setMessage(list.getItemAtPosition(position))
    alert.show
  end

  def reload_with_data(data_array)
    @outlet.adapter.clear
    data_array.map { |t| @outlet.adapter.add(t) }
    @outlet.adapter.notifyDataSetChanged
  end

  private

  def setup
    @outlet.onItemClickListener = self
    @outlet.choiceMode = Android::Widget::AbsListView::CHOICE_MODE_SINGLE
    @outlet.adapter = TwitAdapter.new(
      @parent,
      Android::R::Layout::Simple_list_item_1,
      @table_data.empty? ? ['Fetching...Be patient'] : @table_data
    )
  end
end

class TwitAdapter < Android::Widget::ArrayAdapter
  def getView(position, convertView, parent)
    textView = Android::Widget::TextView.new(context)
    textView.text = self.getItem(position)
    textView.setSingleLine(true)
    textView.setPadding(20,20,20,20)
    textView.setEllipsize(Android::Text::TextUtils::TruncateAt::END)

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
