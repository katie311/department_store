class DepartmentsController < ApplicationController
  before_action :set_department, except: [:index, :new, :create]
  
  def index
    # GET -
    @departments = Department.all
  end

  def show
    #GET
  end

  def new
    #GET
    @department = Department.new
    render partial: "form"
  end

  def create
  #POST
    @department = Department.new(department_params)
    if @department.save
      redirect_to departments_path
    else
      render partial: "form"  
    end
  end

  def edit
  #GET
  render partial: "form"
  end

  def update
  #PUT
    if @department.update(department_params)
      redirect_to department_path
    else 
      render :edit
    end
  end

  def destroy
    #DELETE
    @department.destroy
    redirect_to departments_path
  end



private 
  def department_params
    params.require(:department).permit(:name)
  end

  def set_department
    @department = Department.find(params[:id])
  end
end
