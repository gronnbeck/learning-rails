class Product < ActiveRecord::Base

  has_many :line_items
  has_many :orders, through: :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  validates_uniqueness_of :title
  validates :image_url, allow_blank: true, format: {
      with:     %r{\.(gif|png|jpg)$}i,
      message:  'must be a URL for GIF, PNG or JPG image.'
  }


  private

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      true
    else
      errors.add(:base, 'Line Items present')
      false
    end
  end
end
