class Image

  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def output_image
    @data.each do |row|
      p row
    end
  end

  def blur(distance=2)
    distance.times do
      get_coordinates
    end
  end

  private

    def get_coordinates
      coordinates = []
      @data.each_with_index do |row, row_index|
        row.each_with_index do |pixel, pixel_index|
          coordinates << [row_index, pixel_index] if pixel == 1
        end
      end
      

      coordinates.each do |coord|
        @data[coord[0]][coord[1] + 1] = 1 if coord[1] + 1 <= @data[coord[0]].length - 1
        # data[4][5] = 1
        @data[coord[0]][coord[1] - 1] = 1 if coord[1] - 1 >= 0
        @data[coord[0] + 1][coord[1]] = 1 if coord[0] + 1 <= @data.length - 1
        @data[coord[0] - 1][coord[1]] = 1 if coord[0] - 1 >= 0
      end
    end

end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
])
image.blur
image.output_image