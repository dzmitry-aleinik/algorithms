# frozen_string_literal: true

# Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.
#
# An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
#
#
#
# Example 1:
#
# Input: grid = [
#   ["1","1","1","1","0"],
#   ["1","1","0","1","0"],
#   ["1","1","0","0","0"],
#   ["0","0","0","0","0"]
# ]
# Output: 1
# Example 2:
#
# Input: grid = [
#   ["1","1","0","0","0"],
#   ["1","1","0","0","0"],
#   ["0","0","1","0","0"],
#   ["0","0","0","1","1"]
# ]
# Output: 3

# @param {Character[][]} grid
# @return {Integer}
def is_valid_cell(i, j, n, m)
  return false if i < 0 || j < 0
  return false if i >= n || j >= m

  true
end

def node(i, j)
  "#{i}-#{j}"
end

def get_i_index_from_node(node)
  node.split('-')[0].to_i
end

def get_j_index_from_node(node)
  node.split('-')[1].to_i
end

def neibour_cell_island?(grid, visited, i, j)
  n = grid.size
  m = grid[0].size
  is_valid_cell(i, j, n, m) && !visited[node(i + 1, j)] && grid[i][j] == '1'
end


def num_islands(grid)
  visited = {}
  queue = []
  n = grid.size
  m = grid[0].size
  num_of_islands = 0

  (0..n - 1).each do |i|
    (0..m - 1).each do |j|

      if !visited[node(i, j)] && grid[i][j] == '1'
        queue.push(node(i, j))
        num_of_islands += 1

        while !queue.empty?
          island_cell = queue.shift
          island_cell_i = get_i_index_from_node(island_cell)
          island_cell_j = get_j_index_from_node(island_cell)

          next if visited[node(island_cell_i, island_cell_j)]

          if neibour_cell_island?(grid, visited, island_cell_i + 1, island_cell_j)
            queue.push(node(island_cell_i + 1, island_cell_j))
          end

          if neibour_cell_island?(grid, visited, island_cell_i - 1, island_cell_j)
            queue.push(node(island_cell_i - 1, island_cell_j))
          end

          if neibour_cell_island?(grid, visited, island_cell_i, island_cell_j + 1)
            queue.push(node(island_cell_i, island_cell_j + 1))
          end

          if neibour_cell_island?(grid, visited, island_cell_i, island_cell_j - 1)
            queue.push(node(island_cell_i, island_cell_j - 1))
          end

          visited[node(island_cell_i, island_cell_j)] = true
        end
      end
    end
  end
  num_of_islands
end


grid = [
     ["1","1","0","0","0"],
     ["1","1","0","0","0"],
     ["0","0","1","0","0"],
     ["0","0","0","1","1"]
   ]

p num_islands(grid)