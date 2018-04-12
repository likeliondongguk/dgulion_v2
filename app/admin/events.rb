ActiveAdmin.register Event do
  menu parent: "대나무숲관리"
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :title,:content, :image
  index do
    selectable_column
    id_column
    column :title
    column :image do |obj|
      image_tag obj.image.url, class: "thumb" if obj.image_data?
    end
    column :content
    actions
  end
  form do |f|
    f.inputs do
      f.input :title
      f.input :content
      # f.inputs "Upload" do
        f.input :image, required: true, as: :file
      # end
    end
    f.actions
  end
  show do
    attributes_table do
      row :title
      row :image do |ad|
        image_tag ad.image.url, class: "big" if ad.image_data?
      end
      row :content
    end
    panel '일반 댓글' do
      event.ecomments.public_comments.each_with_index do |f,i|
        attributes_table_for f do
          # rows :body, :secret
          row i+1 do
            p f.body
            # p f.secret
          end
        end
      end
    end
    panel '비밀 댓글' do
      event.ecomments.secret_comments.each_with_index do |f,i|
        attributes_table_for f do
          # rows :body, :secret
          row i+1 do
            p f.body
            # p f.secret
          end
        end
      end
    end
  end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
