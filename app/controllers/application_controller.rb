class ApplicationController < ActionController::Base
  def blank_square_form

    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    # params = {"elephant"=>"42"}

    @num = params.fetch("elephant").to_f

    @square_of_num = @num ** 2

    render({ :template => "calculation_templates/square_results.html.erb"})
  end

  def calculate_random

    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)


    render({ :template => "calculation_templates/rand_results.html.erb"})
  end

  def blank_random_form

    render({ :template => "calculation_templates/rand_form.html.erb"})
  end

  def blank_square_root_form

    render({ :template => "calculation_templates/square_root_form.html.erb"})
  end

  def calculate_square_root

    @num = params.fetch("number").to_f
    @result = @num ** 0.5

    render({ :template => "calculation_templates/square_root_results.html.erb"})
  end
  
  def blank_payment_form

    render({ :template => "calculation_templates/payment_form.html.erb"})
  end

#def calculate_payment

#@user_apr = params.fetch("user_min").to_f
#@user_years = params.fetch("user_max").to_f
#@user_principal = params.fetch("user_max").to_f
#@result = rand(@lower..@upper)

#render({ :template => "calculation_templates/payment_results.html.erb"})
  #end

  def calculate_payment
    @user_apr = params[:user_apr].to_f
    @user_years = params[:user_years].to_i
    @user_principal = params[:user_principal].to_f

    monthly_interest_rate = @user_apr / 1200
    num_payments = @user_years * 12
    @result = (@user_principal * monthly_interest_rate) / (1 - (1 + monthly_interest_rate)**-num_payments)

    render({ :template => "calculation_templates/payment_results.html.erb"})
  end
end
