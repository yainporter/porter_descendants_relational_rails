# frozen_string_literal: true

Rspec.describe Descendant, type: :model do
  it "can combine first and last name for a full name" do
    descendant = Descendant.create(first_name: Rusty, last_name: Porter)

    expect(descendant.full_name).to eq("Rusty Porter")
  end
end
