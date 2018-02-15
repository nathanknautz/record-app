class UserRecordsController < ApplicationController
  belongs_to :record 
  belongs_to :user
end
