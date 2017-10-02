module VCFTools
  struct Variant
    property chromosome : String
    property position : Int32
    property id : String
    property ref : String
    property alt : Array(String)
    property qual : Float32 | Nil
    property filter : String
    property info : String
    property sample : Hash(String, String)

    def initialize(@chromosome, @position, @id, @ref, @alt, @qual, @filter, @info, @sample)
    end
  end
end
