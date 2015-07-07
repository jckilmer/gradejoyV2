require "rails_helper"

RSpec.describe HelpRequestMailer, type: :mailer do
  describe "new_request" do
    let!(:help_request) { create(:help_request) }

    before do
      HelpRequestMailer.new_request(help_request).deliver_now!
    end

    let(:delivered_mail) { Mail::TestMailer.deliveries.last }
    let(:plain_text_mail) { delivered_mail.text_part.decoded }
    let(:html_mail) { delivered_mail.html_part.decoded }

    it "renders the headers" do
      expect(delivered_mail.subject).to eq("New Help Request")
      expect(delivered_mail.to).to eq(["gradejoyhelp@gmail.com"])
      expect(delivered_mail.from).to eq(["gradejoycourier@gradejoy.com"])
    end
  end

end
