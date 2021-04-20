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

    it 'can add an activity' do
      activity_1 = Activity.new("Brunch")
      reunion.add_activity(activity_1)
      activity_1.add_participant("Maria", 20)
      activity_1.add_participant("Luther", 40)


      expect(reunion.activities).to eq([activity_1])
      expect(reunion.total_cost).to eq(60)
    end

    it 'can add another activity' do
      activity_2 = Activity.new("Drinks")
      activity_2.add_participant("Maria", 60)
      activity_2.add_participant("Luther", 60)
      activity_2.add_participant("Louis", 0)
      reunion.add_activity(activity_2)

      expect(reunion.total_cost).to eq(180)
    end

    it 'has a breakout method' do
      expect(reunion.breakout).to eq({"Maria" => -10, "Luther" => -30, "Louis" => 40})
    end
  end
end