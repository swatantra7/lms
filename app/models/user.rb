class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  belongs_to :role

  delegate :name, to: :role, allow_nil: true, prefix: true


  def librarian?
    self.role_name == 'Librarian'
  end

end
