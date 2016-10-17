module Novaposhta
  class Address < Base
    def self.get_cities
      body_of_query = make_body('Address', 'getCities')
      post_request(body_of_query)
    end

    def self.find_city(name)
      body_of_query = make_body('Address', 'getCities', {'FindByString' => name})
      post_request(body_of_query)
    end

    # населенные пункты
    def self.get_settlements
      body_of_query = make_body('AddressGeneral', 'getSettlements', {})
      post_request(body_of_query)
    end

    # области
    def self.get_areas
      body_of_query = make_body('Address', 'getAreas', {})
      post_request(body_of_query)
    end

    # отделения и типы компании
    def self.get_warehouses
      body_of_query = make_body('Address', 'getWarehouses', {})
      post_request(body_of_query)
    end

    # улицы
    def self.get_street(city_ref)
      body_of_query = make_body('Address', 'getStreet', {'CityRef' => city_ref})
      post_request(body_of_query)
    end

    # поиск улицы
    def self.find_street(city_ref, name)
      body_of_query = make_body('Address', 'getStreet', {'CityRef' => city_ref, 'FindByString' => name})
      post_request(body_of_query)
    end
  end
end