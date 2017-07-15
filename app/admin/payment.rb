ActiveAdmin.register Payment do
  permit_params :date, :amount, :tenant_id
end
