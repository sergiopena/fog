require 'fog/core/model'

module Fog
  module Network
    class OpenStack
      class FwRule < Fog::Model
        identity :id

        attribute :name
        attribute :description
        attribute :source_ip_address
        attribute :source_port
        attribute :destination_ip_address
        attribute :destination_port
        attribute :protocol
        attribute :action

        def initialize(attributes)
          prepare_service_value(attributes)
          super
        end

        def save
          requires :protocol, :action
          identity ? update : create
        end

        def create
          requires :protocol, :action
          merge_attributes(service.create_fw_rule(self.protocol,
                                                    self.action,
                                                    self.attributes).body['firewall_rule'])
          self
        end

        def update
          requires :protocol, :action
          merge_attributes(service.update_fw_rule(self.id,
                                                    self.attributes).body['firewall_rule'])
          self
        end

        def destroy
          requires :id
          service.delete_fw_rule(self.id)
          true
        end
      end
    end
  end
end
