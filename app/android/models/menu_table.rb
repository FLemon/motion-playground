class MenuTable
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
    intent = if list.getItemAtPosition(position) == 'Twits'
               Android::Content::Intent.new(@parent, Twit);
             else
               Android::Content::Intent.new(@parent, BlogView);
             end
    @parent.startActivity(intent);
  end

  private

  def setup
    @outlet.onItemClickListener = self
    @outlet.choiceMode = Android::Widget::AbsListView::CHOICE_MODE_SINGLE
    @outlet.adapter = MenuAdapter.new(
      @parent,
      Android::R::Layout::Simple_list_item_1,
      @table_data
    )
  end
end

class MenuAdapter < Android::Widget::ArrayAdapter
  def getView(position, convertView, parent)
    textView = Android::Widget::TextView.new(context)
    textView.text = self.getItem(position)
    textView.setGravity(Android::View::Gravity::CENTER)

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
