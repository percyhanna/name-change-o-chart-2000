BASE_ORD = ?a.ord
NAME_SERIES = [
  %w[
    stinky
    lumpy buttercup
    gidget
    crusty
    greasy
    fluffy
    cheeseball
    chim-chim
    poopsie
    flunky
    booger
    pinky
    zippy
    goober
    doofus
    slimy
    loopy
    snotty
    falafel
    dorky
    squeezit
    oprah
    skipper
    dinky
    zsa-zsa
  ],
  %w[
    diaper
    toilet
    giggle
    bubble
    girdle
    barf
    lizard
    waffle
    cootie
    monkey
    potty
    liver
    banana
    rhino
    burger
    hamster
    toad
    gizzard
    pizza
    gerbil
    chicken
    pickle
    chuckle
    tofu
    gorilla
    stinker
  ],
  %w[
    head
    mouth
    face
    nose
    tush
    breath
    pants
    shorts
    lips
    honker
    butt
    brain
    tushie
    chunks
    hiney
    biscuits
    toes
    buns
    fanny
    sniffer
    sprinkles
    kisser
    squirt
    humperdinck
    brains
    juice
  ]
]

puts "Please enter your name:"
name = gets.chomp.downcase

puts "Original formula, or individual letters? ([O]riginal, [i]ndividual)"
original_mode = ['o', ''].include?(gets.chomp.downcase)

def word_for_letter(letter, index)
  NAME_SERIES[index % NAME_SERIES.size][letter.ord - BASE_ORD]
end

words =
  if original_mode
    first, *last = name.split(/\s+/)

    [
      word_for_letter(first[0], 0),
      word_for_letter(last.join('')[0], 1),
      word_for_letter(last.join('')[-1], 2),
    ]
  else
    name.chars.select { |c| c =~ /\w/ }.each_with_index.map { |c, i| word_for_letter(c, i) }
  end

puts words.join(' ')

exec("say #{words.join(' ')}")
