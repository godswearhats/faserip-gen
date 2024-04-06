#!/usr/bin/ruby

class Character

  attr_accessor :form, :faserip

  def initialize
    generate_form
    generate_faserip
    generate_powers
  end

  def generate_form
    if ARGV[0].nil?
      @form = d100
    else
      @form = case ARGV[0][0]
              when 'a' then 1
              when 'm' then 31
              when 'h' then 71
              else d100
              end
    end
  end

  def generate_faserip
    @faserip = Array.new
    7.times {@faserip.push make_stat}
  end

  def generate_powers
    num = number_of_powers
    @powers = Array.new
    num.times {@powers.push generate_power}
  end

  def print_powers
    @powers.each {|power| printf "%40s: %s\n", power, abbreviate( column1(d100) ) }
  end

  def number_of_powers
    case d100
    when 1..12 then 1
    when 13..26 then 2
    when 27..41 then 3
    when 42..55 then 4
    when 56..66 then 5
    when 67..75 then 2
    when 76..83 then 7
    when 84..89 then 8
    when 90..94 then 9
    when 95..97 then 10
    when 98..99 then 12
    when 100 then 14
    end
  end

  def make_stat
    if self.high_tech_hero
      column3 d100
    else
      column1 d100
    end
  end

  def high_tech_hero
    @form > 70
  end

  def column1(score)
    case score
    when 1..5
      :feeble
    when 6..10
      :poor
    when 11..20
      :typical
    when 21..40
      :good
    when 41..60
      :excellent
    when 61..80
      :remarkable
    when 81..96
      :incredible
    when 97..100
      :amazing
    end
  end

  def column3(score)
    case score
    when 1..5
      :feeble
    when 6..10
      :poor
    when 11..40
      :typical
    when 41..80
      :good
    when 81..95
      :excellent
    when 96..100
      :remarkable
    end
  end

  def column4(score)
    case score
    when 1..5
      :feeble
    when 6..10
      :poor
    when 11..15
      :typical
    when 16..40
      :good
    when 41..50
      :excellent
    when 51..70
      :remarkable
    when 71..90
      :incredible
    when 91..98
      :amazing
    when 99..100
      :monstrous
    end
  end

  def form
    case @form
    when 1..30
      "Altered Human"
    when 31..70
      "Mutant"
    when 71..100
      "Hi-Tech Hero"
    end
  end

  def print_faserip
    ctr = 0
    Character.stat_list.each do |stat|
      printf "%40s: %s\n", stat, abbreviate(@faserip[ctr])
      ctr += 1
    end
  end

  def d100
    rand(100) + 1
  end
  
  def abbreviate(sym)
    case sym
      when :feeble
      "FE"
      when :poor
      "PR"
      when :typical
      "TY"
      when :good
      "GD"
      when :excellent
      "EX"
      when :remarkable
      "RM"
      when :incredible
      "IN"
      when :amazing
      "AM"
      when :monstrous
      "MN"
      when :unearthly
      "UN"
    else
      sym.to_s
    end
  end

  def self.stat_list
    ["Fighting", "Agility", "Strength", "Endurance", "Reason", "Intuition", "Psyche"]
  end

  def defensive
    case d100
    when 1..15 then "Body Armor D1"
    when 16..20 then "Force Field D2"
    when 21..23 then "Force Field vs. Emotion D3"
    when 24..30 then "Force Field vs. Energy D4"
    when 31..35 then "Force Field vs. Magic D5"
    when 36..40 then "Force Field vs. Mental D6"
    when 41..48 then "Force Field vs. Physical D7"
    when 49..50 then "Force Field vs. Power Manipulation D8"
    when 51..53 then "Force Field vs. Vampirism D9"
    when 54..65 then "Reflection D10"
    when 66..70 then "Resist: Emotion D11"
    when 71..77 then "Resist: Energy D12"
    when 78..82 then "Resist: Magic D13"
    when 83..87 then "Resist: Mental D14"
    when 88..94 then "Resist: Physical D15"
    when 95..97 then "Resist: Power Manipulation D16"
    when 98..100 then "Resist: Vampirism D17"
    end
  end

  def detection
    case d100
		when   1..2 then "Abnormal Sensitivity DT1"
		when   3..4 then "Circular Vision DT2"
		when   5..10 then "Energy Detection DT3"
		when   11..14 then "Environmental Awareness DT4"
		when   15..20 then "Extradimensional DT5"
		when   21..28 then "Hyper-Hearing DT6"
		when   29..34 then "Hyper-Olfactory DT7"
		when   35..40 then "Hyper-Touch DT8"
		when   41..42 then "Life Detection DT9"
		when   43..44 then "Magic Detection DT10"
		when   45..50 then "Microscopic Vision DT11"
		when   51..54 then "Penetration Vision DT12"
		when   55..56 then "Power Detection DT13"
		when   57..58 then "Psionic Detection DT14"
		when       59 then "Radarsense DT15"
		when   60..62 then "Sonar DT16"
		when   63..69 then "Telescopic Vision DT17"
		when   70..79 then "Thermal Vision DT18"
		when   80..90 then "Tracking DT19"
		when   91..94 then "True Sight DT20"
		when   95..98 then "UV Vision DT21"
		when   99..100 then "Weakness Detection DT22"
    end
  end

  def energy_control
    case d100
		when 1..7 then "Absorption Power EC1"
		when 8..10 then "Catalytic Control EC2"
		when 11..15 then "Coldshaping EC3"
		when 16..18 then "Darkforce Manipulation EC4"
		when 19..25 then "Electrical Control EC5"
		when 26..28 then "Energy Conversion EC6"
		when 29..31 then "Energy Solidification EC7"
		when 32..36 then "Energy Sponge EC8"
		when 37..38 then "Energy Vampirism EC9"
		when 39..45 then "Fire Control EC10"
		when 46..49 then "Gravity Manipulation EC11"
		when 50..53 then "Hard Radiation Control EC12"
		when 54..59 then "Kinetic Control EC13"
		when 60..66 then "Light Control EC14"
		when 67..73 then "Magnetic Manipulation EC15"
		when 74..77 then "Plasma Control EC16"
		when 78..80 then "Radiowave Control EC17"
		when 81..84 then "Shadowshaping EC18"
		when 85..90 then "Sound Manipulation EC19"
		when 91..97 then "Thermal Control EC20"
		when 98..100 then "Vibration Control EC21"
    end
  end

  def energy_emission
    case d100
		when 1..10 then "Cold Generation EE1"
		when 11..20 then "Electrical Generation EE2"
		when 21..22 then "Energy Doppelganger EE3"
		when 23..34 then "Fire Generation EE4"
		when 35..37 then "Hard Radiation EE5"
		when 38..42 then "Heat EE6"
		when 43..52 then "Kinetic Bolt EE7"
		when 53..62 then "Light Emission EE8"
		when 63..72 then "Magnetism EE9"
		when 73..75 then "Plasma Generation EE10"
		when 76..78 then "Radiowave Generation EE11"
		when 79..83 then "Shadowcasting EE12"
		when 84..93 then "Sonic Generation EE13"
		when 94..100 then "Vibration EE14"
    end
  end

  def fighting
    case d100
		when 1..20 then "Berserker F1"
		when 21..60 then "Martial Supremacy F2"
		when 61..75 then "Natural Weaponry F3"
		when 76..80 then "Weapons Creation* F4"
		when 81..100 then "Weapons Tinkering F5"
    end
  end

  def illusionary
    case d100
		when 1..15 then "Animate Image I1"
		when 16..70 then "Illusion-Casting* I2"
		when 71..85 then "Illusory Invisibility I3"
		when 86..100 then "Illusory Duplication I4"
    end
  end

  def lifeform_control
    case d100
		when 1..14 then "Biophysical Control* L1"
		when 15 then "Bio..Vampirism * L2"
		when 16..18 then "Body TransformationOthers L3"
		when 19..26 then "Emotion Control L4"
		when 27..32 then "Exorcism L5"
		when 33..34 then "Force Field vs. Hostiles L6"
		when 35 then "Forced Reincarnation L7"
		when 36..39 then "Grafting* L8"
		when 40..51 then "Hypnotic Control L9"
		when 52..60 then "Mind Control* L10"
		when 61..62 then "Mind Transferral* L11"
		when 63..65 then "Neural Manipulation L12"
		when 66 then "Plague Carrier L13"
		when 67..69 then "Plant Control L14"
		when 70..71 then "Plant Growth L15"
		when 72..80 then "Sense Alteration L16"
		when 81..83 then "Shapechange-Others* L17"
		when 84..89 then "Sleep-Induced L18"
		when 90 then "Spirit Storage L19"
		when 91..95 then "Summoning L20"
		when 96..100 then "Undead Control L21"
    end
  end

  def magic
    case d100
		when 1..8 then "Enchantment* MG1"
		when 9..15 then "Energy Source MG2"
		when 16..17 then "Internal Limbo MG3"
		when 18..25 then "Magic Control* MG4"
		when 26..28 then "Magic Creation* MG5"
		when 29..33 then "Magic Domination MG6"
		when 34..39 then "Magic Transferral MG7"
		when 40..41 then "Magic Vampirism MG8"
		when 42..71 then "Power Simulation MG9"
		when 72..77 then "Reality Alteration* MG10"
		when 78..79 then "Spirit Vampirism* MG11"
		when 80..95 then "Sympathetic Magic MG12"
		when 96..100 then "Warding MG13"
    end
  end

  def matter_control
    case d100
		when 1..5 then "Bonding MC1"
		when 6..17 then "Collection MC2"
		when 18..22 then "Crystallization MC3"
		when 23..29 then "Diminution MC4"
		when 30..39 then "Disruption MC5"
		when 40..46 then "Enlargement MC6"
		when 47..51 then "Geoforce MC7"
		when 52..61 then "Matter Animation* MC8"
		when 62..68 then "Machine Animation* MC9"
		when 69..73 then "Micro-Environment MC10"
		when 74..83 then "Molding MC11"
		when 84..93 then "Weather MC12"
		when 94..100 then "Zombie Animation* MC13"
    end
  end

  def matter_conversion
    case d100
		when 1..10 then "Coloration MCo1"
		when 11..25 then "Combustion MCo2"
		when 26..45 then "Disintegration MCo3"
		when 46..70 then "Elemental Conversion* MCo4"
		when 71..80 then "Ionization MCo5"
		when 81..100 then "Molecular Conversion* MCo6"
    end
  end

  def matter_creation
    case d100
		when 1..10 then "Artifact Creation* MCr1"
		when 11..24 then "Elemental Creation MCr2"
		when 25..29 then "Lifeform Creation* MCr3"
		when 30..35 then "Mechanical Creation* MCr4"
		when 36..59 then "Missile Creation MCr5"
		when 60..69 then "Molecular Creation MCr6"
		when 70..88 then "Spray MCr7"
		when 89..100 then "Webcasting MCr8"
    end
  end

  def mental_enhancement
    case d100
		when 1..4 then "Clairaudience M1"
		when 5..8 then "Clairvoyance M2"
		when 9..11 then "Communicate with Animals M3"
		when 12 then "Communicate with Cybernetics M4"
		when 13 then "Communicate with Non..Living M5"
		when 14..15 then "Communicate with Plants M6"
		when 16 then "Cosmic Awareness* M7"
		when 17..22 then "Danger Sense M8"
		when 23 then "Dreamtravel M9"
		when 24..26 then "Empathy M10"
		when 27 then "Free Spirit* M11"
		when 28..31 then "Hallucinations* M12"
		when 32..40 then "Hyper-Intelligence M13"
		when 41..47 then "Hyper-Invention M14"
		when 48 then "Incarnation Awareness M15"
		when 49..58 then "Iron Will M16"
		when 59..65 then "Linguistics M17"
		when 66 then "Mental Duplication M18"
		when 67 then "Mental Invisibility M19"
		when 68..69 then "Mental Probe M20"
		when 70..72 then "Mind Blast M21"
		when 73 then "Mind Drain M22"
		when 74 then "Postcognition M23"
		when 75 then "Precognition* M24"
		when 76 then "Psionic Vampirism* M25"
		when 77..78 then "Remote Sensing M26"
		when 79 then "Sensory Link M27"
		when 80 then "Serial Immortality* M28"
		when 81 then "Speechthrowing M29"
		when 82..85 then "Telekinesis M30"
		when 86 then "Telelocation M31"
		when 87..96 then "Telepathy M32"
		when 97..100 then "Total Memory M33"
    end
  end

  def physical_enhancement
    case d100
		when 1..14 then "Armor Skin P1"
		when 15..28 then "Body Resistance P2"
		when 29..30 then "Chemical Touch P3"
		when 31..33 then "Digestive Adaptation P4"
		when 34..40 then "Hyper-Speed P5"
		when 41..42 then "Hypnotic Voice P6"
		when 43..45 then "Lung Adaptability P7"
		when 46..47 then "Pheromones P8"
		when 48..60 then "Regeneration* P9"
		when 61..62 then "Self-Revival* P10"
		when 63..67 then "Self-Sustenance P11"
		when 68..71 then "Stealth P12"
		when 72..76 then "Suspended Animation P13"
		when 77..78 then "True Invulnerability* P14"
		when 79..82 then "Vocal Control P15"
		when 83..90 then "Waterbreathing P16"
		when 91..100 then "Water Freedom P17"
    end
  end

  def power_control
    case d100
		when 1..8 then "Control* PC1"
		when 9..12 then "Creation PC2"
		when 13..18 then "Domination* PC3"
		when 19..23 then "Duplication PC4"
		when 24..37 then "Energy Source PC5"
		when 38..39 then "Energy Source Creation* PC6"
		when 40..49 then "Focus PC7"
		when 50..55 then "Gestalt PC8"
		when 56..60 then "Nemesis PC9"
		when 61..64 then "Power Transferral PC10"
		when 65..73 then "Power Vampirism * PC11"
		when 74..83 then "Residual Absorption PC12"
		when 84..96 then "Selection PC13"
		when 97..100 then "Weakness Creation* PC14"
    end
  end

  def self_alteration
    case d100
		when 1..2 then "Age-Shift S1"
		when 3..9 then "Alter Ego S2"
		when 10 then "Anatomical Separation S3"
		when 11..13 then "Animal Transformation S4"
		when 14..19 then "Animal Mimicry S5"
		when 20..21 then "Blending S6"
		when 21..27 then "Body Adaptation* S7"
		when 28..30 then "Body Transformation* S8"
		when 31..33 then "Body Coating S9"
		when 34..37 then "Bouncing Ball S10"
		when 38 then "Chemical Mimicry S11"
		when 39..42 then "Elongation S12"
		when 43..44 then "Energy Body* S13"
		when 45..49 then "Energy Sheath S14"
		when 50..55 then "Evolution S15"
		when 56..57 then "Growth S16"
		when 58 then "Imitation-Face Changer S17"
		when 59..60 then "Imitation-Human Changeling S18"
		when 61 then "Invisibility S19"
		when 62 then "Mass Decrease S20"
		when 63 then "Mass Increase S21"
		when 64..67 then "Phasing S22"
		when 68..70 then "Physical Gestalt S23"
		when 71 then "Plant Mimicry S24"
		when 72..74 then "Plasticity S25"
		when 75..78 then "Prehensile Hair S26"
		when 79..81 then "Self-Duplication* S27"
		when 82..84 then "Self-Vegetation S28"
		when 85..90 then "Shapeshifting S29"
		when 91..94 then "Shrinking S30"
		when 95..99 then "Spirit Gestalt S31"
		when 100 then "Two-dimensionality S32"
    end
  end

  def travel
    case d100
		when 1..2 then "Astral Body T1"
		when 3..6 then "Carrier Wave T2"
		when 7..10 then "Dimension Travel T3"
		when 11..12 then "Energy Path T4"
		when 13..14 then "Floating Disc T5"
		when 15..20 then "Gateway* T6"
		when 21..26 then "Gliding T7"
		when 27..28 then "Hyper-Digging T8"
		when 29..34 then "Hyper-Leaping T9"
		when 35..42 then "Hyper-Running T10"
		when 43..46 then "Hyper-Swimming T11"
		when 47..52 then "Levitation T12"
		when 52..56 then "Rocket T13"
		when 57..58 then "Skywalk T14"
		when 59..64 then "Spiderclimb T15"
		when 65..72 then "Teleport Self* T16"
		when 73..76 then "Teleport Others* T17"
		when 77..78 then "Telereformation T18"
		when 79..80 then "Time Travel* T19"
		when 81..82 then "Troubleseeker T20"
		when 83..93 then "True Flight T21"
		when 94..97 then "Water Walking T22"
		when 98..100 then "Whirlwind T23"
    end
  end

  def generate_power
    case d100
    when 1..5 then defensive
    when 6..11 then detection
    when 12..16 then energy_control
    when 17..24 then energy_emission
    when 25..29 then fighting
    when 30..31 then illusionary
    when 32..35 then lifeform_control
    when 36..40 then magic
    when 41..47 then matter_control
    when 48..53 then matter_conversion
    when 54..57 then matter_creation
    when 58..71 then mental_enhancement
    when 72..85 then physical_enhancement
    when 86..88 then power_control
    when 89..92 then self_alteration
    when 93..100 then travel
    end
  end

  def print_form
    printf "%40s: %s\n", "Form", self.form
  end

  def print
    self.print_form
    puts
    self.print_faserip
    puts
    self.print_powers
  end

end

Character.new.print
