class User < ApplicationRecord
  has_many :order
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # enumerable pour stocker les types d'utilisateurs (choix lors du sign up)
  # /!\ stocké en integer dans bdd donc ds table user: t.integer "user_type"
  enum user_type: %i[artisan customer]

  # on indique en validation du user_type la liste des clés de user_typeS
  validates :user_type, presence: true, inclusion: { in: User.user_types.keys }
end
