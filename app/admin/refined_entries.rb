ActiveAdmin.register RefinedEntry do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  csv do
    column :howtext
    column :name
    column :function
    column :company
    column :shape
    column :howword
    column :except
    column :companyinfo
  end
end
