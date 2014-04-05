class Hash
  def filter(*keys)
    self.reject{|k,v| !keys.include?(k)}
  end
end