class Relationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :honey, class_name: 'User'

  validates :user, presence: true
  validates :honey, presence: :true

  after_create :create_inverse_relationship

  private

  def create_inverse_relationship
    # reverse_relationship = Relationship.new(user_id: honey_id, honey_id: user_id)
    # reverse_relationship.skip_callback(:create)
    # reverse_relationship.save!
    ActiveRecord::Base.connection.execute("INSERT INTO relationships (user_id, honey_id)
VALUES (#{honey_id}, #{user_id})")
  end
end