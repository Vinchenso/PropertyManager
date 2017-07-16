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

  scope :this_month, -> { where(date: DateTime.now.beginning_of_month..DateTime.now.end_of_month) }
end
