require 'rails_helper'

RSpec.describe AssignmentPolicy, type: :policy do
  subject(:policy) { AssignmentPolicy}
  let(:current_user) { create(:user) }
  let(:other_user) { create(:user) }

  permissions :new? do
    context 'when an assignment belongs to the current_user' do
      let(:assignment) { build(:assignment, user: current_user) }

      it 'allows access' do
        expect(policy).to permit(current_user, assignment)
      end
    end

    context 'when an assignment does not belong to the current_user' do
      let(:assignment) { build(:assignment, user: other_user) }

      it 'prevents access' do
        expect(policy).not_to permit(current_user, assignment)
      end
    end
  end
end
