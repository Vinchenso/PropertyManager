ActiveAdmin.register Property do
  permit_params :name
  config.create_another = true
end
