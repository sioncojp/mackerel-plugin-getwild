if ENV['MACKEREL_AGENT_PLUGIN_META'] == '1'
  require 'json'

  meta = {
    :graphs => {
      'TM NETWORK' => {
        :label   => 'GET WILD',
        :unit    => 'integer',
        :metrics => [
          {
            :name  => 'G',
            :label => 'hello.getwild.G'
          }, {
            :name  => 'E',
            :label => 'hello.getwild.E'
          }, {
            :name  => 'T',
            :label => 'hello.getwild.T'
          }, {
            :name  => 'W',
            :label => 'hello.getwild.W'
          }, {
            :name  => 'I',
            :label => 'hello.getwild.I'
          }, {
            :name  => 'L',
            :label => 'hello.getwild.L'
          }, {
            :name  => 'D',
            :label => 'hello.getwild.D'
          }
        ]
      }
    }
  }
  puts '# mackerel-agent-plugin'
  puts meta.to_json
  exit 0
end

G, E, T, W, I, L, D = nil

day = Time.now

### G
# 一番下の線
if day.strftime("%-M").to_i.between?(2, 7)
  G = 0
end
# 真ん中の線
if day.strftime("%-M").to_i.between?(6, 9)
  E = 5
end
# 一番上の線
if day.strftime("%-M").to_i.between?(2, 7)
  T = 10
end

# 左の上がり斜め線
if day.strftime("%-M").to_i == 0
  T = 5
elsif day.strftime("%-M").to_i == 1
  T = 7.5
end

# 左の下斜め線
if day.strftime("%-M").to_i == 0
  G = 5
elsif day.strftime("%-M").to_i == 1
  G = 2.5
end

# 右の上がり斜め線
if day.strftime("%-M").to_i == 8
  G = 5
end

# 右の下斜め線
if day.strftime("%-M").to_i == 8
  T = 8
end

### E
# 一番下の線
if day.strftime("%-M").to_i.between?(10, 14)
  W = 0
end
# 真ん中の線
if day.strftime("%-M").to_i.between?(11, 15)
  I = 5
end
# 一番上の線
if day.strftime("%-M").to_i.between?(12, 16)
  L = 10
end

# 斜め線
if day.strftime("%-M").to_i == 10
  D = 0
elsif day.strftime("%-M").to_i == 11
  D = 5
elsif day.strftime("%-M").to_i == 12
  D = 10
end

### T
# 一番上の線
if day.strftime("%-M").to_i.between?(18, 24)
  G = 10
end

# 斜め線
if day.strftime("%-M").to_i == 19
  E = 0
elsif day.strftime("%-M").to_i == 20
  E = 5
elsif day.strftime("%-M").to_i == 21
  E = 10
end

### W
# 一文字で
if day.strftime("%-M").to_i == 29
  W = 10
elsif day.strftime("%-M").to_i == 30
  W = 0
  E = 0
elsif day.strftime("%-M").to_i == 31
  E = 10
  G = 10
elsif day.strftime("%-M").to_i == 32
  G = 0
  L = 0
elsif day.strftime("%-M").to_i == 33
  L = 10
end

### I
# 一番上の線
if day.strftime("%-M").to_i.between?(36, 38)
  T = 10
end

# 一番下の線
if day.strftime("%-M").to_i.between?(34, 36)
  I = 0
end

# 斜め線
if day.strftime("%-M").to_i == 35
  L = 0
elsif day.strftime("%-M").to_i == 36
  L = 5
elsif day.strftime("%-M").to_i == 37
  L = 10
end

### L
# 一番下の線
if day.strftime("%-M").to_i.between?(39, 45)
  D = 0
end

# 斜め線
if day.strftime("%-M").to_i == 39
  G = 0
elsif day.strftime("%-M").to_i == 40
  G = 5
elsif day.strftime("%-M").to_i == 41
  G = 10
end

### D
# 一番下の線
if day.strftime("%-M").to_i.between?(47, 48)
  E = 0
end
# 一番上の線
if day.strftime("%-M").to_i.between?(49, 50)
  T = 10
end

# 左の上がり斜め線
if day.strftime("%-M").to_i == 47
  W = 0
elsif day.strftime("%-M").to_i == 48
  W = 5
elsif day.strftime("%-M").to_i == 49
  W = 10
end


# 右の上がり斜め線
if day.strftime("%-M").to_i == 49
  E = 1.5
elsif day.strftime("%-M").to_i == 50
  E = 3
end

# 右の下斜め線
if day.strftime("%-M").to_i == 51
  T = 8.5
elsif day.strftime("%-M").to_i == 52
  T = 7
end

# 最後の斜め線
if day.strftime("%-M").to_i == 51
  E = 5
elsif day.strftime("%-M").to_i == 52
  E = 7
end


puts [ 'hello.getwild.G', "#{G}", Time.now.to_i ].join("\t")
puts [ 'hello.getwild.E', "#{E}", Time.now.to_i ].join("\t")
puts [ 'hello.getwild.T', "#{T}", Time.now.to_i ].join("\t")
puts [ 'hello.getwild.W', "#{W}", Time.now.to_i ].join("\t")
puts [ 'hello.getwild.I', "#{I}", Time.now.to_i ].join("\t")
puts [ 'hello.getwild.L', "#{L}", Time.now.to_i ].join("\t")
puts [ 'hello.getwild.D', "#{D}", Time.now.to_i ].join("\t")
