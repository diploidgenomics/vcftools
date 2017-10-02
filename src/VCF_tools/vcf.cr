module VCFTools
  class Vcf
    property file_path : String

    def initialize(@file_path)
    end

    def each_variant(&block)
      File.open(file_path) do |f|
        f.each_line do |line|
          unless line.starts_with?("#") || line.empty?
            begin
              line_array = line.chomp.split("\t")
              chromosome = line_array[0].gsub("chr", "")
              position = line_array[1].to_i
              id = line_array[2]
              ref = line_array[3]
              alt = line_array[4].split(",")
              qual = line_array[5] == "." ? nil : line_array[5].to_f32
              filter = line_array[6]
              info = line_array[7]
              sample_format = line_array[8].split(":")
              sample_fields = line_array[9].split(":")
              sample = Hash(String, String).new
              begin
                sample_format.each_with_index do |field, index|
                  sample[field] = sample_fields[index]
                end
              rescue
                # Catch exceptions in cases where FORMAT is GT:AD:DP:GQ:PL, but we only have 0/1:10,20:30 in the sample field (i.e. fields are missing)
                puts "Variant #{chromosome}:#{position} sample field layout does not correspond to its FORMAT field\n#{sample_format} | #{sample_fields}\nIgnoring this variant\n-----------"
                next
              end

              variant = Variant.new(chromosome, position, id, ref, alt, qual, filter, info, sample)
              yield variant, line_array
            rescue exception
              puts "Error in #{line}\n"
              raise exception
            end
          end
        end
      end
    end
  end
end
