class User < ActiveRecord::Base

  has_many :created_tasks, class_name: 'Task', foreign_key: 'user_id'
  has_many :assigned_tasks, class_name: 'Task', foreign_key: 'assigned_user_id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
