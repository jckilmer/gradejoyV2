require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe "#index" do
    it "responds with 200" do
      log_in_user
      expect(subject.current_user).to_not be_nil
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "#show" do
    let(:course) { create(:course) }
    it "responds with 200" do
      log_in_user
      expect(subject.current_user).to_not be_nil
      get :show, id: course.id
      expect(response.status).to eq(200)
    end
  end

  describe "#new" do
    it "responds with 200" do
      log_in_user
      expect(subject.current_user).to_not be_nil
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "#edit" do
    let(:course) { create(:course) }
    it "responds with 200" do
      log_in_user
      expect(subject.current_user).to_not be_nil
      get :edit, id: course.id
      expect(response.status).to eq(200)
    end
  end
end
