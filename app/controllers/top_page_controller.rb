class TopPageController < ApplicationController
  def index
    @last_result = Name.maximum('result_no')
  end
end
