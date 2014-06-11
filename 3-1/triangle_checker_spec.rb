require 'rspec'
require './triangle_checker'

RSpec.describe TriangleChecker do

  before do
    @checker = TriangleChecker.new
  end

  it "正三角形を判別すること" do
    expect(@checker.check(5, 5, 5)).to eq '正三角形'
  end

  it "直角三角形を判別すること" do
    expect(@checker.check(3, 4, 5)).to eq '直角三角形'
  end

end
