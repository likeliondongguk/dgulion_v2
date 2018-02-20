ActiveAdmin.register Course do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :curri_id, :user_id, :position, :main, :title, :content, :image

form do |f|
  f.inputs do
    f.input :curri
    f.input :user
    f.input :position
    f.input :main
    f.input :title
    f.input :content
    f.input :image
  end
  f.actions
end

end
