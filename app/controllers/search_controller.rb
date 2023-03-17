# frozen_string_literal: true
class SearchController < ApplicationController
   skip_before_action :authenticate_user!
  def index
    @parcels = if params[:search].present?
                 Parcel.search_by_parcel_number(params[:search])
               else
                []
                 end
  end
end
