class ApplicationSerializer
  attr_accessor :object
  def initialize(object)
    @object = object
  end

  def hash
    raise NotImplementedError.new("You must implement `hash`")
  end
end
