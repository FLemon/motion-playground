class Main < MainView
  attr_accessor :menuTable

  def initialize
    @menuTable = MenuTable.new(['Twits', 'Blogs'])
  end
end
