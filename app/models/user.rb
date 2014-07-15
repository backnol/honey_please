class User < ActiveRecord::Base

  has_many :created_tasks, class_name: 'Task'
  has_many :assigned_tasks, class_name: 'Task', foreign_key: 'assigned_user_id'

  has_one :relationship
  has_one :honey, through: :relationship

  has_one :inverse_relationship, :class_name => "Relationship", :foreign_key => "honey_id"
  has_one :inverse_honey, :through => :inverse_relationship, source: :user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
