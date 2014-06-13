require 'fog/core/model'

module Fog
  module Network
    class OpenStack
      class FwPolicy < Fog::Model
        identity :id

        attribute :audited
        attribute :description
        attribute :firewall_rules
        attribute :name
        attribute :shared
        attribute :tenant_id

        def initialize(attributes)
          prepare_service_value(attributes)
          super
        end

        def fw_rules
          service.fw_rules.select {|fr| fr.firewall_policy_id == self.id }
        end

        def save
          requires :name
          identity ? update : create
        end

        def create
          requires :name, :description
          merge_attributes(service.create_fw_policy(self.name,
                                                    self.description,
                                                    self.attributes ).body['firewall_policy'])          
          self
        end

        def update
          requires :name, :description
          merge_attributes(service.update_fw_policy(self.id,
                                                    self.attributes ).body['firewall_policy'])          
          self
        end

        def destroy
          requires :id
          service.delete_fw_policy(self.id)
          true
        end
      end
    end
  end
end
