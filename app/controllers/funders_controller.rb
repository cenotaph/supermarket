# frozen_string_literal: true

# funders controller to display supporters
class FundersController < ApplicationController
  def index
    @year = if params[:id]
              Year.find_by(year: params[:id])
            else
              Year.where(reveal_decisions: true).order('year DESC').first
            end

    @allfunders = Fundertype.by_year(@year.year).includes(:funders).to_a.delete_if { |x| x.funders.empty? }.sort_by(&:sort_order).uniq
    @background_image = nil
    set_meta_tags title: 'Funders & supporters ' + @year.year.to_s
    respond_to do |format|
      format.html
      format.json { render json: FunderSerializer.new(@year.funders, include: [:fundertype]).serializable_hash.to_json, status: 200 }
    end
  end
end
