class RefinedEntriesController < ApplicationController
  def index
    @entries = RefinedEntry.all
    respond_to do |format|
      format.html
      format.csv { send_data @entries.to_csv, filename: "luxury_data-#{Date.today}.csv" }
    end
  end
end
