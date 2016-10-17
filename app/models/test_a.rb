class TestA < ActiveRecord::Base
  belongs_to :singular_b, :class_name => TestB 
  has_many :test_bs
end
