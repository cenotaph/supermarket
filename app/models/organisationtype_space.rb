# frozen_string_literal: true

class OrganisationtypeSpace < ActiveRecord::Base
  belongs_to :organisationtype
  belongs_to :space
end
