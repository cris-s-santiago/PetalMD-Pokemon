require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:pokemonNb) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:type1) }
  it { should validate_presence_of(:total) }
  it { should validate_presence_of(:hp) }
  it { should validate_presence_of(:attack) }
  it { should validate_presence_of(:defense) }
  it { should validate_presence_of(:spAtk) }
  it { should validate_presence_of(:spDef) }
  it { should validate_presence_of(:speed) }
  it { should validate_presence_of(:generation) }
  it { should validate_presence_of(:legendary) }
end
