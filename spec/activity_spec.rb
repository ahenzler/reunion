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

    it 'has a way to split' do
      expect(activity.split).to eq(30)
    end

    it 'can show what is owed' do
      expect(activity.owed).to eq({"Maria" => 10, "Luther" => -10})
    end
  end
end