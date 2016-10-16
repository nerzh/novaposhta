module Novaposhta
  class Base
    def self.class_attr_accessor(*names)
      names.each do |name|
        define_singleton_method("#{name.to_s}=".to_sym){ |attr| eval("@@#{name.to_s} = #{attr}") }
        define_singleton_method(name.to_sym){ eval("@@#{name.to_s}") }
      end
    end

    class_attr_accessor :url, :api_key, :sender, :format

    def post_request(body)
      url     = URI( self.class.url.gsub(/\{format\}/, "#{self.class.format.to_s}") )
      request = Net::HTTP::Post.new(url)
      if self.class.format.to_sym == :json
        request.content_type = 'application/json'
        request.body.to_json
      else
        raise "#{self.class.format.to_s.upcase} does not work now"
      end
      response = Net::HTTP.start(url.host, url.port, :use_ssl => url.scheme == 'https') do |http|
        http.request request
      end
      response.body
    end
  end
end