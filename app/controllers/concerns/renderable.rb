module Renderable
  def render_serializable(data, serializer, options = {})
    options.reverse_merge!(status: 200) if options[:status].nil?
    render json: generate_hash(transform(data, serializer), options), status: options[:status]
  end

  def render_not_found(id, options = {})
    options.reverse_merge!(status: 404)
  end

  def render_serializable_error(errors, options = {})
    options.reverse_merge!(status: 500) if options[:status].nil?
    render json: generate_error(errors, options), status: options[:status]
  end

  def generate_hash(data, options)
    hash = Hash.new
    hash[:data] = data
    hash[:meta] = generate_meta(data, options)
    hash
  end

  def generate_error(errors, options)
    hash = Hash.new
    hash[:errors] = errors
    hash[:meta] = generate_meta(nil, options)
    hash
  end

  def generate_meta(data, options)
    hash = Hash.new
    hash[:status] = options[:status]
    hash.merge!({limit: options[:limit], offset: options[:offset]}) if data.is_a?(Array) && options[:limitation]
    hash
  end

  def transform(data, serializer)
    if data.is_a? Array
      data.map{ |single| serializer.new(single).hash }
    else
      serializer.new(data).hash
    end
  end
end
