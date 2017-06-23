class Cue < ApplicationRecord

  def self.random_cue(collection, refresh=false)
    @cue = nil if refresh

    array = collection.to_a
    random_position = rand(array.length)

    @cue ||= array[random_position]
  end

end
