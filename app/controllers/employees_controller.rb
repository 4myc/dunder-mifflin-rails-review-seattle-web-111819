class EmployeesController < ApplicationController
  before_action :find_employee, only: [:show, :edit, :update, :destroy]
  
    def index
        @employees = Employee.all
      end
    
      def new
        @employee = Employee.new
      end
    
      def show
        # find_employee
      end
    
      def create
        @employee = Employee.new(employee_params)
    
        if @employee.save
          redirect_to employees_path  #goes to index page
        else
          flash[:message] = @employee.errors.full_messages
          render :new
        end
      end
    
      def edit
        # find_employee
      end
      
      def update
        # find_employee  #find employee by id
    
        if @employee.update(employee_params)
          redirect_to @employee      #employee_path   --> goes to the employee's page
        else
          flash[:message] = @employee.errors.full_messages
          render :edit
        end
      end
    
      def destroy
        # find_employee
        @employee.destroy
        redirect_to employees_path  #goes to index page
      end
    
      private
      
      def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
      end
    
      def find_employee
        @employee = Employee.find(params[:id])
      end
end
