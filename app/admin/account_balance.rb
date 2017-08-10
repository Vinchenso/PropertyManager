ActiveAdmin.register AccountBalance do
  permit_params :uploadedTime, :uploadedDate, :amount, :bank_account_id

  form do |f|
    f.inputs 'Basic Information' do
      f.input :bank_account_id
      f.input :uploadedDate, as: :datepicker
      f.input :uploadedTime, as: :time_picker
      f.input :amount
      f.actions
    end
  end

  # index do
  #   selectable_column
  #   column :bank_account_id
  #   column :uploadedDate
  #   column :uploadedTime
  #   actions
  # end

  config.create_another = true
end
