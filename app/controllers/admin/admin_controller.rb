class Admin::AdminController < ApplicationController
  http_basic_authenticate_with name: "johny", password: "securetestit"
  layout 'admin/layouts/application'
end
