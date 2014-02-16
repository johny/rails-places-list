class Admin::AdminController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "testit"
  layout 'admin/layouts/application'
end
