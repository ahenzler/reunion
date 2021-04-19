require './lib/activity'
require './lib/reunion'

RSpec.describe Reunion do
  context 'exists' do
    reunion = Reunion.new("1406 BE")

    it 'exists' do
      expect(reunion).to be_instance_of(Reunion)
    end

    it 'has attributes' do
      expect(reunion.name).to eq("1406 BE")
      expect(reunion.activities).to eq([])
    end
  end

  context 'can modify activities' do
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")

    it 'can add activities' do
      activity_1 = Activity.new("Brunch")
      reunion.add_activity(activity_1)
      expect(reunion.activities).to eq([activity_1])
    end
  end
end