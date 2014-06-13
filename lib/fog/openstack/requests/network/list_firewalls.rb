module Fog
  module Network
    class OpenStack
      class Real
        def list_firewalls(filters = {})
          request(
            :expects => 200,
            :method  => 'GET',
            :path    => 'fw/firewalls',
            :query   => filters
          )
        end
      end

      class Mock
        def list_firewalls(filters = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
