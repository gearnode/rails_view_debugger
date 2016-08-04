require 'spec_helper'

describe RailsViewDebugger do
  it 'has a version number' do
    expect(RailsViewDebugger::VERSION).not_to be nil
  end

  context 'when block is given' do

    it 'calls logger 3 times' do
      expect(RailsViewDebugger::LOGGER).to receive(:error).exactly(3).times
      expect{ RailsViewDebugger.trace { raise 'hello' } }.to raise_error
    end

    context 'when block raise' do

      it 'raises error' do
        expect{ RailsViewDebugger.trace { raise 'error' } }.to raise_error(StandardError)
      end
    end

    context 'when block raise nothing' do

      it 'raises nothing' do
        expect{ RailsViewDebugger.trace {} }.to_not raise_error
      end
    end
  end

  context 'when block is not given' do

    it 'returns nil' do
      expect(RailsViewDebugger.trace).to eq nil
    end
  end
end
