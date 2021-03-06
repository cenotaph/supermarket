# frozen_string_literal: true

class Page < ActiveRecord::Base
  # include ActsAsTree
  # extend ActsAsTree::Presentation
  resourcify

  translates :title, :body
  accepts_nested_attributes_for :translations, reject_if: proc { |att| att['title'].blank? }
  acts_as_tree
  has_many :page_subsites
  has_many :subsites, through: :page_subsites
  belongs_to :background
  has_many :menus, as: :item

  extend FriendlyId
  friendly_id :name_en, use: %i[finders slugged]

  scope :published, -> { where(published: true) }
  scope :by_subsite, ->(x) { includes(:subsites).where(['subsites.id = ?', x]).references(:subsites) }

  scope :promoted, -> { where(show_on_bottom: true) }

  mount_uploader :postimage, SlidingmenuUploader

  def child_of?(menu)
    menu.self_and_descendants.map(&:item).compact.include?(self)
  end

  def display_name
    name
  end

  def name_en
    title(:en)
  end

  def name
    title
  end
end
