# VCF_tools

VCFTools is a Crystal shard designed for reading VCF files.
VCF is the main format used to store genomic variation in humans and other species.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  VCF_tools:
    github: diploidgenomics/VCF_tools
```

## Usage

```crystal
require "VCF_tools"

Vcf.new(file_path).each_variant do |variant|
  puts "#{variant.chromosome}:#{variant.position}"
end
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/diploidgenomics/VCF_tools/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [diploidgenomics](https://github.com/diploidgenomics) Peter Schols - creator, maintainer
