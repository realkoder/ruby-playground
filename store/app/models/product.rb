class Product < ApplicationRecord
  validates :name, presence: true
  after_destroy :log_after_destroy
  
  private

  def log_after_destroy
    puts "Ohhhh you destroyed ID: #{id}!"
  end
end
