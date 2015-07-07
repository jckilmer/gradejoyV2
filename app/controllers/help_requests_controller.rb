class HelpRequestsController < ApplicationController
  def new
    @help_request = HelpRequest.new
  end

  def create
    help_request = HelpRequest.new(help_request_params)

    if help_request.save
      HelpRequestMailer.new_request(help_request).deliver_later
      redirect_to help_email_sent_path
    else
      render :new
    end
  end

  def help_email_sent
  end

  private

  def help_request_params
    params.require(:help_request).permit(:email, :message)
  end
end
