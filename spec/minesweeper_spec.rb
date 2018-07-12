require './lib/minesweeper'

describe Minesweeper do

  let(:dimension)  { 5 }
  let(:difficulty) { :medium }


  context "should not  be return nil" do
      let(:minesweeper) { Minesweeper.new(dimension, difficulty) }

    it { expect(minesweeper).not_to eq(nil) }
    it { expect(minesweeper.board.dimension).to eq(5) }

  end
end
