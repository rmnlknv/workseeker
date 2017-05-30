class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :city, :email, :password, :password_confirmation, :type, :position, :salary, :city, :experience, :seniority, :category, :english, :expectations, :achievements, :company, :contact_email, :phone)
  end

  def account_update_params
    params.require(:user).permit(:name, :city, :email, :password, :password_confirmation, :current_password, :type, :position, :salary, :city, :experience, :seniority, :category, :english, :expectations, :achievements, :company, :contact_email, :phone)
  end
end
