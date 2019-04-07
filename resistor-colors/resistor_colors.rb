class ResistorColors
  COLORMAP = %w[black brown red orange yellow green blue violet grey white].freeze

  def self.value(colors)
    colors.map { |color| COLORMAP.index(color) }.join.to_i
  end
end
