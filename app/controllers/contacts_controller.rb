class ContactsController < ApplicationController

  def create
    @contact = Contact.create(contact_params)
    @company = Company.find(params[:company_id])
    redirect_to company_path(@company)
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email)
  end

end