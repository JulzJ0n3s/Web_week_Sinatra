require 'player'

describe Player do 
    subject(:dave) {Player.new('Dave')}
    subject(:mittens) {Player.new('Mittens')}

    describe '#name' do
        it "player name returned" do
            expect(dave.name).to eq 'Dave'
        end   
    end

    describe '#hit_points' do
        it "return the hit point" do
            expect(dave.hit_points).to eq described_class::DEFAULT_HIT_POINTS
        end   
    end

    describe '#receive_damage' do
        it 'reduces the player hit points' do
            expect { dave.receive_damage }.to change { dave.hit_points }.by (-10)
        end
    end


end
