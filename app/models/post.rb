class Post < ActiveRecord::Base
  before_save :default_values, on: :create

  private

  def default_values
    self.date ||= Date.today
  end
end
