module HuntsHelper
  def get_json_for_hunts hunts_streets
    streets_array = hunts_streets.map do |hs|
      hs.hunt.streets.map do |street|
        street
      end
    end.flatten.to_json

  end
end