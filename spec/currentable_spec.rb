require 'spec_helper'

require 'pry'

RSpec.describe Currentable do
  it 'has a version number' do
    expect(Currentable::VERSION).not_to be nil
  end

  describe 'registers a new class' do
    class Test
      include Currentable::Instance
    end

    it { expect(Currentable::Registry.currents).to include(Test) }
  end
end
