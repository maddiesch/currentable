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

  describe '#current=' do
    context 'given an invalid type' do
      class Test
        include Currentable::Instance
      end

      it 'raises an argument error' do
        expect { Test.current = :foo }.to raise_error ArgumentError do |error|
          expect(error.message).to eq 'foo (Symbol) is not an instance of Test'
        end
      end
    end
  end

  describe 'Currentable::Cleaner.clean_all' do
    class Foo
      include Currentable::Instance
    end

    class Bar
      include Currentable::Instance
    end

    it 'clears all' do
      Foo.current = Foo.new
      Bar.current = Bar.new
      expect(Foo).to receive(:current=).with(nil)
      expect(Bar).to receive(:current=).with(nil)
      Currentable::Cleaner.clean_all
    end
  end
end
