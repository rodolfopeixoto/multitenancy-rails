class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        format.html { redirect_to root_path, notice: 'Company criada com sucesso.' }
      else
        format.html { render :new, error: 'Não foi possível criar a Company' }
      end
    end
  end

  def show
    @company = Company.find_by(subdomain: request.subdomain)
    @employees = Employee.all
    @empoyee = Employee.new
  end

  private

    def company_params
      params.require(:company).permit(:name, :description, :subdomain)
    end
end
