require './lib/activity'

RSpec.describe Activity do
  context 'exists' do
    activity = Activity.new("Brunch")

    it 'is a activity' do
      expect(activity).to be_instance_of(Activity)
    end

    it 'has attributes' do
      expect(activity.name).to eq("Brunch")
      expect(activity.participants).to eq({})
    end
  end

  context 'Add participants and generate total cost' do
    activity = Activity.new("Brunch")

    it 'can add participants' do
      activity.add_participant("Maria", 20)
      expect(activity.participants).to eq({"Maria" => 20})
      activity.add_participant("Luther", 40)
      expect(activity.participants).to eq({"Maria" => 20, "Luther" => 40})
    end

    it 'has a total cost' do
      activity.add_participant("Luther", 40)
      expect(activity.total_cost).to eq(60)
    end
  end
end