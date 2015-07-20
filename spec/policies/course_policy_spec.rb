require 'rails_helper'

RSpec.describe CoursePolicy, type: :policy do
  subject(:policy) { CoursePolicy }
  let(:current_user) { create(:user) }
  let(:other_user) { create(:user) }

  permissions :show? do
    context 'when a course belongs to the current user' do
      let(:course) { build(:course, user: current_user) }

      it 'allows access' do
        expect(policy).to permit(current_user, course)
      end
    end

    context 'when a course does not belong to the current user' do
      let(:course) { build(:course, user: other_user) }

      it 'prevents access' do
        expect(policy).not_to permit(current_user, course)
      end
    end
  end
end
