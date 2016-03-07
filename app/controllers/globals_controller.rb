class GlobalsController < ApplicationController

	skip_before_action :verify_authenticity_token, only:[:counties]

	def index
		@state_counties = StateCount.all
	end

	def result
		min_fico = 300
		max_fico = 850
		min_fico = params[:min_fico].to_i if params[:min_fico].present? and params[:min_fico].to_i >= min_fico and params[:min_fico].to_i <= max_fico
		max_fico = params[:max_fico].to_i if params[:max_fico].present? and params[:max_fico].to_i >= min_fico and params[:max_fico].to_i <= max_fico
		@result = Datum.all
		@result = @result.where("lower(type_product) in (?)", params[:type_product].map(&:downcase)) if params[:type_product] and params[:type_product].count > 0
		@result = @result.where("lower(purpose) in (?)", params[:purpose].map(&:downcase)) if params[:purpose] and params[:purpose].count > 0
		@result = @result.where("lower(census_tract) in (?)", params[:census_tract].map(&:downcase)) if params[:census_tract] and params[:census_tract].count > 0
		@result = @result.where("lower(income_level) in (?)", params[:income_level].map(&:downcase)) if params[:income_level] and params[:income_level].count > 0
		@result = @result.where("lower(state) in (?)", params[:state].map(&:downcase)) if not params[:county] and params[:state] and params[:state].count > 0
		@result = @result.where("lower(county) in (?)", params[:county].map(&:downcase)) if params[:county] and params[:county].count > 0
		@result = @result.where("fico >= ? and fico <= ?", min_fico,  max_fico)
	end

	def result_get
		redirect_to index_path
	end

	def counties
		render json: StateCount.where(state: params[:states]).pluck(:county)				
	end

	def no_result
	end

	def import_file
	end

	def upload_file
		return redirect_to import_file_path, alert: "File is required." unless params[:file].present?
		Datum.import(params[:file])
		redirect_to import_file_path, notice: "File imported."
	end
end
