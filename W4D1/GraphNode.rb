class GraphNode


    attr_accessor :value, :neighbors
    
    def initialize(value)
      @value = value
      @neighbors = []
    end
    
    def add_neighbor(node)
      @neighbors << node
    end


    def bfs(target = nil, &prc)
        raise 'Need a proc or target' if [target, prc].none?

        prc ||= Proc.new { |node| node.value == target }

        nodes = [self]
        until nodes.empty?
            node = nodes.shift

            return node if prc.call(node)
            nodes += node.children 
        end 

        nil 

     end 

    end

end


a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]
  