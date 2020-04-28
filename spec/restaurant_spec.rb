require "restaurant"

describe Restaurant do
  let(:subject) { described_class.new }
  let(:order) { double :order }
  let(:menu) { double :menu }
  let(:item) { :tea }
  let(:quantity) { 2 }
  let(:amount) { 6 }
  let(:wrong_amount) { 7 }

  it "responds to see_menu method" do
    expect(subject).to respond_to(:show_menu)
  end
  
  describe "#show_menu" do
    it "shows menu" do
      allow(menu).to receive(:show)
      subject.show_menu
    end
  end
  
  describe "#select_items" do
    it "allows customer to select dishes" do
      allow(order).to receive(:place_order)
      subject.select_items
    end
  end
  
  describe "#summary" do
      it "shows the order with total" do
        allow(order).to receive(:print_order)
        subject.summary
      end
  end
  
  describe "#checkout" do
    
    context "amount is correct" do
      it "confirms order" do
        expect(subject.checkout(0)).to eq "Order confirmed!"
      end
    end
    
    context "amount is incorrect" do
      it "raises error" do
        allow(order).to receive(:total).and_return 6
        expect{subject.checkout(126)}.to raise_error "Incorrect amount"
      end
    end
  end
end