class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def new
  end

  def create
    @property = Property.new(name: params["name"], price: params["price"], address: params["address"], age: params["age"], detail: params["detail"])
    @property.save

    @first_station = Station.new(property_id: @property.id, line_name: params["line_name_1"], name:  params["name_1"], distance:  params["distance_1"])
    @first_station.save
    
    @second_station = Station.new(property_id: @property.id, line_name: params["line_name_2"], name:  params["name_2"], distance:  params["distance_2"])
    @second_station.save

    redirect_to @property
  end

  def show
    @property = Property.find(params[:id])
    @stations = Station.where(property_id: @property.id)
  end

  def edit
    @property = Property.find(params[:id])
    @stations = Station.where(property_id: @property.id)
  end

  def update
    @property = Property.find(params[:id])
    @property.update(name: params["name"], price: params["price"], address: params["address"], age: params["age"], detail: params["detail"])
    @property.save

    stations = Station.where(property_id: @property.id)
    @first_station = stations[0]
    @second_station = stations[1]

    @first_station.update(property_id: @property.id, line_name: params["line_name_1"], name:  params["name_1"], distance:  params["distance_1"])
    @first_station.save
    
    @second_station.update(property_id: @property.id, line_name: params["line_name_2"], name:  params["name_2"], distance:  params["distance_2"])
    @second_station.save

    redirect_to @property
  end

  def destroy
    @property = Property.find(params[:id])
    @property.delete
    redirect_to properties_path
  end
end
