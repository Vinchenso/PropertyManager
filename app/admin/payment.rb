ActiveAdmin.register Payment do
  permit_params :date, :amount, :tenant_id


  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Basic Information' do
      f.input :tenant
      f.input :date , as: :datepicker
      f.input :amount
      f.actions
    end
  end

  config.create_another = true

end
