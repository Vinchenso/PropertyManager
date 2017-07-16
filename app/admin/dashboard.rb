ActiveAdmin.register_page "Dashboard" do

  content title: proc{ I18n.t("active_admin.dashboard") } do
    panel "Payments Schedule this month" do
      table_for Property.all do
        column :name
        column :tenant
        column :payments do |property|
          property.payments.sum(:amount)
        end
      end
    end
  end
end
