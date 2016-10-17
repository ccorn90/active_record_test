require 'rails_helper'

describe TestA do
  let(:a) { TestA.create }
  let(:bs) {
    [
      TestB.create(test_a: a),
      TestB.create(test_a: a),
      TestB.create(test_a: a),
      TestB.create(test_a: a),
      TestB.create(test_a: a),
    ]
  }

  before do
    a.update(singular_b: bs.last)
  end

  describe 'eager_load the parameters' do
    it 'has all 5 test_bs loaded and represented in properties correctly' do
      t = TestA.eager_load(:test_bs, :singular_b).first
      expect(t.singular_b).to eq(bs.last)
      expect(t.test_bs).to match_array(bs)
    end
  end
end
