require 'attack'
require 'player'

describe Attack do
    subject(:object) { described_class }
    let(:player) { double :player }

    describe '.run' do
        it 'damage the player' do 
        expect(object.run.(player)).to receive(:receive_damage) 
        object.run.(player) 
        end
    end
end