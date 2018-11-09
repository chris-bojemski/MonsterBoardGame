class MonstersController < ApplicationController
  def index
    monsters = Monster.where(:id <= 151)
    render json: monsters
  end
end
