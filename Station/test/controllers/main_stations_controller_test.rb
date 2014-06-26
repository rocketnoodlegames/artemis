require 'test_helper'

class MainStationsControllerTest < ActionController::TestCase
  setup do
    @main_station = main_stations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:main_stations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create main_station" do
    assert_difference('MainStation.count') do
      post :create, main_station: { armor: @main_station.armor, defense: @main_station.defense, enemy: @main_station.enemy, medical: @main_station.medical, money: @main_station.money, name: @main_station.name, shields: @main_station.shields, ships: @main_station.ships, size: @main_station.size, weapons: @main_station.weapons }
    end

    assert_redirected_to main_station_path(assigns(:main_station))
  end

  test "should show main_station" do
    get :show, id: @main_station
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @main_station
    assert_response :success
  end

  test "should update main_station" do
    patch :update, id: @main_station, main_station: { armor: @main_station.armor, defense: @main_station.defense, enemy: @main_station.enemy, medical: @main_station.medical, money: @main_station.money, name: @main_station.name, shields: @main_station.shields, ships: @main_station.ships, size: @main_station.size, weapons: @main_station.weapons }
    assert_redirected_to main_station_path(assigns(:main_station))
  end

  test "should destroy main_station" do
    assert_difference('MainStation.count', -1) do
      delete :destroy, id: @main_station
    end

    assert_redirected_to main_stations_path
  end
end
