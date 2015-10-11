class Verifier
  def initialize(subject)
    @subject = subject
  end

  def assert_attributes(attributes, *keys)
    keys.all? { |key| assert_attribute(attributes, key) }
  end

  def assert_attribute(attributes, key)
    assert_equal(attributes[key], key)
  end

  def assert_equal(value, key)
    if @subject[key] != value
      raise AttributeNotEqualError.new("#{key} is not equal, was #{@subject[key]} expected #{value}")
    else
      true
    end
  end

  def assert_exists(key)
    if @subject[key].blank?
      raise AttributeNotEqualError.new("Expected #{key} to exist")
    else
      true
    end
  end

  class AttributeNotEqualError < StandardError
  end
end
