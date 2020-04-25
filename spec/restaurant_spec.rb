require "restaurant"

describe Restaurant do
  let(:subject) { described_class.new }
  
    #1) testing menu class @list variable
    #let(:menu) { Menu.new }

  it "responds to see_menu method" do
    expect(subject).to respond_to(:show_menu)
  end
  
  describe "#show_menu" do
    it "shows menu" do
        
      #1) testing menu class @list variable
      #expect(subject.show_menu).to eq menu.list
      
      #2) testing if restaurant's menu is {}
      expect(subject.show_menu).to be_kind_of(Hash)
    end
  end
  
end