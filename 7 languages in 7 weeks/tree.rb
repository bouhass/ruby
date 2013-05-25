class Tree
  
  attr_accessor :name, :children
  
  def initialize hash, level=1
    @name = hash.keys.first
    @children = hash.values.first.collect do |child|
      Tree.new({child[0] => child[1]}, level+1)
    end
    @level = level
  end
  
  def to_s
    s = "| #{@name}\n"
    @children.each do |child|
      @level.times { s <<"--" }
      s <<"#{child}"
    end
    s
  end
end

t = Tree.new({
  'granpa' => {
    'dad' => {
      'child1' => {},
      'child2' => {}
    },
    'uncle' => {
      'child3' => {},
      'child4' => {}
    }
  }
})

puts t
