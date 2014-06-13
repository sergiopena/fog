require 'fog/core/collection'
require 'fog/openstack/models/network/fw_rule'

module Fog
  module Network
    class OpenStack
      class FwRules < Fog::Collection
        attribute :filters

        model Fog::Network::OpenStack::FwRule

        def initialize(attributes)
          self.filters ||= {}
          super
        end

        def all(filters = filters)
          self.filters = filters
          # load(service.list_routers(filters).body['firewall_rule'])
        end

        def get(fw_rule_id)
          if fw_rule = service.get_fw_rule(fw_rule_id).body['firewall_rule']
            new(fw_rule)
          end
        rescue Fog::Network::OpenStack::NotFound
          nil
        end
      end
    end
  end
end
