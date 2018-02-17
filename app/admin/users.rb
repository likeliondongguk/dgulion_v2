ActiveAdmin.register User do
  menu parent: "회원관리"
  permit_params :name, :grade, :email, :image, :desc, :password
    index do
      selectable_column
      id_column
      column :email
      column :name
      column :image do |obj|
        image_tag obj.image.url, class: "thumb" if obj.image?
      end
      column :grade
      column :desc
      actions
    end

    filter :email
    filter :name
    filter :grade

    form do |f|
      f.inputs do
        f.input :email
        f.input :name
        f.input :grade
        f.input :image
        f.input :desc
        f.input :password
      end
      f.actions
    end
end
