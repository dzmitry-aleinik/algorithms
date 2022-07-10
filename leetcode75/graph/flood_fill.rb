# frozen_string_literal: true

# Input: image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, color = 2
# Output: [[2,2,2],[2,2,0],[2,0,1]]
# Explanation: From the center of the image with position (sr, sc) = (1, 1) (i.e., the red pixel), all pixels connected by a path of the same color as the starting pixel (i.e., the blue pixels) are colored with the new color.
# Note the bottom corner is not colored 2, because it is not 4-directionally connected to the starting pixel.

# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} color
# @return {Integer[][]}

def set_graph_vertex(graph, i, j, neibour_i, neibour_j)
  graph["#{i},#{j}"] ||= []
  graph["#{i},#{j}"].push("#{neibour_i},#{neibour_j}")
  graph["#{neibour_i},#{neibour_j}"] ||= []
  graph["#{neibour_i},#{neibour_j}"].push("#{i},#{j}")
end

def set_by_compare(image, i, j, neibour_i, neibour_j, graph)
  return if neibour_i < 0
  return if neibour_i >= image.size
  return if neibour_j < 0
  return if neibour_j >= image[0].size

  if image[i][j] == image[neibour_i][neibour_j]
    set_graph_vertex(graph, i, j, neibour_i, neibour_j)
  end
end

def build_graph_from_image(image)
  graph = {}

  (0..image.size - 1).each do |i|
    (0..image[0].size - 1).each do |j|
      set_by_compare(image, i, j, i - 1, j, graph)
      set_by_compare(image, i, j, i, j - 1, graph)
      set_by_compare(image, i, j, i + 1, j, graph)
      set_by_compare(image, i, j, i, j + 1, graph)
    end
  end
  graph
end

def flood_fill(image, fill_i, fill_j, color)
  graph = build_graph_from_image(image)

  queue = [].push("#{fill_i},#{fill_j}")
  visited = {}

  until queue.empty?
    vertex = queue.shift
    visited[vertex] = true
    i = vertex.split(',')[0].to_i
    j = vertex.split(',')[1].to_i
    image[i][j] = color

    graph[vertex].each do |neibour_vertex|
      queue.push(neibour_vertex) unless visited[neibour_vertex]
    end
  end
  image
end

p flood_fill([[1, 1, 1], [1, 1, 0], [1, 0, 1]], 1, 1, 2)
