# frozen_string_literal: true

class Admin::PnpsController < Admin::BaseController
  has_scope :by_year
  handles_sortable_columns
  def index
    order = sortable_column_order do |column, direction|
      case column
      when 'id'
        "id #{direction}"
      when 'name'
        "LOWER(name) #{direction}"
      when 'organisation'
        "organisation #{direction}"
      when 'year'
        "years.year #{direction}"
      else
        'years.year DESC, lower(name)'
      end
    end
    @year_scope = params[:by_year] if params[:by_year]
    @pnps = apply_scopes(Pnp).includes(:year).order(order).page(params[:page]).per(150)
  end

  def show
    @pnp = Pnp.find(params[:id])
  end
end
