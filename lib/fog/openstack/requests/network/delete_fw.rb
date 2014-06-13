module Fog
  module Network
    class OpenStack
      class Real
        def delete_fw(fw_id)
          request(
            :expects  => 204,
            :method   => 'DELETE',
            :path     => "fw/firewalls/#{fw_id}"
          )
        end
      end

      class Mock
        def delete_fw(fw_id)
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
