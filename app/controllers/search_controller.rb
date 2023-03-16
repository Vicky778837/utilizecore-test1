# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @parcels = if params[:search].present?
                 Parcel.search_by_parcel_number(params[:search])
               else
                 []
               end
  end
end
