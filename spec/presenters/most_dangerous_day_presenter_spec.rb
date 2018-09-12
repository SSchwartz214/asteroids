require 'rails_helper'

describe MostDangerousDayPresenter do
  subject { MostDangerousDayPresenter.new("2018-09-08", "2018-09-14") }

  it "exists" do
    expect(subject).to be_a MostDangerousDayPresenter
  end

  context "instance methods" do
    context "#asteroids" do
      it 'returns asteroids within given dates that are dangerous' do
        expect(subject.asteroids.count).to eq 2
        expect(subject.asteroids.first).to be_a Asteroid
      end
    end
  end
end
