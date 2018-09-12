require 'rails_helper'

describe NasaService do
  subject { NasaService.new("2018-09-08", "2018-09-14") }

  it 'exists' do
    expect(subject).to be_a NasaService
  end

  describe 'instance methods' do
    context 'asteroids' do
      it 'returns an array of hashes with asteroid data' do
        raw_asteroids = subject.asteroids
        raw_asteroid = subject.asteroids.first

        expect(raw_asteroids.count).to eq(2)
        expect(raw_asteroid).to have_key(:name)
        expect(raw_asteroid).to have_key(:neo_reference_id)
      end
    end
  end
end
