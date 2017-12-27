class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :current_cart, class_name: "Cart", foreign_key: "current_cart_id"
  has_many :carts

  def set_current_cart
    if current_cart
      current_cart
    else
      new_cart = self.carts.create
      self.current_cart_id = new_cart.id
      save
    end
  end
end
