module Novaposhta
  class Base
    def self.class_attr_accessor(*names)
      names.each do |name|
        define_singleton_method("#{name}=".to_sym){ |attr| eval("@@#{name.to_s} = #{attr}") }
        define_singleton_method(name.to_sym){ eval("@@#{name.to_s}") }
      end
    end

    class_attr_accessor :api_key, :sender, :format
  end
end