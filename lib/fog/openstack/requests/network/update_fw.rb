module Fog
  module Network
    class OpenStack
      class Real
        def update_fw(fw_id, options = {})
          data = { 'firewall' => {} }

          vanilla_options = [:admin_state_up, :description, :firewall_policy_id, :name ]
          vanilla_options.select{ |o| options.key?(o) }.each do |key|
            data['firewall'][key] = options[key]
          end

          request(
            :body    => Fog::JSON.encode(data),
            :expects => 200,
            :method  => 'PUT',
            :path    => "fw/firewalls/#{fw_id}"
          )
        end
      end

      class Mock
        def update_fw(fw_id, options = {})
          Fog::Mock.not_implemented
        end
      end
    end
  end
end
