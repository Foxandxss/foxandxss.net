class BlogStatus < ActiveRecord::Base
  before_save :add_sharp
  attr_accessible :color, :name, :blogs

  has_many :blogs

  validates :name, :color, presence: true

  private
    # jPicker saves the color without # and we need it for styling.
    def add_sharp
      unless self.color[0].eql?('#')
        self.color.insert 0, '#'
      end
    end
end
