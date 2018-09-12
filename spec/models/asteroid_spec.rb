require 'rails_helper'

describe Asteroid do
  let(:attrs) {
    {
      name: "hi",
      id: "1"
    }
  }

  subject { Asteroid.new(attrs) }

  it "exists" do
    expect(subject).to be_a Asteroid
  end

  context 'instance_methods'
    context '#name' do
      it 'returns a name' do
        expect(subject.name).to eq("hi")
      end
    end
end
