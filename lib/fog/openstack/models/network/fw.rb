require 'fog/core/model'

module Fog
  module Network
    class OpenStack
      class Fw < Fog::Model
        identity :id

        attribute :admin_state_up
        attribute :description
        attribute :firewall_policy_id
        attribute :name
        attribute :status
        attribute :tenant_id

        def initialize(attributes)
          prepare_service_value(attributes)
          super
        end

        def save
          requires :name
          identity ? update : create
        end

        def create
          requires :name
          merge_attributes(service.create_fw(self.name,
                                             self.attributes ).body['firewall'])
          self
        end

        def update
          # THis shit is not done at all

          requires :name
          merge_attributes(service.update_fw(self.id,
                                            self.attributes).body['firewall'])
          self
        end

        def destroy
          requires :id
          service.delete_fw(self.id)
          true
        end
      end
    end
  end
end
