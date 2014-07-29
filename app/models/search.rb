class Search
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveModel::Naming

  attr_accessor :key_word

  def initialize (key_word)
    @key_word = key_word
  end

  def search
    results= Location.where(name: @key_word)
  end  


end