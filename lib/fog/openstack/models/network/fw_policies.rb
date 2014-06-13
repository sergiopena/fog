require 'fog/core/collection'
require 'fog/openstack/models/network/fw_policy'

module Fog
  module Network
    class OpenStack
      class FwPolicies < Fog::Collection
        attribute :filters

        model Fog::Network::OpenStack::FwPolicy

        def initialize(attributes)
          self.filters ||= {}
          super
        end

        def all(filters = filters)
          self.filters = filters
          load(service.list_fw_policies(filters).body['firewall_policies'])
        end

        def get(firewallp_id)
          if firewallp = service.get_fw_policy(firewallp_id).body['firewall_policy']
            new(firewallp)
          end
        rescue Fog::Network::OpenStack::NotFound
          nil
        end
      end
    end
  end
end
