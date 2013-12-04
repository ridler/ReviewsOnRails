class RestaurantsController < ApplicationController
  # GET /restaurants
  # GET /restaurants.json
  def index
    @api_key = Restaurant.gMapsAPIkey
    sort = params[:sort] || session[:sort]
    case sort
    when 'price'
      ordering = 'averagePrice asc'
    when 'rating'
      ordering = 'averageRating desc'
    end
    @all_cuisines = Restaurant.cuisines
    @selected_cuisines = params[:cuisines] || session[:cuisines] || {}
    
    if @selected_cuisines == {}
      @selected_cuisines = Hash[@all_cuisines.map {|cuisine| [cuisine, cuisine]}]
    end
    
    if params[:sort] != session[:sort] or params[:cuisines] != session[:cuisines]
      session[:sort] = sort
      session[:cuisines] = @selected_cuisines
      redirect_to :sort => sort, :cuisines => @selected_cuisines and return
    end

    @restaurants = Restaurant.where(cuisine: @selected_cuisines.keys).order(ordering)
    @markers = Gmaps4rails.build_markers(@restaurants) do |restaurant, marker|
      marker.lat restaurant.latitude
      marker.lng restaurant.longitude
      marker.title restaurant.name
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @restaurants }
    end

  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @restaurant = Restaurant.find(params[:id])
    # @reviews = []
    # @restaurant.reviews.each do |review|
    #   @reviews << [review.content, review.stars, review.price, review.user.username]
    # end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @restaurant }
    end
  end

  # GET /restaurants/new
  # GET /restaurants/new.json
  def new
    @restaurant = Restaurant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restaurant }
    end
  end

  # GET /restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(params[:restaurant])
    
    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render json: @restaurant, status: :created, location: @restaurant }
      else
        format.html { render action: "new" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /restaurants/1
  # PUT /restaurants/1.json
  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :ok }
    end
  end
end
