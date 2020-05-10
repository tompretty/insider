class CodeGenerator
  def self.call
    ("a".."z").to_a.shuffle[0, 4].join
  end
end
