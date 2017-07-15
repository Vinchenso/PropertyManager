ActiveAdmin.register Tenant do
  permit_params :property_id, :name, :agent_id
end
